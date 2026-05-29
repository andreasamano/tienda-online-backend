CREATE DATABASE IF NOT EXISTS tienda_online CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tienda_online;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    icono VARCHAR(10) DEFAULT '📦',
    activo BOOLEAN DEFAULT TRUE,
    destacado BOOLEAN DEFAULT FALSE,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nombre VARCHAR(120) NOT NULL,
    cliente_correo VARCHAR(120) NOT NULL,
    direccion TEXT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(40) DEFAULT 'Recibido',
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pedido_detalles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT,
    producto_nombre VARCHAR(120) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

INSERT INTO productos (nombre, categoria, descripcion, precio, stock, icono, activo, destacado) VALUES
('Audífonos Bluetooth AirBeat', 'Tecnología', 'Audífonos inalámbricos con cancelación de ruido y batería de larga duración.', 699.00, 18, '🎧', TRUE, TRUE),
('Mochila Urbana Pro', 'Accesorios', 'Mochila resistente al agua con compartimento para laptop y cargador.', 549.00, 12, '🎒', TRUE, FALSE),
('Teclado Mecánico RGB', 'Gaming', 'Teclado mecánico con iluminación RGB, switches azules y diseño compacto.', 899.00, 9, '⌨️', TRUE, TRUE),
('Playera Oversize Nova', 'Ropa', 'Playera de algodón corte oversize disponible en varias tallas.', 249.00, 25, '👕', TRUE, FALSE),
('Lámpara LED Smart', 'Hogar', 'Lámpara inteligente con control de intensidad y colores desde app.', 399.00, 15, '💡', TRUE, FALSE);
