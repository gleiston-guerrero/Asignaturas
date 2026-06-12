-- ============================================================
--  Datos de prueba TiendaUTEQ
--  Contrasenas demo (SHA-256): admin->admin123  ana->ana123
--  luis->luis123   carlos/marta->desp123
-- ============================================================

-- Roles
INSERT INTO seguridad.rol (nombre, descripcion) VALUES
 ('ADMIN','Administrador del sistema'),
 ('CLIENTE','Cliente que compra en el catalogo'),
 ('DESPACHADOR','Despacha los pedidos pagados');

-- Usuarios (password_hash = SHA-256 hex)
INSERT INTO seguridad.usuario (username, password_hash, nombre, email) VALUES
 ('admin' ,'240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','Administrador','admin@uteq.edu.ec'),
 ('ana'   ,'e82827b00b2ca8620beb37f879778c082b292a52270390cff35b6fe3157f4e8b','Ana Lopez','ana@example.com'),
 ('luis'  ,'ec7908dc8241f0e4340266990dfe6001b1757084d891c6758bfaac826750009a','Luis Mora','luis@example.com'),
 ('carlos','fac8456e4ec83d2d03da3208f0f709a6571bf6318da392f6aad4efe12ffb6990','Carlos Ruiz','carlos@uteq.edu.ec'),
 ('marta' ,'fac8456e4ec83d2d03da3208f0f709a6571bf6318da392f6aad4efe12ffb6990','Marta Vera','marta@uteq.edu.ec');

-- Asignacion de roles
INSERT INTO seguridad.usuario_rol (id_usuario, id_rol)
SELECT u.id, r.id FROM seguridad.usuario u, seguridad.rol r
WHERE (u.username,r.nombre) IN
 (('admin','ADMIN'),('ana','CLIENTE'),('luis','CLIENTE'),
  ('carlos','DESPACHADOR'),('marta','DESPACHADOR'));

-- Paginas (publica = TRUE -> sin restriccion)
INSERT INTO seguridad.pagina (nombre, url, publica, orden, descripcion) VALUES
 ('Inicio'        ,'index'          ,TRUE ,1,'Pagina principal'),
 ('Mision'        ,'mision'         ,TRUE ,2,'Mision institucional'),
 ('Vision'        ,'vision'         ,TRUE ,3,'Vision institucional'),
 ('Iniciar sesion','iniciosesion'   ,TRUE ,4,'Formulario de acceso'),
 ('Acceso denegado','acceso-denegado',TRUE,99,'Pagina de error 403'),
 ('Catalogo'      ,'catalogo'       ,FALSE,5,'Catalogo de productos'),
 ('Carrito'       ,'carrito'        ,FALSE,6,'Carrito de compras'),
 ('Facturar'      ,'facturar'       ,FALSE,7,'Pago y facturacion'),
 ('Mis pedidos'   ,'pedidos'        ,FALSE,8,'Consulta de pedidos del cliente'),
 ('Despacho'      ,'despacho'       ,FALSE,9,'Pedidos asignados al despachador'),
 ('Administracion','admin'          ,FALSE,10,'Panel de administracion');

-- Permisos: que rol entra a que pagina restringida
-- ADMIN: catalogo (vista), despacho (supervision) y panel admin
INSERT INTO seguridad.permiso (id_rol, id_pagina)
SELECT r.id, p.id FROM seguridad.rol r, seguridad.pagina p
WHERE r.nombre='ADMIN' AND p.url IN ('catalogo','despacho','admin');
-- CLIENTE: catalogo, carrito, facturar, pedidos
INSERT INTO seguridad.permiso (id_rol, id_pagina)
SELECT r.id, p.id FROM seguridad.rol r, seguridad.pagina p
WHERE r.nombre='CLIENTE' AND p.url IN ('catalogo','carrito','facturar','pedidos');
-- DESPACHADOR: despacho
INSERT INTO seguridad.permiso (id_rol, id_pagina)
SELECT r.id, p.id FROM seguridad.rol r, seguridad.pagina p
WHERE r.nombre='DESPACHADOR' AND p.url IN ('despacho');

-- Clientes (perfil de los usuarios CLIENTE)
INSERT INTO facturacion.cliente (id_usuario, nombres, apellidos, identificacion, direccion, telefono, email)
SELECT u.id,'Ana','Lopez','0912345678','Quevedo, Los Rios','0991111111','ana@example.com'
FROM seguridad.usuario u WHERE u.username='ana';
INSERT INTO facturacion.cliente (id_usuario, nombres, apellidos, identificacion, direccion, telefono, email)
SELECT u.id,'Luis','Mora','0923456789','Quevedo, Los Rios','0992222222','luis@example.com'
FROM seguridad.usuario u WHERE u.username='luis';

-- Proveedores
INSERT INTO inventario.proveedor (nombre, email, telefono, direccion) VALUES
 ('Tecnologia Andina S.A.','ventas@tecandina.com','042111222','Guayaquil'),
 ('Suministros del Pacifico','compras@sumipacifico.com','042333444','Manta'),
 ('Importadora Quevedo','info@impoquevedo.com','052555666','Quevedo');

-- Productos (existencias, existencias_minimas)
INSERT INTO inventario.producto (nombre, descripcion, id_proveedor, existencias, existencias_minimas) VALUES
 ('Teclado mecanico','Switch azul retroiluminado',1,40,8),
 ('Mouse inalambrico','1600 DPI ergonomico',1,75,10),
 ('Monitor 24 pulgadas','Full HD IPS 75Hz',2,12,5),
 ('Audifonos Bluetooth','Cancelacion de ruido',2,30,6),
 ('Memoria USB 64GB','USB 3.2 lectura rapida',3,9,4),
 ('Webcam 1080p','Microfono integrado',3,18,5);

-- Precio vigente de cada producto
INSERT INTO inventario.precio (id_producto, valor) VALUES
 (1,45.90),(2,18.50),(3,139.00),(4,59.90),(5,12.75),(6,32.40);
