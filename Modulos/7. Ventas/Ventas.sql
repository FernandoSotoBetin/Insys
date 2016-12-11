#--__________ CLIENTES _________

CREATE TABLE Clientes (
  ClienteID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  TipoCliente ENUM('Personal', 'Empresa') NOT NULL,
  RazonSocial VARCHAR(120),
  Nombre VARCHAR(120) NOT NULL,
  Apellido VARCHAR(120) NOT NULL,
  Cargo VARCHAR(60),
  FechaNacimiento DATE,
  Sexo ENUM('M', 'F') NOT NULL,
  TelefonoFijo BIGINT,
  TelefonoMovil BIGINT,
  Direccion VARCHAR(60),
  Ciudad VARCHAR(45),
  Email VARCHAR(60),
  PaginaWeb VARCHAR(60)
);

INSERT INTO Clientes (TipoCliente, RazonSocial, Nombre, Apellido, Cargo, FechaNacimiento, Sexo, TelefonoFijo, TelefonoMovil, Direccion, Ciudad, Email, PaginaWeb) VALUES
  ('Empresa', 'Proquimicos', 'Miguel', 'Barraza', 'Jefe De Ventas', '1980-01-15', 'M', 3682545, 3115698743, 'Cll 110 # 37-94', 'Barranquilla', 'miguel2815@dmail.com', ''),
  ('Personal', 'Carlos Pomares', 'Carlos', 'Pomares', '---o---', '1990-06-13', 'M', 3745896, 3015688745, 'Cll 84B # 42-65', 'Barranquilla', 'carlitoselnene@dmail.com', ''),
  ('Personal', 'Claudia Tovar', 'Claudia', 'Tovar', '---o---', '1992-04-19', 'F', 3348965, 3025863462, 'Cll 100 # 27-12', 'Barranquilla', 'lalinda100@dmail.com', ''),
  ('Empresa', 'Juanita Stylos', 'Juanita', 'Merlano', 'Gerente General', '1986-11-23', 'F', 3345633, 3150236540, 'Cra 34 # 116-18', 'Barranquilla', 'juanitastylos@dmail.com', ''),
  ('Personal', 'Didier Carrasco', 'Didier', 'Carrasco', '---o---', '1991-09-08', 'M', 3740309, 3123365545, 'Cra 38 # 104-37', 'Barranquilla', 'didiercarrasco@dmail.com', 'blog/didiercarrasco.com.tk');


  #--_________ FACTURA VENTAS __________

  CREATE TABLE FacturaVentas (
    NroFactura INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ClienteID INTEGER UNSIGNED NOT NULL,
    FechaFactura DATETIME,
    Importe DECIMAL(10,2),
    BodegaID INTEGER UNSIGNED,
    MedioDePago VARCHAR(45)
  );

  INSERT INTO FacturaVentas (ClienteID, FechaFactura, Importe, BodegaID, MedioDePago) VALUES
    (1, '2016-11-01', 12000, 4, 'Efectivo'),
    (2, '2016-10-30', 74000, 4, 'Efectivo'),
    (3, '2016-11-06', 104000, 5, 'Credito'),
    (4, '2016-11-16', 7200, 4, 'Efectivo');


    #--_________ FACTURA COMPRA DETALLES __________

    CREATE TABLE FacturaVentaDetalles (
      NroItem INTEGER UNSIGNED NOT NULL,
      NroFactura INTEGER UNSIGNED NOT NULL,
      ProductoID INTEGER UNSIGNED NOT NULL,
      Cantidad INT,
      CostoUnitario DECIMAL(10,2),
      SubTotal DECIMAL(10,2),
      IVA INT DEFAULT 16,
      Descuento DECIMAL(10,2),
      CostoTotal DECIMAL(10,2),
      CONSTRAINT PK_FacturaventaDetalles PRIMARY KEY (NroItem, NroFactura),
      CONSTRAINT FK_FacturaVentaDetalles_FacturaVentas FOREIGN KEY (NroFactura) REFERENCES FacturaVentas (NroFactura),
      CONSTRAINT FK_FacturaVentaDetalles_Productos FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID)
    );

    INSERT INTO FacturaVentaDetalles (NroItem, NroFactura, ProductoID, Cantidad, CostoUnitario, SubTotal, IVA, Descuento, CostoTotal) VALUES
      (1, 1, 15, 5, 1600, 8000, 16, 0, 8000),
      (2, 1, 13, 5, 600, 3000, 16, 0, 3000),
      (3, 1, 10, 5, 200, 1000, 16, 0, 1000),
      (1, 2, 5, 1, 33000, 33000, 16, 0, 33000),
      (2, 2, 7, 1, 18000, 18000, 16, 1000, 17000),
      (3, 2, 1, 2, 12000, 24000, 16, 0, 24000),
      (1, 3, 3, 2, 52000, 104000, 16, 0, 104000),
      (1, 4, 2, 3, 1200, 3600, 16, 0, 3600),
      (2, 4, 11, 2, 1800, 3600, 16, 0, 3600);


      #--......... ELIMINAR TABLAS ........

      DROP TABLE FacturaVentaDetalles;
      DROP TABLE FacturaVentas;
      DROP TABLE Clientes;


      #--.......... DESCRIPCIÓN DE TABLAS ..........

      DESC Clientes;
      DESC FacturaVentas;
      DESC FacturaVentaDetalles;


      #--.......... CONSULTAS DE RESTRICCIONES ..........

      SELECT *
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
      WHERE TABLE_NAME = 'Clientes';

      SELECT *
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
      WHERE TABLE_NAME = 'FacturaVentas';

      SELECT *
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
      WHERE TABLE_NAME = 'FacturaVentaDetalles';


      #--.......... CONSULTA DE DATOS ..........

      #-- Query 1. Visualiza los clientes de tipo personal.
      SELECT *
      FROM Clientes
      WHERE TipoCliente = 'Personal';

      #-- Query 2. Visualiza la suma total de compras por Clientes.
      SELECT RazonSocial,
        SUM(fv.Importe) As Total
      FROM Clientes AS c
      LEFT JOIN FacturaVentas fv
        ON c.ClienteID=fv.ClienteID
      GROUP BY RazonSocial;

      #-- Query 3. Visualiza nombre, apellido y fecha de nacimiento de los clientes que su nombre inicien con la letra M.
      SELECT Nombre, Apellido, FechaNacimiento
      FROM Clientes
      WHERE Nombre LIKE 'C%';
