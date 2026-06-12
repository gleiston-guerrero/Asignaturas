-- ============================================================
--  TiendaUTEQ - Esquema de base de datos PostgreSQL
--  Esquemas: seguridad, inventario, facturacion
-- ============================================================
DROP SCHEMA IF EXISTS facturacion CASCADE;
DROP SCHEMA IF EXISTS inventario  CASCADE;
DROP SCHEMA IF EXISTS seguridad   CASCADE;

CREATE SCHEMA seguridad;
CREATE SCHEMA inventario;
CREATE SCHEMA facturacion;

-- ------------------------------------------------------------
--  SEGURIDAD: control de acceso por rol (RBAC)
-- ------------------------------------------------------------
CREATE TABLE seguridad.rol (
    id          SERIAL PRIMARY KEY,
    nombre      VARCHAR(40)  NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

CREATE TABLE seguridad.usuario (
    id            SERIAL PRIMARY KEY,
    username      VARCHAR(40)  NOT NULL UNIQUE,
    password_hash VARCHAR(64)  NOT NULL,           -- SHA-256 hex (demo)
    nombre        VARCHAR(100) NOT NULL,
    email         VARCHAR(120),
    activo        BOOLEAN      NOT NULL DEFAULT TRUE,
    creado        TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- Relación N:M usuario-rol (un usuario puede tener varios roles)
CREATE TABLE seguridad.usuario_rol (
    id_usuario INTEGER NOT NULL REFERENCES seguridad.usuario(id) ON DELETE CASCADE,
    id_rol     INTEGER NOT NULL REFERENCES seguridad.rol(id)     ON DELETE CASCADE,
    PRIMARY KEY (id_usuario, id_rol)
);

CREATE TABLE seguridad.pagina (
    id          SERIAL PRIMARY KEY,
    nombre      VARCHAR(60)  NOT NULL,
    url         VARCHAR(60)  NOT NULL UNIQUE,       -- identificador lógico: index, catalogo...
    publica     BOOLEAN      NOT NULL DEFAULT FALSE,
    orden       INTEGER      NOT NULL DEFAULT 0,
    descripcion VARCHAR(150)
);

-- Permiso: qué rol puede entrar a qué página restringida
CREATE TABLE seguridad.permiso (
    id        SERIAL PRIMARY KEY,
    id_rol    INTEGER NOT NULL REFERENCES seguridad.rol(id)    ON DELETE CASCADE,
    id_pagina INTEGER NOT NULL REFERENCES seguridad.pagina(id) ON DELETE CASCADE,
    UNIQUE (id_rol, id_pagina)
);

-- ------------------------------------------------------------
--  FACTURACION: clientes (se referencia desde inventario.pedido)
-- ------------------------------------------------------------
CREATE TABLE facturacion.cliente (
    id             SERIAL PRIMARY KEY,
    id_usuario     INTEGER NOT NULL UNIQUE REFERENCES seguridad.usuario(id) ON DELETE CASCADE,
    nombres        VARCHAR(80)  NOT NULL,
    apellidos      VARCHAR(80)  NOT NULL,
    identificacion VARCHAR(20),
    direccion      VARCHAR(150),
    telefono       VARCHAR(30),
    email          VARCHAR(120)
);

-- ------------------------------------------------------------
--  INVENTARIO: proveedores, productos, precios, pedidos
-- ------------------------------------------------------------
CREATE TABLE inventario.proveedor (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(120) NOT NULL,
    email     VARCHAR(120) NOT NULL,
    telefono  VARCHAR(30),
    direccion VARCHAR(150)
);

CREATE TABLE inventario.producto (
    id                  SERIAL PRIMARY KEY,
    nombre              VARCHAR(120) NOT NULL,
    descripcion         VARCHAR(250),
    id_proveedor        INTEGER NOT NULL REFERENCES inventario.proveedor(id),
    existencias         INTEGER NOT NULL DEFAULT 0,   -- stock fisico disponible
    existencias_minimas INTEGER NOT NULL DEFAULT 0,   -- punto de reorden
    reservado           INTEGER NOT NULL DEFAULT 0,   -- unidades retenidas en carritos / por despachar
    activo              BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_existencias CHECK (existencias  >= 0),
    CONSTRAINT chk_reservado   CHECK (reservado    >= 0)
);

-- Historial de precios (normalizacion: un producto tiene muchos precios en el tiempo)
CREATE TABLE inventario.precio (
    id            SERIAL PRIMARY KEY,
    id_producto   INTEGER NOT NULL REFERENCES inventario.producto(id) ON DELETE CASCADE,
    valor         NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    vigente_desde DATE    NOT NULL DEFAULT CURRENT_DATE,
    vigente_hasta DATE,
    activo        BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE inventario.pedido (
    id             SERIAL PRIMARY KEY,
    id_cliente     INTEGER NOT NULL REFERENCES facturacion.cliente(id),
    id_despachador INTEGER REFERENCES seguridad.usuario(id),
    estado         VARCHAR(20) NOT NULL DEFAULT 'CARRITO'
                   CHECK (estado IN ('CARRITO','EN_DESPACHO','DESPACHADO','CANCELADO')),
    liberado       BOOLEAN     NOT NULL DEFAULT FALSE,  -- TRUE si se soltaron las reservas al cerrar sesion
    total          NUMERIC(12,2) NOT NULL DEFAULT 0,
    creado         TIMESTAMP   NOT NULL DEFAULT NOW(),
    fecha_pago     TIMESTAMP
);

CREATE TABLE inventario.pedido_detalle (
    id              SERIAL PRIMARY KEY,
    id_pedido       INTEGER NOT NULL REFERENCES inventario.pedido(id) ON DELETE CASCADE,
    id_producto     INTEGER NOT NULL REFERENCES inventario.producto(id),
    cantidad        INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL,
    despachado      BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE (id_pedido, id_producto)
);

-- ------------------------------------------------------------
--  FACTURACION: facturas
-- ------------------------------------------------------------
CREATE TABLE facturacion.factura (
    id         SERIAL PRIMARY KEY,
    id_pedido  INTEGER NOT NULL UNIQUE REFERENCES inventario.pedido(id),
    id_cliente INTEGER NOT NULL REFERENCES facturacion.cliente(id),
    numero     VARCHAR(20) NOT NULL UNIQUE,
    fecha      TIMESTAMP   NOT NULL DEFAULT NOW(),
    subtotal   NUMERIC(12,2) NOT NULL,
    iva        NUMERIC(12,2) NOT NULL,
    total      NUMERIC(12,2) NOT NULL
);

CREATE TABLE facturacion.factura_detalle (
    id              SERIAL PRIMARY KEY,
    id_factura      INTEGER NOT NULL REFERENCES facturacion.factura(id) ON DELETE CASCADE,
    id_producto     INTEGER NOT NULL REFERENCES inventario.producto(id),
    descripcion     VARCHAR(150) NOT NULL,
    cantidad        INTEGER NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    subtotal        NUMERIC(12,2) NOT NULL
);

-- ------------------------------------------------------------
--  Indices y vista de disponibilidad
-- ------------------------------------------------------------
CREATE INDEX idx_pedido_despachador ON inventario.pedido(id_despachador, estado);
CREATE INDEX idx_pedido_cliente     ON inventario.pedido(id_cliente, estado);
CREATE INDEX idx_precio_activo      ON inventario.precio(id_producto, activo);

-- Disponible = existencias fisicas - reservado
CREATE VIEW inventario.v_producto_disponible AS
SELECT p.id, p.nombre, p.descripcion, p.id_proveedor,
       p.existencias, p.existencias_minimas, p.reservado,
       (p.existencias - p.reservado) AS disponible, p.activo,
       (SELECT pr.valor FROM inventario.precio pr
         WHERE pr.id_producto = p.id AND pr.activo = TRUE
         ORDER BY pr.vigente_desde DESC LIMIT 1) AS precio_actual
FROM inventario.producto p;
