#--__________ FAMILIA DE PRODUCTOS __________

CREATE TABLE FamiliaProductos (
  FamiliaProductoID INTEGER UNSIGNED AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL,
  CONSTRAINT PK_FamiliaProductos PRIMARY KEY (FamiliaProductoID)
);

INSERT INTO FamiliaProductos (Nombre) VALUES
  ('Bebidas Alcoholicas'),
  ('Bebidas No Alcoholicas'),
  ('Dulces y Delikatesen');


  #--__________ CATEGORIA DE PRODUCTOS __________

  CREATE TABLE CategoriaProductos (
    CategoriaID INTEGER UNSIGNED AUTO_INCREMENT,
    FamiliaProductoID INTEGER UNSIGNED NOT NULL,
    Nombre VARCHAR(60) NOT NULL,
    CONSTRAINT PK_CategoriaProductos PRIMARY KEY (CategoriaID),
    CONSTRAINT FK_CategoriaProductos_FamiliaProductos FOREIGN KEY (FamiliaProductoID) REFERENCES FamiliaProductos (FamiliaProductoID)
  );

  INSERT INTO CategoriaProductos (FamiliaProductoID, Nombre) VALUES
    (1, 'Cervezas'),
    (1, 'Vinos'),
    (1, 'Whisky'),
    (1, 'Aperitivo'),
    (1, 'Ron'),
    (1, 'Aguardiente'),
    (2, 'Gaseosas'),
    (2, 'Jugos'),
    (2, 'Agua'),
    (3, 'Galletas'),
    (3, 'Gomas De Mascar'),
    (3, 'Caramelos'),
    (3, 'Papas');


  #--__________ PRODUCTOS __________

CREATE TABLE Productos (
  ProductoID INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  CategoriaID INTEGER UNSIGNED NOT NULL,
  Descripcion VARCHAR(160) NOT NULL,
  PrecioCompra DECIMAL(10,2),
  PrecioVenta DECIMAL(10,2),
  IVA INT DEFAULT 16,
  UnidadMedida INTEGER UNSIGNED,
  CantidadExistencia INT,
  CostoPromedio DECIMAL(10,2),
  StockMinimo INT,
  StockMaximo INT,
  Nota VARCHAR(250)
);

ALTER TABLE Productos MODIFY UnidadMedida VARCHAR(5);

INSERT INTO Productos (CategoriaID, Descripcion, PrecioCompra, PrecioVenta, IVA, UnidadMedida, CantidadExistencia, CostoPromedio, StockMinimo, StockMaximo, Nota) VALUES
(7, 'Coca-Cola 250 CC x 12', 10300, 12000, 16, 'CC', 10, 10300, 1, 5, 'Coca-Cola 250 CC x 12'),
(7, 'Coca-Cola 250 CC', 858.33, 1200, 16, 'CC', 10, 858, 5, 12, 'Coca-Cola 250 CC'),
(1, 'Modelo 330 CC x 24', 48000, 52000, 16, 'CC', 3, 48000, 1, 2, 'Cerveza mexicana x 24.'),
(1, 'Modelo 330 CC', 2000, 2500, 16, 'CC', 15, 2000, 5, 24, 'Cerveza mexicana.'),
(9, 'Agua Brisa Pet 280 CC x 24', 30100, 33000, 16, 'CC', 3, 30100, 1, 2, 'Agua Tradicional.'),
(9, 'Agua Brisa Pet 280 CC', 1254.16, 1600, 16, 'CC', 12, 1254, 4, 24, 'Agua Tradicional.'),
(8, 'Jugo Del Valle Pet 500 CC x 12', 15000, 18000, 16, 'CC', 5, 15000, 1, 2, 'Jugos Del Valle Surtidos.'),
(8, 'Jugo Del Valle Pet 500 CC', 1250, 1550, 16, 'CC', 7, 1250, 10, 20, 'Jugos Del Valle Surtidos x unidad.'),
(11, 'Chiclets Adams Original 280 g x 100', 7550, 8500, 16, 'g', 5, 7400, 2, 4, 'Chiclets Adams Original 280 g x 100.'),
(11, 'Chiclets Adams Original 280 g', 75.5, 200, 16, 'g', 25, 75, 50, 120, 'Chiclets Adams Original 280 g.'),
(13, 'De Todito 70 g', 1450, 1800, 16, 'g', 42, 1450, 20, 40, 'De Todito surtidos de 70 gramos.'),
(10, 'Club Social 26 g x 9', 3600, 4000, 16, 'g', 7, 3600, 1, 2, 'Club social 26 gramos x 9 surtidas.'),
(10, 'Club Social 26 g', 400, 600, 16, 'g', 6, 400, 9, 18, 'Club social 26 gramos surtidas.'),
(7, 'Kola Roman Pet 500 CC x 12', 15900, 17500, 16, 'CC', 4, 15900, 1, 2, 'Kola Roman Pet 500 CC x 12'),
(7, 'Kola Roman Pet 500 CC', 1325, 1600, 16, 'CC', 8, 1325, 12, 24, 'Kola Roman Pet 500 CC');


#--......... PRODUCTOS POR BODEGAS ........

CREATE TABLE ProductoBodegas (
  BodegaID INTEGER UNSIGNED NOT NULL,
  ProductoID INTEGER UNSIGNED NOT NULL,
  Cantidad INT,
  UnidadMedida VARCHAR(5),
  FechaUltimoIngreso DATETIME,
  CONSTRAINT PK_ProductoBodegas PRIMARY KEY (BodegaID, ProductoID),
  CONSTRAINT FK_ProductoBodegas_Bodegas FOREIGN KEY (BodegaID) REFERENCES Bodegas (BodegaID),
  CONSTRAINT FK_ProductoBodegas_Productos FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID)
);

INSERT INTO ProductoBodegas (BodegaID, ProductoID, Cantidad, UnidadMedida, FechaUltimoIngreso) VALUES
  (4, 1, 10, 'CC', '2016-10-21'),
  (4, 2, 10, 'CC', '2016-10-21'),
  (5, 3, 3, 'CC', '2016-11-15'),
  (5, 4, 15, 'CC', '2016-11-15'),
  (4, 5, 3, 'CC', '2016-10-10'),
  (4, 6, 12, 'CC', '2016-10-10'),
  (4, 7, 5, 'CC', '2016-10-21'),
  (4, 8, 7, 'CC', '2016-10-21'),
  (4, 9, 5, 'g', '2016-11-3'),
  (4, 10, 75, 'g', '2016-11-3'),
  (4, 11, 42, 'g', '2016-11-3'),
  (4, 12, 7, 'g', '2016-11-3'),
  (4, 13, 6, 'g', '2016-11-3'),
  (4, 14, 4, 'CC', '2016-10-21'),
  (4, 15, 8, 'CC', '2016-10-21');


#--......... INVENTARIO APERTURA Y CIERRE ........

CREATE TABLE InventarioAC (
  ReferenciaInv INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  FechaApertura DATE,
  MesInv ENUM('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
              'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'),
  FechaCierre DATE,
  Estado ENUM('Activo', 'Inactivo'),
  NroDiaInv INT
);

INSERT INTO InventarioAC (FechaApertura, MesInv, FechaCierre, Estado, NroDiaInv) VALUES
  ('2016-10-01', 'Octubre', '2016-10-31', 'Inactivo', 31),
  ('2016-10-01', 'Noviembre', '2016-10-31', 'Activo', 30);


#--......... CONTROL DE INVENTARIO ........

  CREATE TABLE ControlInventario (
    ReferenciaInv INTEGER UNSIGNED,
    ProductoID INTEGER UNSIGNED,
    InvInicial BIGINT,
    EntradaProducto BIGINT,
    SalidadProducto BIGINT,
    InvFinal BIGINT,
    IngresoVentas DECIMAL(10,2),
    CostoInv DECIMAL(10,2),
    CONSTRAINT PK_ControlInventario PRIMARY KEY (ReferenciaInv, ProductoID),
    CONSTRAINT FK_ControlInventario_InventarioAC FOREIGN KEY (ReferenciaInv) REFERENCES InventarioAC (ReferenciaInv),
    CONSTRAINT FK_ControlInventario_Productos FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID)
  );

  INSERT INTO ControlInventario (ReferenciaInv, ProductoID, InvInicial, EntradaProducto, SalidadProducto, InvFinal, IngresoVentas, CostoInv) VALUES
    (1, 1, 5, 5, 5, 5, 8500, 51500),
    (1, 2, 10, 20, 20, 10, 6833.4, 8583.3),
    (1, 3, 1, 2, 1, 2, 4000, 96000),
    (1, 4, 10, 5, 10, 5, 5000, 10000),
    (1, 5, 2, 1, 1, 2, 2900, 60200),
    (1, 6, 5, 7, 6, 6, 2075.04, 7524.96),
    (1, 7, 2, 4, 3, 3, 9000, 45000),
    (1, 8, 2, 3, 4, 1, 1200, 1250),
    (1, 9, 3, 2, 1, 4, 950, 30200),
    (1, 10, 10, 15, 24, 1, 2988, 75.50),
    (1, 11, 21, 21, 30, 12, 10500, 17400),
    (1, 12, 4, 3, 3, 4, 1200, 14400),
    (1, 13, 4, 2, 5, 1, 1000, 400),
    (1, 14, 2, 2, 3, 1, 4800, 15900),
    (1, 15, 5, 3, 8, 0, 2200, 0),
    (2, 1, 5, 0, 0, 5, 0, 51500),
    (2, 2, 10, 0, 0, 10, 0, 8583.3),
    (2, 3, 2, 0, 0, 2, 0, 96000),
    (2, 4, 5, 0, 0, 5, 0, 10000),
    (2, 5, 2, 0, 0, 2, 0, 60200),
    (2, 6, 6, 0, 0, 6, 0, 7524.96),
    (2, 7, 3, 0, 0, 3, 0, 45000),
    (2, 8, 1, 0, 0, 1, 0, 1250),
    (2, 9, 4, 0, 0, 4, 0, 30200),
    (2, 10, 1, 0, 0, 1, 0, 75.50),
    (2, 11, 12, 0, 0, 12, 0, 17400),
    (2, 12, 4, 0, 0, 4, 0, 14400),
    (2, 13, 1, 0, 0, 1, 0, 400),
    (2, 14, 1, 0, 0, 1, 0, 15900),
    (2, 15, 0, 0, 0, 0, 0, 0);


#--......... BALANCE DE INVENTARIO ........

    CREATE TABLE BalanceInventario (
      NroItem INTEGER UNSIGNED AUTO_INCREMENT,
      ReferenciaInv INTEGER UNSIGNED,
      ValorInv DECIMAL(10,2),
      Caja DECIMAL(10,2),
      CuetaCobrar DECIMAL(10,2),
      OtroActivo DECIMAL(10,2),
      CuentaPagar DECIMAL(10,2),
      OtroPasivo DECIMAL(10,2),
      Capital DECIMAL(10,2),
      Utilidad DECIMAL(10,2),
      CONSTRAINT PK_BalanceInventario PRIMARY KEY (NroItem, ReferenciaInv),
      CONSTRAINT FK_BalanceInventario_InventarioAC FOREIGN KEY (ReferenciaInv) REFERENCES InventarioAC (ReferenciaInv)
    );

    INSERT INTO BalanceInventario (ReferenciaInv, ValorInv, Caja, CuetaCobrar, OtroActivo, CuentaPagar, OtroPasivo, Capital, Utilidad) VALUES
      (1, 358433.76, 256000, 104000, 0, 90000, 0, 400000, 228433.76),
      (2, 358433.76, 0, 104000, 0, 0, 0, 400000, 62433.76);


#--......... ELIMINAR TABLAS ........

DROP TABLE FamiliaProductos;
DROP TABLE CategoriaProductos;
DROP TABLE Productos;
DROP TABLE ProductoBodegas;
DROP TABLE ControlInventario;
DROP TABLE BalanceInventario;
DROP TABLE InventarioAC;


#--.......... CONSULTAS DE TABLAS ..........

SELECT *
FROM FamiliaProductos;

SELECT *
FROM CategoriaProductos;

SELECT *
FROM Productos;

SELECT *
FROM ProductoBodegas;

SELECT *
FROM InventarioAC;

SELECT *
FROM ControlInventario;

SELECT *
FROM BalanceInventario;


#--.......... DESCRIPCIÓN DE TABLAS ..........

DESC FamiliaProductos;
DESC CategoriaProductos;
DESC Productos;
DESC ProductoBodegas;
DESC InventarioAC;
DESC ControlInventario;
DESC BalanceInventario;


#--......... REINICIAR ESTRUCTURA Y DATOS DE TABLAS ........

TRUNCATE FamiliaProductos;
TRUNCATE CategoriaProductos;
TRUNCATE Productos;
TRUNCATE ProductoBodegas;
TRUNCATE InventarioAC;
TRUNCATE ControlInventario;
TRUNCATE BalanceInventario;


--.......... CONSULTAS DE RESTRICCIONES ..........

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'FamiliaProductos';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'CategoriaProductos';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Productos';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'ProductoBodegas';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'InventarioAC';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'ControlInventario';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'BalanceInventario';


#--.......... CONSULTA DE DATOS ..........

#-- Query 1. Visualiza el costo total del inventario relevante a la referencaia número 1.
SELECT ReferenciaInv AS Referencia_Inventario, SUM(CostoInv) AS Costo_Inventario
FROM ControlInventario
WHERE ReferenciaInv = 1;

#-- Query 2. Visualiza el producto con valor máximo de ingreso por ventas y ademas muestra la suma  y promedio relevante a la referencia número 1.
SELECT p.Descripcion,
  SUM(ci.IngresoVentas),
  MAX(IngresoVentas),
  AVG(IngresoVentas)
FROM ControlInventario AS ci
LEFT JOIN Productos p
  ON ci.ProductoID = p.ProductoID
WHERE ReferenciaInv = 1;

#-- Query 3. Visualiza el producto con valor máximo de ingreso por ventas y ademas muestra la suma  y promedio por referencia de inventario.
  SELECT ReferenciaInv AS Referencia_Inventario,
    p.Descripcion,
    SUM(ci.IngresoVentas),
    MAX(IngresoVentas),
    AVG(IngresoVentas)
  FROM ControlInventario AS ci
  LEFT JOIN Productos p
    ON ci.ProductoID = p.ProductoID
  GROUP BY ReferenciaInv;
