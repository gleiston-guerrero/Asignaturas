-- =====================================================================
--  V1__init_schema.sql
--  Proyecto : storeProcAccesodatos (dominio Facturacion)
--  Autor    : Dr. Gleiston Guerrero -- UTEQ
--  Objetivo : Crear el esquema base para la aplicacion de facturacion
--             usada como conductor en Unidad II de Aplicaciones Web.
--  Motor    : PostgreSQL 16
-- =====================================================================

-- ---------------------------------------------------------------------
-- Extensiones utiles (idempotente)
-- ---------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS unaccent;

-- ---------------------------------------------------------------------
-- Tabla: cliente
-- ---------------------------------------------------------------------
CREATE TABLE cliente (
    id                   BIGSERIAL     PRIMARY KEY,
    cedula               VARCHAR(13)   NOT NULL UNIQUE,
    nombres              VARCHAR(120)  NOT NULL,
    apellidos            VARCHAR(120)  NOT NULL,
    email                VARCHAR(180),
    telefono             VARCHAR(20),
    direccion            VARCHAR(255),
    activo               BOOLEAN       NOT NULL DEFAULT TRUE,
    fecha_creacion       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion  TIMESTAMP,
    CONSTRAINT chk_cliente_cedula_len CHECK (char_length(cedula) BETWEEN 10 AND 13),
    CONSTRAINT chk_cliente_email      CHECK (email IS NULL OR email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

CREATE INDEX idx_cliente_apellidos ON cliente (apellidos);
CREATE INDEX idx_cliente_activo    ON cliente (activo);

COMMENT ON TABLE  cliente               IS 'Clientes que pueden ser facturados.';
COMMENT ON COLUMN cliente.cedula        IS 'Cedula o RUC del cliente (10 o 13 digitos).';
COMMENT ON COLUMN cliente.activo        IS 'Baja logica; FALSE = no listar en operaciones normales.';

-- ---------------------------------------------------------------------
-- Tabla: producto
-- ---------------------------------------------------------------------
CREATE TABLE producto (
    id                   BIGSERIAL      PRIMARY KEY,
    codigo               VARCHAR(30)    NOT NULL UNIQUE,
    nombre               VARCHAR(180)   NOT NULL,
    descripcion          TEXT,
    precio_unitario      NUMERIC(12,2)  NOT NULL,
    stock                INTEGER        NOT NULL DEFAULT 0,
    iva_porcentaje       NUMERIC(5,2)   NOT NULL DEFAULT 15.00,
    activo               BOOLEAN        NOT NULL DEFAULT TRUE,
    fecha_creacion       TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion  TIMESTAMP,
    CONSTRAINT chk_producto_precio  CHECK (precio_unitario >= 0),
    CONSTRAINT chk_producto_stock   CHECK (stock >= 0),
    CONSTRAINT chk_producto_iva     CHECK (iva_porcentaje BETWEEN 0 AND 100)
);

CREATE INDEX idx_producto_nombre ON producto (nombre);
CREATE INDEX idx_producto_activo ON producto (activo);

COMMENT ON TABLE  producto                 IS 'Catalogo de productos disponibles para facturacion.';
COMMENT ON COLUMN producto.iva_porcentaje  IS 'Porcentaje de IVA aplicable (Ecuador 15% por defecto).';

-- ---------------------------------------------------------------------
-- Tabla: factura
-- ---------------------------------------------------------------------
CREATE TABLE factura (
    id              BIGSERIAL       PRIMARY KEY,
    numero          VARCHAR(20)     NOT NULL UNIQUE,
    cliente_id      BIGINT          NOT NULL,
    fecha_emision   DATE            NOT NULL DEFAULT CURRENT_DATE,
    subtotal        NUMERIC(14,2)   NOT NULL DEFAULT 0,
    total_iva       NUMERIC(14,2)   NOT NULL DEFAULT 0,
    total           NUMERIC(14,2)   NOT NULL DEFAULT 0,
    estado          VARCHAR(20)     NOT NULL DEFAULT 'EMITIDA',
    observaciones   TEXT,
    activo          BOOLEAN         NOT NULL DEFAULT TRUE,
    fecha_creacion  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_anulacion TIMESTAMP,
    motivo_anulacion VARCHAR(255),
    CONSTRAINT fk_factura_cliente  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT chk_factura_estado  CHECK (estado IN ('EMITIDA','ANULADA')),
    CONSTRAINT chk_factura_totales CHECK (subtotal >= 0 AND total_iva >= 0 AND total >= 0)
);

CREATE INDEX idx_factura_cliente_id    ON factura (cliente_id);
CREATE INDEX idx_factura_fecha_emision ON factura (fecha_emision);
CREATE INDEX idx_factura_estado        ON factura (estado);

COMMENT ON TABLE  factura                 IS 'Cabecera de facturas emitidas.';
COMMENT ON COLUMN factura.numero          IS 'Numero secuencial visible (p.ej. 001-001-000000001).';
COMMENT ON COLUMN factura.estado          IS 'EMITIDA o ANULADA.';

-- ---------------------------------------------------------------------
-- Tabla: factura_detalle
-- ---------------------------------------------------------------------
CREATE TABLE factura_detalle (
    id               BIGSERIAL      PRIMARY KEY,
    factura_id       BIGINT         NOT NULL,
    producto_id      BIGINT         NOT NULL,
    cantidad         INTEGER        NOT NULL,
    precio_unitario  NUMERIC(12,2)  NOT NULL,
    iva_porcentaje   NUMERIC(5,2)   NOT NULL,
    subtotal         NUMERIC(14,2)  NOT NULL,
    iva              NUMERIC(14,2)  NOT NULL,
    total            NUMERIC(14,2)  NOT NULL,
    CONSTRAINT fk_detalle_factura  FOREIGN KEY (factura_id)  REFERENCES factura(id)  ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id) REFERENCES producto(id),
    CONSTRAINT chk_detalle_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_precio   CHECK (precio_unitario >= 0)
);

CREATE INDEX idx_detalle_factura_id  ON factura_detalle (factura_id);
CREATE INDEX idx_detalle_producto_id ON factura_detalle (producto_id);

COMMENT ON TABLE factura_detalle IS 'Lineas de detalle de cada factura.';

-- ---------------------------------------------------------------------
-- Secuencia auxiliar para numeracion de facturas
-- ---------------------------------------------------------------------
CREATE SEQUENCE seq_factura_numero START WITH 1 INCREMENT BY 1;

COMMENT ON SEQUENCE seq_factura_numero IS 'Contador para numero visible de factura (formato 001-001-#########).';

-- =====================================================================
--  Fin de V1__init_schema.sql
-- =====================================================================
