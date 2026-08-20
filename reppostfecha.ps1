<#
.SYNOPSIS
    Determina la fecha REAL en que los commits de un autor llegaron al repositorio,
    cruzando los metadatos locales de Git (falsificables) con las marcas de tiempo
    del servidor de GitHub (no falsificables por el cliente).

.DESCRIPTION
    Git guarda la fecha de autor (%aI) y la fecha de committer (%cI) como simples
    campos de texto dentro del objeto commit, escritos por el cliente local. Ambas
    pueden fijarse a voluntad con --date, GIT_COMMITTER_DATE, --amend o rebase.
    La unica evidencia temporal confiable es el instante en que GitHub recibio el
    push, que se consulta con la API de "repository activities" o de "events".

    Este script asigna a cada commit el primer push del servidor que lo introdujo
    en el repositorio remoto, y marca los que llegaron despues de la fecha de corte.

.EXAMPLE
    .\Auditar-Commits.ps1 -Autor "jmaciasherr4" -Corte "2026-08-05T23:59:59-05:00"

.NOTES
    Requisitos: git y GitHub CLI (gh) autenticado con 'gh auth login'.
#>

[CmdletBinding()]
param(
	[string]   $Autor         = "jmaciasherr4",
	[string]   $Corte         = "2026-08-05T23:59:59-05:00",
	[string]   $RepoPath      = ".",
	[string]   $Salida        = "auditoria_commits.csv",
	[string]   $ActividadJson = "",
	[switch]   $SinFetch
)

$ErrorActionPreference = "Stop"
$CEROS = "0000000000000000000000000000000000000000"

# ---------------------------------------------------------------------------
# 1. Validaciones iniciales
# ---------------------------------------------------------------------------

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
	throw "No se encontro 'git' en el PATH."
}

# ConvertFrom-Json convierte las cadenas ISO en [datetime] y puede perder el
# desfase horario. Esta funcion normaliza cualquier entrada a [datetimeoffset]
# preservando el instante real, para que la comparacion con el corte sea exacta.
function ConvertTo-Dto {
	param($Valor)
	if ($null -eq $Valor) { return $null }
	if ($Valor -is [datetimeoffset]) { return $Valor }
	if ($Valor -is [datetime]) {
		$d = [datetime]$Valor
		if ($d.Kind -eq [System.DateTimeKind]::Unspecified) {
			$d = [datetime]::SpecifyKind($d, [System.DateTimeKind]::Utc)
		}
		return [datetimeoffset]$d
	}
	return [datetimeoffset]::Parse(
		[string]$Valor,
		[System.Globalization.CultureInfo]::InvariantCulture,
		[System.Globalization.DateTimeStyles]::AssumeUniversal
	)
}

Push-Location $RepoPath
try {
	$dentroDeRepo = (& git rev-parse --is-inside-work-tree 2>$null)
	if ($LASTEXITCODE -ne 0 -or $dentroDeRepo -ne "true") {
		throw "La ruta '$RepoPath' no es un repositorio Git."
	}

	$fechaCorte = ConvertTo-Dto $Corte
	Write-Host "Fecha de corte : $($fechaCorte.ToString('yyyy-MM-dd HH:mm:ss zzz'))" -ForegroundColor Cyan
	Write-Host "Autor buscado  : $Autor" -ForegroundColor Cyan

	# -------------------------------------------------------------------
	# 2. Traer todo el historial remoto (incluidas ramas no descargadas)
	# -------------------------------------------------------------------

	if (-not $SinFetch) {
		Write-Host "`nDescargando referencias remotas..." -ForegroundColor DarkGray
		& git fetch --all --prune --tags --quiet 2>$null | Out-Null
	}

	# -------------------------------------------------------------------
	# 3. Identificar owner/repo a partir del remoto 'origin'
	# -------------------------------------------------------------------

	$owner = $null
	$repo  = $null
	$urlOrigin = (& git config --get remote.origin.url 2>$null)
	if ($urlOrigin -match 'github\.com[:/]+([^/]+)/(.+?)(\.git)?$') {
		$owner = $Matches[1]
		$repo  = $Matches[2]
		Write-Host "Repositorio    : $owner/$repo" -ForegroundColor Cyan
	}

	# -------------------------------------------------------------------
	# 4. Obtener los eventos del servidor (fechas reales de push)
	# -------------------------------------------------------------------

	$eventos = @()

	function ConvertFrom-JsonLines {
		param([string[]] $Lineas)
		$salida = @()
		foreach ($l in $Lineas) {
			if (-not [string]::IsNullOrWhiteSpace($l)) {
				$salida += ($l | ConvertFrom-Json)
			}
		}
		return $salida
	}

	if ($ActividadJson -and (Test-Path $ActividadJson)) {
		# Modo offline: JSON previamente descargado (array de actividades).
		Write-Host "`nLeyendo actividad desde archivo: $ActividadJson" -ForegroundColor DarkGray
		$crudo = Get-Content -Raw -Path $ActividadJson | ConvertFrom-Json
		foreach ($a in $crudo) {
			$eventos += [pscustomobject]@{
				Timestamp = ConvertTo-Dto $a.timestamp
				Tipo      = $a.activity_type
				Actor     = $(if ($a.actor) { $a.actor.login } else { "" })
				Ref       = $a.ref
				Before    = $a.before
				After     = $a.after
				Fuente    = "activity"
			}
		}
	}
	elseif ($owner -and (Get-Command gh -ErrorAction SilentlyContinue)) {

		# 4a. Endpoint "List repository activities": registra push y force_push
		#     con marca de tiempo del servidor. Es el mas fiable.
		Write-Host "`nConsultando actividad del servidor (repos/$owner/$repo/activity)..." -ForegroundColor DarkGray
		$lineas = & gh api "repos/$owner/$repo/activity?per_page=100" --paginate --jq '.[] | @json' 2>$null
		if ($LASTEXITCODE -eq 0 -and $lineas) {
			foreach ($a in (ConvertFrom-JsonLines $lineas)) {
				$eventos += [pscustomobject]@{
					Timestamp = ConvertTo-Dto $a.timestamp
					Tipo      = $a.activity_type
					Actor     = $(if ($a.actor) { $a.actor.login } else { "" })
					Ref       = $a.ref
					Before    = $a.before
					After     = $a.after
					Fuente    = "activity"
				}
			}
		}
		else {
			Write-Warning "El endpoint /activity no devolvio datos (permisos insuficientes o repo sin actividad registrada)."
		}

		# 4b. Endpoint "events" como complemento. Ventana de retencion corta
		#     (maximo 300 eventos y solo los mas recientes), por eso es respaldo.
		Write-Host "Consultando eventos del servidor (repos/$owner/$repo/events)..." -ForegroundColor DarkGray
		$lineas2 = & gh api "repos/$owner/$repo/events?per_page=100" --paginate --jq '.[] | select(.type=="PushEvent") | @json' 2>$null
		if ($LASTEXITCODE -eq 0 -and $lineas2) {
			foreach ($e in (ConvertFrom-JsonLines $lineas2)) {
				$eventos += [pscustomobject]@{
					Timestamp = ConvertTo-Dto $e.created_at
					Tipo      = "push"
					Actor     = $(if ($e.actor) { $e.actor.login } else { "" })
					Ref       = $e.payload.ref
					Before    = $e.payload.before
					After     = $e.payload.head
					Fuente    = "events"
				}
			}
		}
	}
	else {
		Write-Warning "No se pudo consultar el servidor (falta 'gh' o el remoto no es GitHub). Solo se mostraran fechas locales, que son falsificables."
	}

	# -------------------------------------------------------------------
	# 5. Asignar a cada commit el PRIMER push que lo introdujo
	#    Se procesa en orden cronologico ascendente y solo se asigna a los
	#    commits todavia sin fecha de push, de modo que gana el push mas antiguo.
	# -------------------------------------------------------------------

	$mapaPush   = @{}
	$forcePush  = @()
	$eventosOrd = $eventos | Sort-Object Timestamp

	foreach ($ev in $eventosOrd) {

		if ($ev.Tipo -match 'force') { $forcePush += $ev }
		if ([string]::IsNullOrWhiteSpace($ev.After) -or $ev.After -eq $CEROS) { continue }

		# El objeto debe existir localmente; si fue eliminado por un force-push
		# ya no se puede reconstruir el rango.
		& git cat-file -e "$($ev.After)^{commit}" 2>$null
		if ($LASTEXITCODE -ne 0) { continue }

		$rango = @("$($ev.After)")
		if ($ev.Before -and $ev.Before -ne $CEROS) {
			& git cat-file -e "$($ev.Before)^{commit}" 2>$null
			if ($LASTEXITCODE -eq 0) { $rango += "^$($ev.Before)" }
		}

		$shas = & git rev-list @rango 2>$null
		if ($LASTEXITCODE -ne 0) { continue }

		foreach ($sha in $shas) {
			if (-not $mapaPush.ContainsKey($sha)) {
				$mapaPush[$sha] = $ev
			}
		}
	}

	# -------------------------------------------------------------------
	# 6. Listar los commits del autor en todas las ramas
	# -------------------------------------------------------------------

	$SEP = '|~|'
	$fmt = "%H$SEP%aI$SEP%cI$SEP%an$SEP%ae$SEP%s"
	$log = & git log --all -i --author="$Autor" --pretty=format:$fmt

	if (-not $log) {
		Write-Warning "No se encontraron commits del autor '$Autor'. Autores presentes en el repositorio:"
		& git shortlog -s -n -e --all
		return
	}

	$filas = @()
	foreach ($linea in $log) {

		$p = $linea -split [regex]::Escape($SEP)
		if ($p.Count -lt 6) { continue }

		$sha        = $p[0]
		$fechaAutor = ConvertTo-Dto $p[1]
		$fechaComm  = ConvertTo-Dto $p[2]

		$ev = $mapaPush[$sha]

		if ($ev) {
			$fechaReal  = $ev.Timestamp
			$origen     = $ev.Fuente
			$quienSubio = $ev.Actor
			$rama       = $ev.Ref
			$aTiempo    = $(if ($fechaReal -le $fechaCorte) { "SI" } else { "NO" })
			$desfaseDias = [math]::Round(($fechaReal - $fechaAutor).TotalDays, 2)
		}
		else {
			$fechaReal   = $null
			$origen      = "sin-dato"
			$quienSubio  = ""
			$rama        = ""
			$aTiempo     = "DESCONOCIDO"
			$desfaseDias = $null
		}

		$filas += [pscustomobject]@{
			SHA               = $sha.Substring(0, 10)
			FechaAutorLocal   = $fechaAutor.ToLocalTime().ToString("yyyy-MM-dd HH:mm:ss")
			FechaCommitLocal  = $fechaComm.ToLocalTime().ToString("yyyy-MM-dd HH:mm:ss")
			FechaRealPush     = $(if ($fechaReal) { $fechaReal.ToLocalTime().ToString("yyyy-MM-dd HH:mm:ss") } else { "" })
			DentroDelPlazo    = $aTiempo
			DesfaseDias       = $desfaseDias
			Reescrito         = $(if ([math]::Abs(($fechaComm - $fechaAutor).TotalMinutes) -gt 1) { "SI" } else { "no" })
			SubidoPor         = $quienSubio
			Rama              = $rama
			Fuente            = $origen
			Autor             = $p[3]
			Correo            = $p[4]
			Mensaje           = $p[5]
		}
	}

	$filas = @($filas | Sort-Object FechaAutorLocal)

	# -------------------------------------------------------------------
	# 7. Resultados
	# -------------------------------------------------------------------

	$filas | Format-Table SHA, FechaAutorLocal, FechaRealPush, DentroDelPlazo, DesfaseDias, Reescrito, Mensaje -AutoSize | Out-String -Width 240 | Write-Host

	$filas | Export-Csv -Path $Salida -NoTypeInformation -Encoding UTF8 -Delimiter ';'

	$total    = $filas.Count
	$aTiempoN = ($filas | Where-Object { $_.DentroDelPlazo -eq "SI" }).Count
	$tardeN   = ($filas | Where-Object { $_.DentroDelPlazo -eq "NO" }).Count
	$sinDatoN = ($filas | Where-Object { $_.DentroDelPlazo -eq "DESCONOCIDO" }).Count
	$reescN   = ($filas | Where-Object { $_.Reescrito -eq "SI" }).Count

	Write-Host "`n================ RESUMEN ================" -ForegroundColor Yellow
	Write-Host "Commits del autor .................. $total"
	Write-Host "Subidos dentro del plazo ........... $aTiempoN"
	Write-Host "Subidos DESPUES del plazo .......... $tardeN"
	Write-Host "Sin evidencia del servidor ......... $sinDatoN"
	Write-Host "Con fecha de autor reescrita ....... $reescN"
	Write-Host "Eventos force-push detectados ...... $($forcePush.Count)"

	if ($forcePush.Count -gt 0) {
		Write-Host "`nFORCE-PUSH detectados (indicio de historial reescrito):" -ForegroundColor Red
		$forcePush | ForEach-Object {
			Write-Host ("  {0}  {1}  {2}  {3}" -f $_.Timestamp.ToLocalTime().ToString("yyyy-MM-dd HH:mm:ss"), $_.Tipo, $_.Actor, $_.Ref)
		}
	}

	if ($sinDatoN -gt 0) {
		Write-Host "`nNota: los commits 'DESCONOCIDO' no tienen evidencia del servidor." -ForegroundColor DarkYellow
		Write-Host "      La API de eventos solo conserva los mas recientes; para historial" -ForegroundColor DarkYellow
		Write-Host "      antiguo la unica prueba es el SHA registrado en la fecha de corte." -ForegroundColor DarkYellow
	}

	Write-Host "`nArchivo generado: $((Resolve-Path $Salida).Path)" -ForegroundColor Green
}
finally {
	Pop-Location
}