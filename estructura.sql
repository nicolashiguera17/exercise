-- Active: 1748963402291@@127.0.0.1@3307@EXERCISE
-- tabla de clientes --

CREATE TABLE `cliente`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(11) NOT NULL UNIQUE,
    `direccion` VARCHAR(150) NOT NULL,
    INDEX (nombre)
);

CREATE TABLE `producto`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `tipo_producto_id` INT NOT NULL,
    INDEX (tipo_producto_id)
);

CREATE TABLE `combo`(
    `id` INT NOT NULL PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `precio` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE `detalle_pedido`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad` INT NOT NULL,
    `pedido_id` INT NOT NULL,
    `producto_id` INT NOT NULL,
    INDEX (pedido_id,producto_id)
);

CREATE TABLE `factura`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente` VARCHAR(100) NOT NULL,
    `total` DECIMAL(10, 2) NOT NULL,
    `fecha` DATETIME NOT NULL,
    `pedido_id` INT NOT NULL,
    `cliente_id` INT NOT NULL,
    INDEX (pedido_id,cliente_id)
);

CREATE TABLE `pedido`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fecha_recogida` DATETIME NOT NULL,
    `total` DECIMAL(10, 2) NOT NULL,
    `cliente_id` INT NOT NULL,
    `metodo_pago_id` INT NOT NULL,
    INDEX (cliente_id,metodo_pago_id)
);

CREATE TABLE `metodo_pago`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL
);

CREATE TABLE `ingrediente_extra`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad` INT NOT NULL,
    `detalle_pedido_id` INT NOT NULL,
    `ingrediente_id` INT NOT NULL,
    INDEX (detalle_pedido_id,ingrediente_id)
);

CREATE TABLE `tipo_producto`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL
);

CREATE TABLE `presentacion`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL
);

CREATE TABLE `ingrediente`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `stock` INT NOT NULL,
    `precio` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE `producto_presentacion`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `producto_id` INT NOT NULL,
    `presentacion_id` INT NOT NULL,
    `precio` DECIMAL(10, 2) NOT NULL,
    INDEX (producto_id,presentacion_id)
);

CREATE TABLE `producto_combo`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `producto_id` INT NOT NULL,
    `combo_id` INT NOT NULL,
    INDEX (producto_id,combo_id)
);

-- Foraneas de las tablas

ALTER TABLE
    `ingrediente_extra` ADD CONSTRAINT `ingrediente_extra_ingrediente_id` FOREIGN KEY(`ingrediente_id`) REFERENCES `ingrediente`(`id`);

ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_metodo_pago_id` FOREIGN KEY(`metodo_pago_id`) REFERENCES `metodo_pago`(`id`);

ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_pedido_id` FOREIGN KEY(`pedido_id`) REFERENCES `pedido`(`id`);

ALTER TABLE
    `ingrediente_extra` ADD CONSTRAINT `ingrediente_extra_detalle_pedido_id` FOREIGN KEY(`detalle_pedido_id`) REFERENCES `detalle_pedido`(`id`);

ALTER TABLE
    `producto_combo` ADD CONSTRAINT `producto_combo_producto_id` FOREIGN KEY(`producto_id`) REFERENCES `producto`(`id`);

ALTER TABLE
    `factura` ADD CONSTRAINT `factura_cliente_id` FOREIGN KEY(`cliente_id`) REFERENCES `cliente`(`id`);

ALTER TABLE
    `producto_combo` ADD CONSTRAINT `producto_combo_combo_id` FOREIGN KEY(`combo_id`) REFERENCES `combo`(`id`);

ALTER TABLE
    `producto_presentacion` ADD CONSTRAINT `producto_presentacion_presentacion_id` FOREIGN KEY(`presentacion_id`) REFERENCES `presentacion`(`id`);

ALTER TABLE
    `producto_presentacion` ADD CONSTRAINT `producto_presentacion_producto_id` FOREIGN KEY(`producto_id`) REFERENCES `producto`(`id`);

ALTER TABLE
    `detalle_pedido` ADD CONSTRAINT `detalle_pedido_producto_id` FOREIGN KEY(`producto_id`) REFERENCES `producto`(`id`);

ALTER TABLE
    `producto` ADD CONSTRAINT `producto_tipo_producto_id` FOREIGN KEY(`tipo_producto_id`) REFERENCES `tipo_producto`(`id`);
    
ALTER TABLE
    `factura` ADD CONSTRAINT `factura_pedido_id` FOREIGN KEY(`pedido_id`) REFERENCES `pedido`(`id`);