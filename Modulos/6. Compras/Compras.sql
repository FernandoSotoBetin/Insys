#--__________ CLIENTES _________

CREATE TABLE Proveedores (
  ProveedorID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  RazonSocial VARCHAR(120),
  NombreRL VARCHAR(120) NOT NULL,
  ApellidoRL VARCHAR(120) NOT NULL,
  SexoRL ENUM('M', 'F') NOT NULL,
  FechaNacimiento DATE,
  TelefonoFijo BIGINT,
  TelefonoMovil BIGINT,
  Direccion VARCHAR(60),
  Ciudad VARCHAR(45),
  Email VARCHAR(60),
  PaginaWeb VARCHAR(60)
);

INSERT INTO Proveedores (RazonSocial, NombreRL, ApellidoRL, SexoRL, FechaNacimiento, TelefonoFijo, TelefonoMovil, Direccion, Ciudad, Email, PaginaWeb) VALUES
  ('Bavaria S.A.', 'Carlos', 'Prieto', 'M', '1982-02-13', 3592254, 3171456547, 'Cll 30 # 30-28', 'Barranquilla', 'infoventas@bavaria.co', 'www.bavaria.co'),
  ('Coca-Cola Femsa', 'Fabian', 'Castro', 'M', '1984-10-26', 3789658, 3014569862, 'Cll 30 # 21-47', 'Barranquilla', 'soluciones@femsa.com.co', 'www.femsa.com.co'),
  ('Quala S.A.', 'Sandra', 'Pereira', 'F', '1983-06-19', 3594589, 3110028540, 'Cll 110 # 10-97', 'Barranquilla', 'servicioq@quala.com.co', 'www.quala.com.co');


#--_________ FACTURA COMPRAS __________

CREATE TABLE FacturaCompras (
  NroFactura INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ProveedorID INTEGER UNSIGNED NOT NULL,
  FechaFactura DATETIME,
  Importe DECIMAL(10,2),
  BodegaID INTEGER UNSIGNED,
  MedioDePago VARCHAR(45)
);

INSERT INTO FacturaCompras (ProveedorID, FechaFactura, Importe, BodegaID, MedioDePago) VALUES
  (2, '2016-10-10', 49600, 4, 'Efectivo'),
  (2, '2016-10-21', 112200, 4, 'Efectivo'),
  (3, '2016-11-3', 51600, 4, 'Efectivo'),
  (1, '2016-11-15', 90000, 5, 'Credito');


#--_________ FACTURA COMPRA DETALLES __________

CREATE TABLE FacturaCompraDetalles (
  NroItem INTEGER UNSIGNED NOT NULL,
  NroFactura INTEGER UNSIGNED NOT NULL,
  ProductoID INTEGER UNSIGNED NOT NULL,
  Cantidad INT,
  CostoUnitario DECIMAL(10,2),
  SubTotal DECIMAL(10,2),
  IVA INT DEFAULT 16,
  Descuento DECIMAL(10,2),
  CostoTotal DECIMAL(10,2),
  CONSTRAINT PK_FacturaCompraDetalles PRIMARY KEY (NroItem, NroFactura),
  CONSTRAINT FK_FacturaCompraDetalles_FacturaCompras FOREIGN KEY (NroFactura) REFERENCES FacturaCompras (NroFactura),
  CONSTRAINT FK_FacturaCompraDetalles_Productos FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID)
);

INSERT INTO FacturaCompraDetalles (NroItem, NroFactura, ProductoID, Cantidad, CostoUnitario, SubTotal, IVA, Descuento, CostoTotal) VALUES
  (1, 1, 1, 2, 10300, 20600, 16, 0, 20600),
  (2, 1, 5, 1, 30100, 30100, 16, 1100, 29000),
  (1, 2, 7, 2, 15000, 30000, 16, 1500, 28500),
  (2, 2, 14, 3, 15900, 47700, 16, 0, 47700),
  (3, 2, 1, 4, 10300, 41200, 16, 5200, 36000),
  (1, 3, 9, 3, 7550, 22650, 16, 0, 22650),
  (2, 3, 12, 2, 3600, 7200, 16, 0, 7200),
  (3, 3, 11, 15, 1450, 21750, 16, 0, 21750),
  (1, 4, 3, 2, 48000, 96000, 16, 6000, 90000);


  #--......... ELIMINAR TABLAS ........

  DROP TABLE FacturaCompraDetalles;
  DROP TABLE FacturaCompras;
  DROP TABLE Proveedores;


  #--.......... DESCRIPCIÓN DE TABLAS ..........

  DESC Proveedores;
  DESC FacturaCompras;
  DESC FacturaCompraDetalles;


  #--.......... CONSULTAS DE RESTRICCIONES ..........

  SELECT *
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_NAME = 'Proveedores';

  SELECT *
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_NAME = 'FacturaCompras';

  SELECT *
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_NAME = 'FacturaCompraDetalles';


  #--.......... CONSULTA DE DATOS ..........

  #-- Query 1. Visualiza los representantes legales de los Proveedores del sexo femenino.
  SELECT *
  FROM Proveedores
  WHERE SexoRL = 'F';

  #-- Query 2. Visualiza la suma total de compras por Proveedores.
  SELECT RazonSocial,
    SUM(fc.Importe) As Total
  FROM Proveedores AS p
  LEFT JOIN FacturaCompras fc
    ON p.ProveedorID=fc.ProveedorID
  GROUP BY RazonSocial;

  #-- Query 3. Visualiza el total de cantidades de productos comprados y si no se ha comprado de muestra 0.
  SELECT p.Descripcion, p.ProductoID,
  IF(SUM(Cantidad)>0, SUM(Cantidad), 0) As Cantidad
  FROM Productos p
  LEFT JOIN FacturaCompraDetalles f
    ON p.ProductoID=f.ProductoID
  GROUP BY p.ProductoID
  ORDER BY p.Descripcion;
