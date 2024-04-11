CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Direcci�n VARCHAR(255) NOT NULL,
    Tel�fono VARCHAR(20) NOT NULL
);

CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY NOT NULL,
    Fecha DATE NOT NULL,
    IDCliente INT NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Art�culo (
    IDArt�culo INT PRIMARY KEY NOT NULL,
    Descripci�n VARCHAR(255) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE DetallePedido (
    IDDetallePedido INT PRIMARY KEY NOT NULL,
    IDPedido INT NOT NULL,
    IDArt�culo INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDPedido) REFERENCES Pedido(IDPedido),
    FOREIGN KEY (IDArt�culo) REFERENCES Art�culo(IDArt�culo)
);

INSERT INTO Cliente (IDCliente, Nombre, Direcci�n, Tel�fono)
VALUES
    (1, 'Juan P�rez', 'Calle Principal 123', '555-1234'),
    (2, 'Mar�a Rodr�guez', 'Avenida Central 456', '555-5678'),
    (3, 'Pedro G�mez', 'Plaza Mayor 789', '555-9876'),
    (4, 'Ana L�pez', 'Paseo del Sol 321', '555-4321'),
    (5, 'Carlos Mart�nez', 'Callej�n Secreto 654', '555-8765');

INSERT INTO Art�culo (IDArt�culo, Descripci�n, Precio, Stock)
VALUES
    (1, 'Laptop HP Spectre x360', 1500.00, 30),
    (2, 'Smartphone Samsung Galaxy S21', 800.00, 45),
    (3, 'Tablet Apple iPad Pro', 1000.00, 20),
    (4, 'Monitor Dell Ultrasharp 27"', 400.00, 35),
    (5, 'Auriculares Sony WH-1000XM4', 300.00, 25),
    (6, 'Router ASUS RT-AX88U', 200.00, 15),
    (7, 'C�mara Canon EOS R5', 2500.00, 10),
    (8, 'Impresora Epson EcoTank ET-4760', 350.00, 40),
    (9, 'Teclado mec�nico Logitech G Pro', 120.00, 50),
    (10, 'Mouse inal�mbrico Microsoft Surface', 60.00, 30);

-- Pedido 1
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (1, '2024-04-12', 1, 'Pendiente');

-- Pedido 2
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (2, '2024-04-13', 2, 'En proceso');

-- Pedido 3
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (3, '2024-04-14', 3, 'Completado');

-- Pedido 4
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (4, '2024-04-15', 4, 'Pendiente');

-- Pedido 5
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (5, '2024-04-16', 5, 'En proceso');

-- Pedido 6
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (6, '2024-04-17', 1, 'Completado');

-- Pedido 7
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (7, '2024-04-18', 2, 'Pendiente');

-- Pedido 8
INSERT INTO Pedido (IDPedido, Fecha, IDCliente, Estado)
VALUES (8, '2024-04-19', 3, 'En proceso');


-- Detalle del Pedido 1
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (1, 1, 1, 2, 1500.00);

-- Actualizaci�n del stock 
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 1)
WHERE IDArt�culo = 1; -- Aseg�rate de especificar el ID del art�culo correcto

-- Detalle del Pedido 2
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (2, 2, 2, 3, 800.00);

-- Actualizaci�n del stock para el Pedido 2
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 2)
WHERE IDArt�culo = 2;

-- Detalle del Pedido 3
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (3, 3, 3, 1, 1000.00);

-- Actualizaci�n del stock para el Pedido 3
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 3)
WHERE IDArt�culo = 3;

-- Detalle del Pedido 4
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (4, 4, 4, 2, 400.00);

-- Actualizaci�n del stock para el Pedido 4
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 4)
WHERE IDArt�culo = 4;

-- Detalle del Pedido 5
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (5, 5, 5, 1, 300.00);

-- Actualizaci�n del stock para el Pedido 5
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 5)
WHERE IDArt�culo = 5;

-- Detalle del Pedido 6
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (6, 6, 6, 3, 200.00);

-- Actualizaci�n del stock para el Pedido 6
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 6)
WHERE IDArt�culo = 6;

-- Detalle del Pedido 7
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (7, 7, 7, 1, 2500.00);

-- Actualizaci�n del stock para el Pedido 7
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 7)
WHERE IDArt�culo = 7;

-- Detalle del Pedido 8
INSERT INTO DetallePedido (IDDetallePedido, IDPedido, IDArt�culo, Cantidad, PrecioUnitario)
VALUES (8, 8, 8, 2, 350.00);

-- Actualizaci�n del stock para el Pedido 8
UPDATE Art�culo
SET Stock = Stock - (SELECT Cantidad FROM DetallePedido WHERE IDDetallePedido = 8)
WHERE IDArt�culo = 8;

SELECT * FROM CLIENTE;
SELECT * FROM PEDIDO;
SELECT * FROM DetallePedido;
SELECT * FROM Art�culo;