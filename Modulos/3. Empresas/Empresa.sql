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


#--......... ELIMINAR TABLAS ........

DROP TABLE Bodegas;
DROP TABLE Sucursales;
DROP TABLE Empresas;
DROP TABLE TipoSociedades;


#--.......... CONSULTAS DE TABLAS ..........

SELECT *
FROM Empresas;

SELECT *
FROM Sucursales;

SELECT *
FROM Bodegas;

SELECT *
FROM TipoSociedades;


#--.......... DESCRIPCIÓN DE TABLAS ..........

DESC TipoSociedades;
DESC Empresas;
DESC Sucursales;
DESC Bodegas;


#--.......... CONSULTAS DE RESTRICCIONES ..........

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Empresas';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Sucursales';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Bodegas';


#--.......... CONSULTA DE DATOS ..........

#-- Query 1. Seleccionar todos los datos donde el tipo de sociedad sea S.A.S.
SELECT *
FROM Empresas
WHERE TipoSociedad = 'S.A.S.';

#-- Query 2. Seleccionar la suma de los metros cuadrados de las bodegas de las Empresas.
SELECT e.Nombre,
  SUM(b.Area),
  b.UnidadMedidaArea
FROM Empresas AS e
LEFT JOIN Sucursales s
  ON e.EmpresaID = s.EmpresaID
  LEFT JOIN Bodegas b
    ON s.SucursalID = b.SucursalID
GROUP BY e.nombre;
