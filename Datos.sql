INSERT INTO cliente (nombre, telefono, direccion) 
VALUES
('MeliSsa gate ', '3101234567', 'Calle 7 #23-45'),
('Andres Altafulla ', '3209876543', 'Carrera 20 # 18-26'),
('Emiro navarro ', '3154567890', 'Carrera 15 # 12-34');

INSERT INTO tipo_producto (nombre) 
VALUES
('Pizzas'),
('Bebidas');

INSERT INTO producto (nombre, tipo_producto_id) 
VALUES
('pizza colombiana', 1),
('pizza mexicana', 1),
('pizza hawaina', 1),
('coca cola',2),
('Agua',2),
('Mr tea',2);

INSERT INTO combo (nombre, precio) 
VALUES
('Combo Familiar', 50000),
('Combo Individual', 15000),
('Combo friends', 35000);

INSERT INTO metodo_pago (nombre) 
VALUES
('Efectivo'),
('Nequi'),
('Bancolombia');

INSERT INTO pedido (fecha_recogida, total, cliente_id, metodo_pago_id) 
VALUES
('2025-06-10',80000 , 1, 2),
('2025-06-10 ',45000 , 2, 1),
('2025-06-10 ', 60000, 3, 3);

INSERT INTO ingrediente (nombre, stock, precio) 
VALUES
('Tomate', 50, 1000),
('Queso', 100, 16000),
('pina', 40, 4000),
('carne', 60,34000 ),
('pepperoni', 80, 60000),
('maiz', 70, 40000);

INSERT INTO ingrediente_extra (cantidad, detalle_pedido_id, ingrediente_id) 
VALUES
(4, 1, 2), 
(6, 2, 5), 
(7, 3, 4),
(1, 2, 2), 
(2, 3, 4);

INSERT INTO presentacion (nombre) 
VALUES
('Pequeña'),    
('Mediana'),
('Grande');

INSERT INTO producto_presentacion (producto_id, presentacion_id, precio) 
VALUES
(1, 1, 12000), 
(2, 2, 18000), 
(3, 3, 25000), 
(4, 2, 3500), 
(5, 3, 4000); 


INSERT INTO producto_combo (producto_id, combo_id) 
VALUES
(1, 2), 
(2, 3), 
(3, 3), 

