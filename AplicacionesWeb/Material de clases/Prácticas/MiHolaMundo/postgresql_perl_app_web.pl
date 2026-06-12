#!/usr/bin/perl
# ^ "Shebang": en Linux/Mac indica que este archivo se ejecuta con el interprete
#   Perl ubicado en /usr/bin/perl. En Windows lo ignora, pero se conserva por
#   portabilidad y buena practica. DEBE ser la primera linea del archivo.

# ============================================================================
#  crud_estudiantes.pl  -  Aplicacion web (PERL + PostgreSQL)
#  El simbolo '#' inicia un comentario: Perl ignora todo lo que va desde '#'
#  hasta el final de la linea. Sirve para documentar, no se ejecuta.
# ============================================================================

use strict;             # Pragma: OBLIGA a declarar variables con 'my'. Por que:
#   evita errores por nombres mal escritos o variables
#   globales accidentales. Cuando: siempre, en todo script.
use warnings;           # Pragma: muestra ADVERTENCIAS (variables sin valor,
#   conversiones raras...). No detiene el programa; avisa.
use utf8;               # Indica que ESTE archivo fuente esta escrito en UTF-8,
#   para que las tildes del codigo se interpreten bien.
use IO::Socket::INET;   # Modulo del NUCLEO de Perl para abrir sockets de red:
#   con el levantamos el mini servidor web (sin Apache).
use DBI;                # Modulo para acceder a bases de datos (Database Interface).
#   Es la API estandar; el driver concreto es DBD::Pg.

binmode(STDOUT, ':encoding(UTF-8)');  # Hace que la salida por consola use UTF-8,
#   para que los mensajes con tildes no se
#   vean corruptos.

# ---------------------------------------------------------------------------
# 1) CONEXION A POSTGRESQL
#    Aqui definimos los datos de acceso y abrimos la conexion una sola vez,
#    al arrancar; el servidor la reutiliza mientras este en ejecucion.
# ---------------------------------------------------------------------------
my $bd        = 'appweb2026ppa';   # Nombre de la base de datos a la que conectamos.
my $host      = '127.0.0.1';       # Servidor de BD: 127.0.0.1 = este mismo equipo.
my $puerto_bd = 5432;              # Puerto de PostgreSQL (numero, sin comillas).
my $usuario   = 'postgres';        # Usuario de la base de datos.
my $clave     = 'P@$7Gr3$QL';      # Clave. POR QUE comillas SIMPLES: contiene
#   '$' y '@'; en comillas dobles Perl tomaria
#   '$7' y '$QL' como variables y la mutilaria.

# DSN (Data Source Name): cadena que describe la conexion. Comillas DOBLES porque
#   queremos que se interpolen (sustituyan) $bd, $host y $puerto_bd por su valor.
#   El prefijo 'dbi:Pg:' selecciona el driver de PostgreSQL.
my $dsn = "dbi:Pg:dbname=$bd;host=$host;port=$puerto_bd";

my $dbh = DBI->connect($dsn, $usuario, $clave, {  # DBI->connect abre la conexion.
    #   '->' llama al metodo connect.
    RaiseError     => 1,   # Si una operacion de BD falla, lanza error y aborta:
    #   asi no hay que comprobar a mano cada llamada.
    AutoCommit     => 1,   # Confirma (commit) cada sentencia automaticamente.
    pg_enable_utf8 => 1,   # Atributo de DBD::Pg: trata el texto como UTF-8.
}) or die "No se pudo conectar a la base: $DBI::errstr";  # Si connect devuelve
#   falso, 'or die' aborta mostrando el error real
#   ($DBI::errstr). '$dbh' es el "database handle":
#   el objeto que representa la conexion abierta.

# ---------------------------------------------------------------------------
# 2) CREAR LA TABLA SI NO EXISTE
#    'do' ejecuta SQL que no devuelve filas. 'q{...}' es texto literal (como
#    comillas simples) comodo para SQL multilinea. 'IF NOT EXISTS' evita el
#    error si la tabla ya existe, asi el programa se puede re-ejecutar sin problema.
# ---------------------------------------------------------------------------
$dbh->do(q{
    CREATE TABLE IF NOT EXISTS estudiantes (
        id      SERIAL       PRIMARY KEY,   -- entero autoincremental, clave primaria
        nombre  VARCHAR(100) NOT NULL,      -- texto obligatorio (max 100)
        correo  VARCHAR(120) NOT NULL,      -- texto obligatorio (max 120)
        carrera VARCHAR(80)  NOT NULL,      -- texto obligatorio (max 80)
        creado  TIMESTAMP    NOT NULL DEFAULT NOW()  -- fecha/hora automatica
    )
});

# ---------------------------------------------------------------------------
# 3) SERVIDOR WEB
#    Abrimos un socket que escucha conexiones del navegador en el puerto 8080.
# ---------------------------------------------------------------------------
my $puerto_web = 8080;                       # Puerto donde atendera la web.
my $servidor = IO::Socket::INET->new(        # Crea el socket servidor ('new').
    LocalAddr => '127.0.0.1',                # Solo acepta conexiones de este equipo.
    LocalPort => $puerto_web,                # Puerto de escucha (8080).
    Proto     => 'tcp',                      # Protocolo de transporte: TCP.
    Listen    => 5,                          # Tamano de la cola de conexiones.
    ReuseAddr => 1,                          # Permite reabrir el puerto si quedo ocupado.
) or die "No se pudo abrir el puerto $puerto_web: $!\n";  # Si falla, aborta;
#   '$!' = ultimo error del sistema.

print "Servidor en http://localhost:$puerto_web  (pulsa Stop para detener)\n";
# ^ Mensaje informativo en la consola. En comillas dobles, $puerto_web se interpola.

while (my $cli = $servidor->accept) {   # BUCLE PRINCIPAL: 'accept' ESPERA (bloquea)
    #   hasta que llega una visita y devuelve un
    #   socket ($cli) para hablar con ese cliente.
    #   El while se repite por cada visita.

    # --- Leer la primera linea de la peticion HTTP ---
    # Ejemplo de esa linea:  POST /agregar HTTP/1.1
    my $inicial = <$cli>;                      # '<$cli>' lee UNA linea del socket.
    unless (defined $inicial) { close $cli; next; }  # Si no llego nada (peticion
    #   vacia), cierra y pasa a la siguiente
    #   vuelta del while ('next').

    # Extraemos metodo y ruta con una expresion regular:
    #   '=~' enlaza el texto con el patron; '(\S+)' captura una secuencia sin
    #   espacios (el metodo), luego espacios '\s+', luego otra '(\S+)' (la ruta).
    my ($metodo, $ruta) = $inicial =~ m{^(\S+)\s+(\S+)};
    $metodo //= 'GET';                  # '//=' asigna un valor por defecto SOLO si
    $ruta   //= '/';                    #   la variable esta indefinida (operador
    #   "defined-or"). Asi evitamos avisos.

    # --- Leer las cabeceras hasta la linea en blanco ---
    # Necesitamos Content-Length para saber cuantos bytes tiene el cuerpo (POST).
    my $largo = 0;                      # Tamano del cuerpo; 0 si no hay (GET).
    while (my $h = <$cli>) {            # Lee cabecera por cabecera.
        $h =~ s/\r?\n\z//;             # Quita el fin de linea (\r\n) del final ('\z').
        last if $h eq '';              # Linea en blanco => fin de cabeceras: salir.
        $largo = $1 if $h =~ /^Content-Length:\s*(\d+)/i;  # Si la cabecera es
        #   Content-Length, captura el numero ('\d+')
        #   en $1; '/i' = sin distinguir mayusculas.
    }

    # --- Leer el cuerpo (datos del formulario en una peticion POST) ---
    my $cuerpo = '';                    # Cadena donde guardaremos el cuerpo.
    read($cli, $cuerpo, $largo) if $largo > 0;  # 'read' lee exactamente $largo
    #   bytes del socket hacia $cuerpo. Solo si
    #   hay cuerpo (POST con datos).

    # --- ENRUTAMIENTO: decidir que hacer segun metodo + ruta ---
    if ($metodo eq 'POST' && $ruta =~ m{^/agregar}) {   # Caso 1: enviaron el form.
        my %f = parse_form($cuerpo);    # Convierte "a=1&b=2" en un hash (%f).
        # Validacion minima EN EL SERVIDOR (nunca confiar solo en el navegador):
        #   solo insertamos si los tres campos vienen con contenido.
        if (length($f{nombre} // '') && length($f{correo} // '') && length($f{carrera} // '')) {
            my $ins = $dbh->prepare(    # 'prepare' compila la sentencia y devuelve
                #   un "statement handle" reutilizable.
                'INSERT INTO estudiantes (nombre, correo, carrera) VALUES (?, ?, ?)');
            # Los '?' son marcadores: el motor los
            #   rellena de forma segura (anti SQL Injection).
            $ins->execute($f{nombre}, $f{correo}, $f{carrera});  # 'execute' ejecuta
            #   la sentencia pasando los valores de los '?'.
        }
        redirigir($cli, '/');           # Patron PRG (Post-Redirect-Get): tras un
        #   POST redirigimos con 302 a '/', para que
        #   recargar la pagina no reenvie el formulario.
    }
    elsif ($metodo eq 'GET' && $ruta =~ m{^/eliminar\?id=(\d+)}) {  # Caso 2: borrar.
        my $id = $1;                    # '$1' = el numero capturado por '(\d+)'
        #   en la URL /eliminar?id=NUMERO ('\?' = '?').
        my $del = $dbh->prepare('DELETE FROM estudiantes WHERE id = ?');  # Sentencia
        #   preparada de borrado por id.
        $del->execute($id);            # Ejecuta el DELETE con ese id.
        redirigir($cli, '/');           # De nuevo PRG: volvemos al listado.
    }
    else {                              # Caso 3 (por defecto): GET '/' u otra ruta.
        responder($cli, pagina());      # Genera y envia la pagina (formulario + reporte).
    }

    close $cli;                         # Cierra el socket de ESTE cliente y libera
    #   la conexion. El while sigue con el siguiente.
}

$dbh->disconnect;   # Cierra la conexion con la base (se alcanza al detener el bucle).

# ===========================================================================
#  SUBRUTINAS  ('sub NOMBRE { ... }' define una funcion reutilizable)
# ===========================================================================

# parse_form: convierte el cuerpo "nombre=Ana&correo=a%40x" de un formulario
#   en un hash de Perl ( nombre => 'Ana', correo => 'a@x' ).
sub parse_form {
    my ($cuerpo) = @_;          # '@_' = argumentos recibidos; copiamos el 1.o en $cuerpo.
    my %datos;                  # '%datos' es un HASH (pares clave => valor).
    for my $par (split /&/, $cuerpo) {   # 'split /&/' parte el cuerpo en cada '&';
        #   recorremos cada "clave=valor".
        my ($k, $v) = split /=/, $par, 2;   # Partimos en '='; el ',2' limita a 2
        #   trozos (por si el valor contiene otro '=').
        next unless defined $k; # Si no hay clave, saltamos al siguiente par.
        $datos{ url_decode($k) } = url_decode($v // '');  # Decodificamos clave y
        #   valor (URL) y los guardamos en el hash. '// '''
        #   da cadena vacia si el valor venia indefinido.
    }
    return %datos;              # Devolvemos el hash a quien llamo la funcion.
}

# pagina: consulta la BD y construye la pagina HTML5 completa (formulario + reportes).
sub pagina {
    # --- Reporte 1: traer TODOS los estudiantes ---
    my $sth = $dbh->prepare(    # Preparamos la consulta SELECT.
        'SELECT id, nombre, correo, carrera FROM estudiantes ORDER BY id');
    $sth->execute;              # La ejecutamos (sin valores: no tiene '?').

    my $filas = '';             # Acumulara las filas <tr> de la tabla.
    my $total = 0;              # Contador de estudiantes.
    while (my $e = $sth->fetchrow_hashref) {  # 'fetchrow_hashref' trae la siguiente
        #   fila como hash {columna=>valor}; undef al acabar,
        #   por eso el while termina solo.
        $total++;               # Sumamos uno al total.
        $filas .=               # '.=' concatena (anade) al final de $filas.
            "<tr>"
                . "<td>" . escape_html($e->{id})      . "</td>"   # '$e->{id}': valor de
                . "<td>" . escape_html($e->{nombre})  . "</td>"   #   la columna; '->'
                . "<td>" . escape_html($e->{correo})  . "</td>"   #   desreferencia el hash.
                . "<td>" . escape_html($e->{carrera}) . "</td>"   # 'escape_html' evita XSS.
                . "<td><a class=\"del\" href=\"/eliminar?id=" . escape_html($e->{id})
                . "\">Eliminar</a></td>"               # Enlace que dispara el borrado.
                . "</tr>\n";        # '\n' (salto de linea) solo para legibilidad del HTML.
    }
    # Si no hubo ningun estudiante, mostramos una fila con un mensaje:
    $filas = "<tr><td colspan=\"5\" class=\"vacio\">Aun no hay estudiantes registrados.</td></tr>"
        if $total == 0;

    # --- Reporte 2: resumen por carrera (agrupando con GROUP BY) ---
    my $res = $dbh->prepare(    # COUNT(*) cuenta filas; GROUP BY agrupa por carrera.
        'SELECT carrera, COUNT(*) AS n FROM estudiantes GROUP BY carrera ORDER BY carrera');
    $res->execute;              # Ejecuta la consulta de resumen.
    my $resumen = '';           # Acumulara los <li> del resumen.
    while (my $r = $res->fetchrow_hashref) {     # Recorremos cada carrera.
        $resumen .= "<li>" . escape_html($r->{carrera})       # Nombre de la carrera
            . " <strong>" . escape_html($r->{n}) . "</strong></li>\n";  # y su conteo.
    }
    $resumen = "<li class=\"vacio\">Sin datos todavia.</li>" if $resumen eq '';  # Caso vacio.

    # --- Devolver el HTML5 ---
    # 'my $html = <<"HTML";' es un HEREDOC con comillas dobles: todo el texto hasta
    #   la linea que diga solo 'HTML' se guarda como una cadena, e INTERPOLA las
    #   variables $total, $filas y $resumen. OJO: por eso una '@' literal (\@media)
    #   o el correo (\@) van escapados, o Perl los tomaria como arreglos/variables.
    return <<"HTML";
<!DOCTYPE html>
<html lang="es-EC">
<head>
  <meta charset="UTF-8">                                        <!-- codificacion UTF-8 -->
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- responsive -->
  <title>Registro de estudiantes - UTEQ</title>
  <!-- Bloque de estilos CSS: define colores, tarjetas, formulario, tabla y
       el diseno responsive. \@media adapta a pantallas pequenas. -->
  <style>
    :root { --verde:#006633; --verde-osc:#0b3d24; --oro:#c9a227; --tinta:#1f2933; }
    *,*::before,*::after { box-sizing:border-box; }
    body { margin:0; color:var(--tinta); line-height:1.5;
           font-family:system-ui,-apple-system,"Segoe UI",sans-serif; background:#f4f6f5; }
    header.sitio { background:var(--verde); color:#fff; padding:1.1rem 1.5rem; }
    header.sitio h1 { margin:0; font-size:1.4rem; }
    main { max-width:60rem; margin:1.4rem auto; padding:0 1.2rem;
           display:grid; grid-template-columns:1fr 2fr; gap:1.4rem; align-items:start; }
    section { background:#fff; border-radius:.5rem; padding:1.1rem 1.2rem;
              box-shadow:0 1px 4px rgba(0,0,0,.08); }
    h2 { color:var(--verde); margin:0 0 .8rem; font-size:1.15rem; }
    label { display:block; font-size:.85rem; font-weight:600; margin:.5rem 0 .2rem; }
    input,select { width:100%; padding:.55rem; border:1px solid #bbb;
                   border-radius:.4rem; font-size:1rem; }
    button { margin-top:1rem; width:100%; padding:.6rem; border:0; cursor:pointer;
             background:var(--verde); color:#fff; border-radius:.4rem; font-size:1rem; }
    table { width:100%; border-collapse:collapse; }
    th,td { text-align:left; padding:.5rem .6rem; border-bottom:1px solid #e3e8e5; font-size:.92rem; }
    th { background:var(--verde-osc); color:#fff; }
    a.del { color:#9a2a2a; text-decoration:none; font-weight:600; }
    a.del:hover { text-decoration:underline; }
    .vacio { color:#6b7280; font-style:italic; text-align:center; }
    .resumen { list-style:none; padding:0; margin:.4rem 0 0; }
    .resumen li { padding:.25rem 0; border-bottom:1px dashed #e3e8e5; }
    .resumen strong { color:var(--oro); }
    \@media (max-width:760px){ main{ grid-template-columns:1fr; } }  <!-- una columna en movil -->
  </style>
</head>
<body>

  <!-- ENCABEZADO del sitio (cabecera visible arriba) -->
  <header class="sitio">
    <h1>Registro de estudiantes &middot; UTEQ</h1>
    <p>Aplicaci&oacute;n web en PERL conectada a PostgreSQL (appweb2026ppa)</p>
  </header>

  <!-- CONTENIDO principal: a la izquierda el formulario, a la derecha el reporte -->
  <main>
    <!-- ALTA DE DATOS: formulario que envia por POST a /agregar -->
    <section class="alta">
      <h2>Registrar estudiante</h2>
      <form method="post" action="/agregar">
        <label for="nombre">Nombre completo</label>
        <!-- 'required' y 'minlength' = validacion NATIVA de HTML5 en el navegador -->
        <input id="nombre" name="nombre" type="text" required minlength="3"
               placeholder="Ej. Ana Perez" autofocus>

        <label for="correo">Correo</label>
        <!-- type=email valida el formato; el correo lleva \@ escapado por el heredoc -->
        <input id="correo" name="correo" type="email" required
               placeholder="ej. ana\@uteq.edu.ec">

        <label for="carrera">Carrera</label>
        <select id="carrera" name="carrera" required>
          <option value="">-- selecciona --</option>
          <option>Ingenieria de Software</option>
          <option>Ingenieria en Computacion</option>
          <option>Telematica</option>
        </select>

        <button type="submit">Guardar</button>   <!-- envia el formulario -->
      </form>
    </section>

    <!-- REPORTE: tabla de estudiantes + resumen por carrera -->
    <section class="reporte">
      <h2>Reporte de estudiantes ($total)</h2>     <!-- \$total se interpola con el conteo -->
      <table>
        <thead>
          <tr><th>ID</th><th>Nombre</th><th>Correo</th><th>Carrera</th><th></th></tr>
        </thead>
        <tbody>
$filas
        </tbody>                                    <!-- \$filas: las filas generadas arriba -->
      </table>

      <h2 style="margin-top:1.2rem">Resumen por carrera</h2>
      <ul class="resumen">
$resumen
      </ul>                                         <!-- \$resumen: los <li> por carrera -->
    </section>
  </main>

  <!-- PIE de pagina -->
  <footer style="text-align:center;color:#6b7280;font-size:.8rem;padding:1rem">
    UTEQ &middot; Aplicaciones Web &middot; Unidad II
  </footer>
</body>
</html>
HTML
}

# responder: envia una respuesta HTTP 200 (OK) con el HTML como cuerpo.
sub responder {
    my ($cli, $html) = @_;            # $cli = socket del cliente; $html = pagina.
    my $bytes = length $html;         # 'length' = numero de caracteres del cuerpo.
    print $cli "HTTP/1.1 200 OK\r\n"; # Linea de estado: 200 = todo correcto.
    #   'print $cli ...' escribe EN EL SOCKET
    #   (al navegador), no en la consola.
    print $cli "Content-Type: text/html; charset=utf-8\r\n";  # Es HTML en UTF-8.
    print $cli "Content-Length: $bytes\r\n";  # Tamano del cuerpo en bytes.
    print $cli "Connection: close\r\n";       # La conexion se cierra al terminar.
    print $cli "\r\n";                # Linea EN BLANCO: separa cabeceras del cuerpo
    #   (obligatoria en HTTP). '\r\n' = fin de linea HTTP.
    print $cli $html;                 # Finalmente, el cuerpo: la pagina HTML.
}

# redirigir: envia una redireccion 302 (usada en el patron Post-Redirect-Get).
sub redirigir {
    my ($cli, $destino) = @_;         # $destino = a donde redirigir (ej. '/').
    print $cli "HTTP/1.1 302 Found\r\n";   # 302 = "ve a otra URL".
    print $cli "Location: $destino\r\n";   # Cabecera que indica el destino.
    print $cli "Content-Length: 0\r\n";    # Sin cuerpo (longitud 0).
    print $cli "Connection: close\r\n";
    print $cli "\r\n";                # Linea en blanco final.
}

# url_decode: revierte la codificacion de URL ('+' -> espacio, '%XX' -> caracter).
sub url_decode {
    my ($s) = @_;                     # Toma el texto a decodificar.
    $s =~ tr/+/ /;                    # 'tr' translitera: cada '+' pasa a espacio.
    $s =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/ge;  # 's///' sustituye: detecta '%XX'
    #   (dos digitos hex), 'hex' lo pasa a numero
    #   y 'chr' al caracter. 'g'=todas, 'e'=evalua
    #   el reemplazo como codigo Perl.
    return $s;                        # Devuelve el texto ya legible.
}

# escape_html: convierte < > & " en entidades para EVITAR ataques XSS al mostrar
#   datos que escribio el usuario (defensa: el navegador no ejecuta etiquetas).
sub escape_html {
    my ($s) = @_;                     # Texto a asegurar.
    $s = '' unless defined $s;        # Si venia indefinido, usar cadena vacia.
    $s =~ s/&/&amp;/g;                # Primero el '&' (para no re-escapar despues).
    $s =~ s/</&lt;/g;                 # '<' -> &lt; (no abre etiqueta).
    $s =~ s/>/&gt;/g;                 # '>' -> &gt; (no cierra etiqueta).
    $s =~ s/"/&quot;/g;               # comilla doble -> &quot; (segura en atributos).
    return $s;                        # Devuelve el texto inofensivo.
}