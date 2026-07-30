-- =====================================================================
--  V2__seed_datos_referenciales.sql
--  Proyecto : storeProcAccesodatos
--  Autor    : Dr. Gleiston Guerrero -- UTEQ
--  Objetivo : Datos semilla minimos para desarrollo y pruebas.
--  Motor    : PostgreSQL 16
-- =====================================================================

-- Clientes de prueba
INSERT INTO cliente (cedula, nombres, apellidos, email, telefono, direccion) VALUES
    ('1204567890',    'Maria',   'Vera',      'maria.vera@example.com',    '0991111111', 'Quevedo, Los Rios'),
    ('1305678901',    'Juan',    'Perez',     'juan.perez@example.com',    '0992222222', 'Guayaquil, Guayas'),
    ('1099999999001', 'Cliente', 'Corporativo','ventas@corp.example.com',   '042000000',  'Manta, Manabi');

-- Productos de prueba
INSERT INTO producto (codigo, nombre, descripcion, precio_unitario, stock, iva_porcentaje) VALUES
    ('P0001', 'Cuaderno universitario 100 hojas', 'Espiral, cuadros', 2.50,  100, 15.00),
    ('P0002', 'Boligrafo azul',                   'Punto medio',      0.35,  500, 15.00),
    ('P0003', 'Laptop 14 pulgadas',               '8 GB RAM, 256 SSD',680.00, 15,  15.00),
    ('P0004', 'Mouse inalambrico',                'USB, 2.4 GHz',     12.90, 40,  15.00),
    ('P0005', 'Resma papel A4 75 g',              '500 hojas',        4.20,  60,  15.00);

-- =====================================================================
--  Fin de V2__seed_datos_referenciales.sql
-- =====================================================================
