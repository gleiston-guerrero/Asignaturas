#!/usr/bin/perl
# ============================================================================
#  bd_postgres.pl  -  UTEQ - Aplicaciones Web - Unidad II
#  Acceso a una base de datos PostgreSQL desde PERL con DBI + DBD::Pg.
#  Conecta, crea una tabla, inserta filas con sentencias preparadas,
#  consulta los datos y los muestra. Al final cierra la conexion.
#
#  REQUISITOS (una sola vez, en la terminal):
#     cpan DBI        # interfaz de bases de datos (Strawberry suele traerlo)
#     cpan DBD::Pg    # driver de PostgreSQL (NO viene por defecto)
#  Ademas: PostgreSQL en ejecucion y la base 'appweb2026ppa' creada.
# ============================================================================

use strict;
use warnings;
use utf8;
use DBI;                          # interfaz estandar de bases de datos en Perl

binmode(STDOUT, ':encoding(UTF-8)');

# --- Datos de conexión -------------------------------------------------------
my $bd      = 'appweb2026ppa';    # nombre de la base de datos
my $host    = '127.0.0.1';        # servidor (este equipo)
my $puerto  = 5432;               # puerto de PostgreSQL
my $usuario = 'postgres';         # usuario

# OJO: la clave lleva $ y @, por eso va en COMILLAS SIMPLES (no interpola).
my $clave   = 'P@$7Gr3$QL';

# DSN (Data Source Name): cadena que describe la conexión.
my $dsn = "dbi:Pg:dbname=$bd;host=$host;port=$puerto";

# --- Conectar ----------------------------------------------------------------
my $dbh = DBI->connect($dsn, $usuario, $clave, {
    RaiseError     => 1,   # si algo falla, lanza error y aborta
    AutoCommit     => 1,   # confirma cada sentencia automaticamente
    pg_enable_utf8 => 1,   # maneja el texto como UTF-8
}) or die "No se pudo conectar: $DBI::errstr";

print "Conexion exitosa a la base '$bd'.\n";

# --- Crear la tabla (si no existe) -------------------------------------------
$dbh->do(q{
    CREATE TABLE IF NOT EXISTS estudiantes (
        id     SERIAL PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        correo VARCHAR(120)
    )
});

# --- Insertar con SENTENCIA PREPARADA (anti SQL Injection) -------------------
my $insertar = $dbh->prepare(
    'INSERT INTO estudiantes (nombre, correo) VALUES (?, ?)'
);
$insertar->execute('Ana Perez', 'ana@uteq.edu.ec');
$insertar->execute('Luis Mora', 'luis@uteq.edu.ec');

# --- Consultar ---------------------------------------------------------------
my $consulta = $dbh->prepare(
    'SELECT id, nombre, correo FROM estudiantes ORDER BY id'
);
$consulta->execute;

print "\nEstudiantes registrados:\n";
while (my $fila = $consulta->fetchrow_hashref) {
    print "  [$fila->{id}] $fila->{nombre} - $fila->{correo}\n";
}

# --- Cerrar ------------------------------------------------------------------
$consulta->finish;
$dbh->disconnect;
print "\nConexion cerrada.\n";