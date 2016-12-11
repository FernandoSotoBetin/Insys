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

--......... ELIMINAR TABLAS ........

DROP TABLE TipoMedidas;
DROP TABLE UnidadMedidas;
DROP TABLE CargosPersonal;
DROP TABLE MedioDePagos;


#--.......... CONSULTAS DE TABLAS ..........

SELECT *
FROM TipoMedidas;

SELECT *
FROM UnidadMedidas;

SELECT *
FROM CargosPersonal;

SELECT *
FROM MedioDePagos;


#--.......... DESCRIPCIÓN DE TABLAS ..........

DESC TipoMedidas;
DESC UnidadMedidas;
DESC CargosPersonal;
DESC MedioDePagos;


#--.......... CONSULTAS DE RESTRICCIONES ..........

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'TipoMedidas';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'UnidadMedidas';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'CargosPersonal';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'MedioDePagos';


#--.......... CONSULTA DE DATOS ..........

#-- Query 1. Seleccionar todos los datos donde el nombre abreviado sea kg.
SELECT *
FROM UnidadMedidas
WHERE NombreAbreviatura = 'kg';

#-- Query 1. Asignar valores boolenos Verdadero (v)  Falso (F) dependiendo la condición cm.
SELECT Nombre,
  TipoMedida,
  IF(NombreAbreviado = 'cm', 'V', 'F') AS Token
FROM UnidadMedidas;
