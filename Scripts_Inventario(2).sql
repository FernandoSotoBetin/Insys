#--<____________________ PARÁMETROS ____________________>

#--__________ TIPO MEDIDAS _________

CREATE TABLE TipoMedidas (
  TipoMedidaID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL
);

INSERT INTO TipoMedidas (Nombre) VALUES
('Longitud'),
('Masa'),
('Tiempo'),
('Temperatura'),
('Corriente Eléctrica'),
('Volumen'),
('Capacidad');


#--__________ UNIDAD MEDIDAS _________

CREATE TABLE UnidadMedidas (
  UnidadMedidaID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  NombreAbreviado VARCHAR(5) NOT NULL,
  TipoMedida VARCHAR(45)
);

INSERT INTO UnidadMedidas (Nombre, NombreAbreviado, TipoMedida) VALUES
('Kilómetro', 'km', 'Longitud'),
('Metro', 'm', 'Longitud'),
('Centímetro', 'cm', 'Longitud'),
('Kilogramo', 'kg', 'Masa'),
('Gramo', 'g', 'Masa'),
('Centímetro Cúbico', 'CC', 'Volumen'),
('Mililitro', 'mL', 'Capacidad');


#--__________ CARGOS PERSONAL _________

CREATE TABLE CargosPersonal (
  CargoID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL
);

INSERT INTO CargosPersonal (Nombre) VALUES
('Gerente General'),
('Gerente Administrativo'),
('Gerente De Mercadeo'),
('Jefe De Ventas'),
('Administrador De Sistemas');


#--__________ MEDIOS DE PAGOS _________

CREATE TABLE MedioDePagos (
  MedioDePagoID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL
);

INSERT INTO MedioDePagos (Nombre) VALUES
('Efectivo'),
('T. Debito'),
('T. Credito'),
('Credito'),
('Cheque'),
('Pagare'),
('Letra De Cambio'),
('Transferencia');

#--<____________________ LOCALIDADES ____________________>

#--__________ CONTINENTES __________

CREATE TABLE Continentes (
  ContinenteID INTEGER UNSIGNED AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL,
  NroPais INT,
  CONSTRAINT PK_Continentes PRIMARY KEY (ContinenteID)
);

INSERT INTO Continentes (Nombre, NroPais) VALUES
  ('África', 54),
  ('América', 35),
  ('Asia', 48),
  ('Europa', 50),
  ('Oceanía', 15);

#--__________ PAISES __________

CREATE TABLE Paises (
  PaisID INTEGER UNSIGNED AUTO_INCREMENT,
  ContinenteID INTEGER UNSIGNED NOT NULL,
  Nombre VARCHAR(60) NOT NULL,
  CONSTRAINT PK_Paises PRIMARY KEY (PaisID),
  CONSTRAINT FK_Paises_Continentes FOREIGN KEY (ContinenteID) REFERENCES Continentes (ContinenteID)
);

ALTER TABLE Paises ADD NroDepartamento INT;

INSERT INTO Paises (ContinenteID, Nombre) VALUES
  (2, 'Argentina'),
  (2, 'Brasil'),
  (2, 'Chile'),
  (2, 'Colombia'),
  (1, 'Camerún'),
  (1, 'Nigeria'),
  (3, 'Rusia'),
  (3, 'Japón'),
  (4, 'España'),
  (4, 'Italia');

#--__________ DEPARTAMENTOS __________

CREATE TABLE Departamentos (
  DepartamentoID INTEGER UNSIGNED AUTO_INCREMENT,
  PaisID INTEGER UNSIGNED NOT NULL,
  Nombre VARCHAR(60) NOT NULL,
  CONSTRAINT PK_Departamentos PRIMARY KEY (DepartamentoID),
  CONSTRAINT FK_Departementos_Paises FOREIGN KEY (PaisID) REFERENCES Paises (PaisID)
);

INSERT INTO Departamentos (PaisID, Nombre) VALUES
  (4, 'Atlántico'),
  (4, 'Cundinamarca'),
  (4, 'Bolívar'),
  (1, 'Cuyo'),
  (2, 'Ceará');

#--__________ CIUDADES __________

CREATE TABLE Ciudades (
  CiudadId INTEGER UNSIGNED AUTO_INCREMENT,
  DepartamentoID INTEGER UNSIGNED NOT NULL,
  Nombre VARCHAR(60) NOT NULL,
  CONSTRAINT PK_Ciudades PRIMARY KEY (CiudadId),
  CONSTRAINT FK_Ciudades_Departamentos FOREIGN KEY (DepartamentoID) REFERENCES Departamentos (DepartamentoID)
);

INSERT INTO Ciudades (DepartamentoID, Nombre) VALUES
  (1, 'Barranquilla'),
  (2, 'Bogotá'),
  (4, 'Mendoza'),
  (4, 'San Juan'),
  (5, 'Fortaleza');

#--<____________________ EMPRESAS ____________________>

#--__________ EMPRESAS _________

CREATE TABLE Empresas (
  EmpresaID INTEGER UNSIGNED AUTO_INCREMENT,
  Nombre VARCHAR(60),
  NIT VARCHAR(60) NOT NULL,
  TipoSociedad VARCHAR(45) NOT NULL,
  NombreRL VARCHAR(100) NOT NULL,
  Email VARCHAR(60),
  PaginaWeb VARCHAR(60),
  CONSTRAINT PK_Empresa PRIMARY KEY (EmpresaID)
);

INSERT INTO Empresas (Nombre, NIT, TipoSociedad, NombreRL, Email, PaginaWeb) VALUES
('Solidsys', '80204070-1', 'S.A.S.', 'Fernando Soto', 'solidsys@dev.com.co', 'solidsys.com.co'),
('MovilApp', '81214272-2', 'LTDA', 'Marlenys Acevedo', 'infomovil@dev.com.co', 'movilapp.com.co'),
('Merkando', '72805741-5', 'S.A', 'Daniela De La Hoz', 'Merkando@dev.com.co', 'www.merkando.com');


#--__________ SUCURSALES _________

CREATE TABLE Sucursales (
  SucursalID INTEGER UNSIGNED AUTO_INCREMENT,
  EmpresaID INTEGER UNSIGNED NOT NULL,
  Nombre VARCHAR(60) NOT NULL,
  Domicilio VARCHAR(60),
  Ciudad VARCHAR(45),
  TelefonoFijo BIGINT,
  ExtensionFijo INT,
  TelefonoMovil BIGINT,
  Nota VARCHAR(120),
  CONSTRAINT PK_Sucursales PRIMARY KEY (SucursalID),
  CONSTRAINT FK_Sucursales_Empresas FOREIGN KEY (EmpresaID) REFERENCES Empresas (EmpresaID)
);

INSERT INTO Sucursales (EmpresaID, Nombre, Domicilio, Ciudad, TelefonoFijo, ExtensionFijo, TelefonoMovil, Nota) VALUES
(1,'SolidSys Principal', 'Calle 72 # 38-20', 'Barranquilla', 3170000, 0, 3010011001, "Tenología a Tu Alcance"),
(2,'MovilApp S.A. Principal', 'Calle 20 # 30-80', 'Bogotá', 3802040, 0, 3204202030, "Aplicaciones Moviles"),
(3,'Merkando S.A. Principal', 'Calle 110 # 38-109', 'Barranquilla', 3179635, 0, 3010202120, "Merkando ando.."),
(3,'Merkando S.A. Centro', 'Cra 43 # 34-18', 'Barranquilla', 3179438, 0, 3010085214, "Merkando ando.. centro");


#--__________ BODEGAS _________

CREATE TABLE Bodegas (
  BodegaID INTEGER UNSIGNED AUTO_INCREMENT,
  SucursalID INTEGER UNSIGNED NOT NULL,
  Nombre VARCHAR(60) NOT NULL,
  Area INT,
  UnidadMedidaArea VARCHAR(5),
  CONSTRAINT PK_Bodegas PRIMARY KEY (BodegaID)
);

INSERT INTO Bodegas (SucursalID, Nombre, Area, UnidadMedidaArea) VALUES
(1, 'Bodega Principal', 25, 'm2'),
(1, 'Bodega Técnica', 10, 'm2'),
(2, 'Bodega Principal P1', 50, 'm2'),
(3, 'Storage 01', 70, 'm2'),
(3, 'Storage 02', 42, 'm2');


#--__________ TIPO DE SOCIEDADES _________

CREATE TABLE TipoSociedades (
  TipoSociedadID INTEGER UNSIGNED AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL,
  Abreviatura VARCHAR(45) NOT NULL,
  CONSTRAINT PK_TipoSociedades PRIMARY KEY (TipoSociedadID)
);

INSERT INTO TipoSociedades (Nombre, Abreviatura) VALUES
('Sociedades Anónimas', 'S.A.'),
('Sociedades Por Acciones Simplificadas', 'S.A.S.'),
('Sociedad De Responsabilidad Limitada', 'LTDA');


#--<____________________ RECURSOS HUMANOS ____________________>

#--__________ EMPLEADOS _________

CREATE TABLE Empleados (
  EmpleadoID INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(120) NOT NULL,
  Apellido VARCHAR(120),
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

INSERT INTO Empleados (Nombre, Apellido, Cargo, FechaNacimiento, Sexo, TelefonoFijo, TelefonoMovil, Direccion, Ciudad, Email, PaginaWeb) VALUES
  ('Jhon', 'Soto', 'Gerente General', '1978-01-11', 'M', 3780000, 3010102021, 'Calle 110 # 40-30', 'Barranquilla', 'jhon.soto@dev.com', ''),
  ('Angel', 'Moya', 'Jefe De Ventas', '1980-10-11', 'M', 3480000, 3010002021, 'Calle 84 # 20-32', 'Barranquilla', 'angel.moya@dev.com', ''),
  ('Laura', 'Acuña', 'Gerente Administrativo', '1984-06-15', 'F', 3760021, 3010102456, 'Calle 4 # 4-35', 'Bogotá', 'laura.acuña@dev.com', 'www.lauraacuña.com.co'),
  ('Ruben', 'Charris', 'Gerente De Mercadeo', '1976-03-09', 'M', 3840002, 3100155021, 'Cra 45 # 14-55', 'Barranquilla', 'ruben.charris@dev.com', ''),
  ('Jessica', 'Peña', 'Administrador De Sistemas', '1996-04-29', 'F', 3781001, 3010102021, 'Calle 80 # 30-14', 'Bogotá', 'jhon.soto@dev.com', 'www.jpsystem.com.co'),
  ('Pedro', 'Nieto', 'Administrador De Sistemas', '1989-08-25', 'M', 3761111, 3140185025, 'Cra 15 # 18-13', 'Bogotá', 'pedro.nieto2@dev.com', 'www.blog/pedronieto.com');


#--<____________________ INVENTARIO ____________________>

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

#--<____________________ COMPRAS ____________________>

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


#--<____________________ VENTAS ____________________>

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
