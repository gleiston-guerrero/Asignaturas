-- =============================================================
-- V3 - Datos iniciales (seed) para desarrollo y pruebas
-- =============================================================

INSERT INTO proveedores (ruc, razon_social, email, telefono, direccion) VALUES
    ('1791234567001', 'Distribuidora Andina S.A.', 'ventas@andina.ec', '022345678', 'Av. Amazonas 123, Quito'),
    ('0991234567001', 'Comercial del Pacifico Cia. Ltda.', 'contacto@pacifico.ec', '042345678', 'Av. 9 de Octubre 456, Guayaquil');

INSERT INTO clientes (cedula_ruc, nombres, email, telefono, direccion) VALUES
    ('1205551234', 'Maria Fernanda Vera Loor', 'mfvera@correo.ec', '0987654321', 'Quevedo, Los Rios'),
    ('1305557890', 'Juan Carlos Cedeno Zambrano', 'jccedeno@correo.ec', '0998765432', 'Portoviejo, Manabi');

INSERT INTO productos (codigo, descripcion, precio_unitario, stock, proveedor_id) VALUES
    ('P-001', 'Laptop 14 pulgadas 16GB RAM', 850.00, 20, 1),
    ('P-002', 'Mouse inalambrico ergonomico',  15.50, 100, 1),
    ('P-003', 'Teclado mecanico retroiluminado', 65.00, 50, 2),
    ('P-004', 'Monitor 24 pulgadas Full HD', 180.00, 30, 2);
