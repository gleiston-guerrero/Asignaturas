#!/usr/bin/perl
# ^ "Shebang": en Linux/Mac indica al sistema con que interprete ejecutar el
#   archivo. El símbolo #! debe ir en la PRIMERA linea. En Windows lo ignora,
#   pero se conserva por buena practica y portabilidad.

# =============================================================================
#  hola_web_comentado.pl  -  MiHolaMundo
#  UTEQ - Aplicaciones Web - Unidad II, Semana 5
#  Version DIDACTICA: un comentario antes de cada instruccion, explicando que
#  hace y que significa cada simbolo y cada funcion que aparece en ella.
#  El simbolo # inicia un comentario: Perl ignora todo lo que va desde # hasta
#  el final de la linea.
# =============================================================================

# 'use strict' activa el modo estricto: OBLIGA a declarar las variables con
#   'my' y prohibe codigo ambiguo. 'use' carga una directiva (pragma) o modulo.
use strict;

# 'use warnings' enciende los avisos: Perl advierte de cosas peligrosas
#   (variables sin valor, conversiones raras, etc.). No detiene el programa,
#   solo avisa por la consola.
use warnings;

# 'use IO::Socket::INET' carga el modulo que permite abrir sockets de red
#   (conexiones TCP/IP). Es parte del NUCLEO de Perl, por eso no hay que
#   instalar nada. Los '::' separan los niveles del nombre del modulo.
use IO::Socket::INET;

# 'my' declara una variable LOCAL (lexica). El simbolo '$' es el "sigilo" de
#   las variables ESCALARES (un solo valor: numero o texto). Aqui guardamos el
#   numero de puerto donde escuchara el servidor. El ';' cierra la instruccion.
my $puerto = 8080;

# Crea el SOCKET SERVIDOR que se queda escuchando conexiones entrantes.
#   - 'IO::Socket::INET->new(...)' : el '->' es el operador de llamada a metodo;
#     'new' es el constructor que crea el objeto socket.
#   - El '=>' es la "coma gorda": separa cada nombre de opcion de su valor (y
#     entrecomilla automaticamente el texto de la izquierda).
#   - 'or die ...' : 'or' es un O-logico de baja prioridad; si 'new' falla
#     (devuelve falso), se ejecuta 'die', que aborta el programa con un mensaje.
#   - '$!' es la variable especial con el ultimo error del sistema operativo.
#   - El '\n' dentro de las comillas es un salto de linea.

my $servidor = IO::Socket::INET->new(
    LocalAddr => '127.0.0.1',   # direccion local (localhost): solo este equipo
    LocalPort => $puerto,       # puerto en el que se escucha (8080)
    Proto     => 'tcp',         # protocolo de transporte: TCP
    Listen    => 5,             # cuantas conexiones en cola se aceptan a la vez
    ReuseAddr => 1,             # reutiliza el puerto si quedo "ocupado" antes
) or die "No se pudo abrir el puerto $puerto: $!\n";

# 'print' escribe texto en la consola (salida estandar). Entre comillas dobles,
#   '$puerto' se INTERPOLA (se sustituye por su valor) y '\n' es salto de linea.
print "Servidor escuchando en http://localhost:$puerto\n";

# Segundo mensaje informativo para el usuario que ejecuta el programa.
print "(pulsa el boton rojo Stop en IntelliJ para detenerlo)\n";

# 'while (...)' repite el bloque mientras la condicion sea verdadera.
#   - '$servidor->accept' ESPERA (bloquea) hasta que llega una conexion del
#     navegador y devuelve un socket para hablar con ese cliente.
#   - 'my $cliente = ...' guarda ese socket. La asignacion dentro del while
#     hace que el bucle siga vivo conexion tras conexion.
while (my $cliente = $servidor->accept) {

    # '<$cliente>' es el operador de LECTURA de linea: lee UNA linea enviada por
    #   el navegador. La primera linea HTTP es del tipo:  GET /?nombre=Ana HTTP/1.1
    my $peticion = <$cliente>;

    # 'unless' es lo contrario de 'if': ejecuta la asignacion SOLO si la
    #   condicion es falsa. 'defined' comprueba si la variable tiene algun valor.
    #   En conjunto: si no llego nada, deja la peticion como cadena vacia ''.
    $peticion = '' unless defined $peticion;

    # --- LECTURA SEGURA DE LA ENTRADA ---------------------------------------
    # Regla de oro del backend: NUNCA confiar en lo que envia el usuario.

    # Valor por defecto del nombre si la peticion no trae el parametro.
    my $nombre = 'Mundo';

    # 'if (... =~ ...)' : el '=~' ENLAZA una variable con una expresion regular.
    #   'm{...}' es el operador de COINCIDENCIA (match); usa llaves como
    #   delimitadores. Dentro del patron:
    #     [?&]      -> clase de caracteres: una '?' o un '&' (inicio del parametro)
    #     nombre=   -> texto literal que debe aparecer
    #     ( ... )   -> grupo de CAPTURA: lo que coincida queda en $1
    #     [^\s&]*   -> clase NEGADA: cualquier caracter que NO sea espacio (\s)
    #                  ni '&', repetido '*' (cero o mas veces) = el valor del nombre
    if ($peticion =~ m{[?&]nombre=([^\s&]*)}) {

        # '$1' es lo capturado por los parentesis. 'url_decode' (definida abajo)
        #   convierte la codificacion de URL a texto normal.
        $nombre = url_decode($1);
    }

    # 'escape_html' (definida abajo) reemplaza < > & " por entidades HTML para
    #   neutralizar etiquetas maliciosas: es la defensa contra ataques XSS.
    $nombre = escape_html($nombre);

    # --- CUERPO HTML5 -------------------------------------------------------
    # 'my $html = <<"HTML";' inicia un HEREDOC con comillas dobles: todo el texto
    #   hasta la linea que dice exactamente HTML se guarda como una sola cadena.
    #   Al ser comillas dobles, Perl INTERPOLA las variables ($nombre, $puerto).
    #   Por eso, una '@' literal o un '$' que no fuera variable habría que
    #   escaparlos; aquí no aparecen, asi que el texto va limpio.
    my $html = <<"HTML";
<!DOCTYPE html>
<html lang="es-EC">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Saludo generado en el servidor con PERL y HTML5 semantico">
  <title>Hola Mundo en PERL &middot; UTEQ</title>
  <style>
    :root {
        --verde:#006633;
        --verde-osc:#0b3d24;
        --oro:#c9a227;
        --tinta:#1f2933;
    }

    *,*::before,*::after {
        box-sizing:border-box;
    }

    body {
        margin:0;
        color:var(--tinta);
        line-height:1.6;
        font-family:system-ui,-apple-system,"Segoe UI",sans-serif;
    }

    header.sitio {
        background:var(--verde);
        color:#fff;
        padding:1.2rem 1.5rem;
    }

    header.sitio h1 {
        margin:0;
        font-size:1.5rem;
    }

    nav ul {
        list-style:none;
        display:flex;
        gap:1.2rem;
        flex-wrap:wrap;
        margin:0;
        padding:.7rem 1.5rem;
        background:var(--verde-osc);
    }

    nav a {
        color:#cfe6da;
        text-decoration:none;
        font-weight:600;
    }

    nav a:hover, nav a:focus-visible {
        color:#fff;
    }

    main {
        max-width:60rem;
        margin:1.5rem auto;
        padding:0 1.5rem;
        display:grid;
        grid-template-columns:1fr 15rem;
        gap:1.5rem;
    }

    article h2 {
        color:var(--verde);
        margin-top:0;
    }

    mark {
        background:var(--oro);
        color:#1f2933;
        padding:0 .25rem;
        border-radius:.2rem;
    }

    details {
        margin-top:1rem;
        background:#f3f6f4;
        padding:.6rem .9rem;
        border-radius:.4rem;
    }

    summary {
        cursor:pointer;
        font-weight:600;
        color:var(--verde-osc);
    }

    aside {
        background:#e5f0ea;
        border-left:4px solid var(--oro);
        padding:1rem;
        order-radius:.4rem;
        height:fit-content;
    }

    aside h3 {
        margin-top:0;
    }

    form {
        display:flex;
        gap:.6rem;
        margin-top:1rem;
        flex-wrap:wrap;
    }

    input,button {
        font-size:1rem;
        padding:.6rem;
        border-radius:.4rem;
    }

    input {
        flex:1;
        border:1px solid #bbb;
    }

    button {
        border:0;
        background:var(--verde);
        color:#fff;
        cursor:pointer;
    }

    meter {
        width:100%;
        height:1rem;
    }

    footer.sitio {
        background:var(--verde-osc);
        color:#cfe6da;
        text-align:center;
        padding:1rem;
        font-size:.9rem;
    }

    footer.sitio a {
        color:#fff;
    }

    address {
        font-style:normal;
    }

    \@media (max-width:640px){
        main{
            grid-template-columns:1fr;
        }
    }
  </style>
</head>
<body>

  <!-- header: cabecera de toda la pagina -->
  <header class="sitio">
    <h1>Aplicaciones Web &middot; UTEQ</h1>
    <p>Página generada en el servidor con PERL</p>
  </header>

  <!-- nav: navegación principal (aria-label la nombra para lectores de pantalla) -->
  <nav aria-label="Navegación principal">
    <ul>
      <li><a href="#saludo">Saludo</a></li>
      <li><a href="#info">Información</a></li>
      <li><a href="#contacto">Contacto</a></li>
    </ul>
  </nav>

  <!-- main: contenido principal y ÚNICO de la pagina -->
  <main>

    <!-- article: contenido autónomo -->
    <article id="saludo">
      <header>
        <h2>&iexcl;Hola Mundo, <mark>$nombre</mark>!</h2>
        <p>Publicado el <time datetime="2026-06-08">8 de junio de 2026</time>.</p>
      </header>

      <!-- section: agrupación temática con su encabezado -->
      <section>
        <h3>Cambia el saludo</h3>
        <p>Escribe tu nombre y env&iacute;a el formulario; usa validaci&oacute;n nativa de HTML5.</p>
        <form method="get" action="/">
          <input type="search" name="nombre" placeholder="Tu nombre"
                 required minlength="2" autofocus autocomplete="off"
                 aria-label="Tu nombre">
          <button type="submit">Saludar</button>
        </form>
      </section>

      <!-- details / summary: desplegable NATIVO de HTML5 -->
      <details id="info" open>
        <summary>&iquest;C&oacute;mo funciona?</summary>
        <p>El navegador pide la URL, el programa PERL lee el par&aacute;metro
           <code>nombre</code>, lo escapa y devuelve este HTML5.</p>
      </details>
    </article>

    <!-- aside: contenido secundario relacionado -->
    <aside>
      <h3>Datos del curso</h3>
      <figure>
        <svg viewBox="0 0 240 70" width="100%" role="img" aria-label="Ciclo peticion respuesta">
          <rect x="2"   y="20" width="66" height="30" rx="5" fill="#006633"/>
          <rect x="88"  y="20" width="66" height="30" rx="5" fill="#1c7293"/>
          <rect x="174" y="20" width="62" height="30" rx="5" fill="#c9a227"/>
          <g fill="#fff" font-family="sans-serif" font-size="11" text-anchor="middle">
            <text x="35" y="39">Navegador</text><text x="121" y="39">PERL</text><text x="205" y="39">HTML</text>
          </g>
        </svg>
        <figcaption>Ciclo petici&oacute;n&ndash;respuesta.</figcaption>
      </figure>
      <p>Avance del curso:</p>
      <meter value="5" min="0" max="18" low="6" optimum="18">Semana 5 de 18</meter>
      <p>Servidor en el puerto <output>$puerto</output>.</p>
    </aside>

  </main>

  <!-- footer: pie de toda la pagina, con datos de contacto -->
  <footer class="sitio" id="contacto">
    <address>Escribe a <a href="mailto:info\@uteq.edu.ec">info\@uteq.edu.ec</a></address>
    <p><small>&copy; 2026 Universidad T&eacute;cnica Estatal de Quevedo</small></p>
  </footer>

</body>
</html>
HTML

    # 'length' devuelve cuantos caracteres tiene la cadena. Lo necesitamos para
    #   la cabecera Content-Length, que dice al navegador el tamano del cuerpo.
    my $bytes = length $html;

    # --- RESPUESTA HTTP -----------------------------------------------------
    # 'print $cliente "..."' escribe EN EL SOCKET del cliente (no en la consola):
    #   al poner el filehandle '$cliente' justo despues de print, el texto va al
    #   navegador. '\r\n' es retorno-de-carro + salto-de-linea: el fin de linea
    #   que exige el protocolo HTTP.

    # Linea de estado: version del protocolo y codigo 200 (OK = todo bien).
    print $cliente "HTTP/1.1 200 OK\r\n";

    # Cabecera que declara el tipo de contenido (HTML) y la codificacion UTF-8.
    print $cliente "Content-Type: text/html; charset=utf-8\r\n";

    # Cabecera con el tamano del cuerpo en bytes (el valor calculado arriba).
    print $cliente "Content-Length: $bytes\r\n";

    # Cabecera que indica que la conexion se cerrara al terminar la respuesta.
    print $cliente "Connection: close\r\n";

    # Linea EN BLANCO: separa las cabeceras del cuerpo. Es obligatoria en HTTP.
    print $cliente "\r\n";

    # Finalmente, el cuerpo: el HTML completo que el navegador va a mostrar.
    print $cliente $html;

    # 'close' cierra el socket del cliente y libera la conexión.
    close $cliente;
}

# === Funciones auxiliares ====================================================
# 'sub NOMBRE { ... }' define una FUNCIÓN (subrutina) reutilizable.

# Decodifica una query string de una URL a texto normal.
sub url_decode {

    # '@_' es el arreglo con los argumentos recibidos por la funcion. El '@' es
    #   el sigilo de los ARREGLOS (listas). 'my ($s) = @_;' copia el primer
    #   argumento en el escalar $s (asignación de lista).
    my ($s) = @_;

    # 'tr/buscar/reemplazar/' TRANSLITERA caracteres uno a uno: aquí cambia cada
    #   '+' por un espacio, porque en las URLs el espacio se codifica como '+'.
    $s =~ tr/+/ /;

    # 's/patron/reemplazo/ge' SUSTITUYE coincidencias del patron:
    #     %([0-9A-Fa-f]{2}) -> un '%' seguido de DOS dígitos hexadecimales
    #                          ([0-9A-Fa-f] es la clase, {2} = exactamente dos);
    #                          los paréntesis capturan esos dos dígitos en $1.
    #     chr(hex($1))      -> 'hex' convierte el texto hexadecimal a numero y
    #                          'chr' devuelve el caracter de ese codigo.
    #     g  -> global: aplica a TODAS las coincidencias de la cadena.
    #     e  -> evalua el reemplazo como CÓDIGO Perl (por eso chr/hex funcionan).
    $s =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/ge;

    # 'return' devuelve el resultado (la cadena ya decodificada) a quien llamo.
    return $s;
}

# Escapa los caracteres peligrosos para evitar ataques XSS al imprimir en HTML.
sub escape_html {

    # Copia el primer argumento recibido (el texto a escapar) en $s.
    my ($s) = @_;

    # 's/&/&amp;/g' reemplaza TODOS los '&' por la entidad '&amp;'. Debe ir
    #   PRIMERO para no re-escapar los '&' que generan las siguientes lineas.
    $s =~ s/&/&amp;/g;

    # Reemplaza '<' por '&lt;' para que el navegador no lo interprete como
    #   inicio de etiqueta (asi no se ejecuta un <script> inyectado).
    $s =~ s/</&lt;/g;

    # Reemplaza '>' por '&gt;' (cierre de etiqueta).
    $s =~ s/>/&gt;/g;

    # Reemplaza la comilla doble por '&quot;' (segura dentro de atributos HTML).
    $s =~ s/"/&quot;/g;

    # Devuelve el texto ya seguro para mostrarse en la pagina.
    return $s;
}