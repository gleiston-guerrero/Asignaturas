-- =============================================================
-- V1 - Creacion de tablas del sistema de facturacion
-- =============================================================

CREATE TABLE clientes (
    id             BIGSERIAL PRIMARY KEY,
    cedula_ruc     VARCHAR(13)  NOT NULL UNIQUE,
    nombres        VARCHAR(150) NOT NULL,
    email          VARCHAR(180),
    telefono       VARCHAR(20),
    direccion      VARCHAR(250),
    activo         BOOLEAN      NOT NULL DEFAULT TRUE,
    creado_en      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    actualizado_en TIMESTAMPTZ
);

CREATE INDEX idx_clientes_activo ON clientes(activo);

CREATE TABLE proveedores (
    id             BIGSERIAL PRIMARY KEY,
    ruc            VARCHAR(13)  NOT NULL UNIQUE,
    razon_social   VARCHAR(180) NOT NULL,
    email          VARCHAR(180),
    telefono       VARCHAR(20),
    direccion      VARCHAR(250),
    activo         BOOLEAN      NOT NULL DEFAULT TRUE,
    creado_en      TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    actualizado_en TIMESTAMPTZ
);

CREATE INDEX idx_proveedores_activo ON proveedores(activo);

CREATE TABLE productos (
    id              BIGSERIAL PRIMARY KEY,
    codigo          VARCHAR(30)   NOT NULL UNIQUE,
    descripcion     VARCHAR(200)  NOT NULL,
    precio_unitario NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0),
    stock           INTEGER       NOT NULL DEFAULT 0 CHECK (stock >= 0),
    proveedor_id    BIGINT        NOT NULL REFERENCES proveedores(id),
    activo          BOOLEAN       NOT NULL DEFAULT TRUE,
    creado_en       TIMESTAMPTZ   NOT NULL DEFAULT NOW(),
    actualizado_en  TIMESTAMPTZ
);

CREATE INDEX idx_productos_proveedor ON productos(proveedor_id);
CREATE INDEX idx_productos_activo ON productos(activo);

-- Secuencia para el numerador de facturas (FN06 la usa).
CREATE SEQUENCE seq_factura_numero START 1 INCREMENT 1;

CREATE TABLE facturas (
    id           BIGSERIAL PRIMARY KEY,
    numero       VARCHAR(20)   NOT NULL UNIQUE,
    fecha        DATE          NOT NULL DEFAULT CURRENT_DATE,
    cliente_id   BIGINT        NOT NULL REFERENCES clientes(id),
    subtotal     NUMERIC(12,2) NOT NULL CHECK (subtotal >= 0),
    iva          NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (iva >= 0),
    total        NUMERIC(12,2) NOT NULL CHECK (total >= 0),
    estado       VARCHAR(20)   NOT NULL DEFAULT 'EMITIDA'
                 CHECK (estado IN ('EMITIDA','PAGADA','ANULADA')),
    creado_en    TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_facturas_cliente ON facturas(cliente_id);
CREATE INDEX idx_facturas_fecha   ON facturas(fecha);
CREATE INDEX idx_facturas_estado  ON facturas(estado);

CREATE TABLE detalles_factura (
    id              BIGSERIAL PRIMARY KEY,
    factura_id      BIGINT        NOT NULL REFERENCES facturas(id) ON DELETE CASCADE,
    producto_id     BIGINT        NOT NULL REFERENCES productos(id),
    cantidad        INTEGER       NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0),
    subtotal        NUMERIC(12,2) NOT NULL CHECK (subtotal >= 0)
);

CREATE INDEX idx_detalles_factura ON detalles_factura(factura_id);
CREATE INDEX idx_detalles_producto ON detalles_factura(producto_id);
