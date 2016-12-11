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
ALTER TABLE Paises MODIFY NroDepartamento FLOAT;
ALTER TABLE Paises DROP NroDepartamento;

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

#--......... ELIMINAR TABLAS ........

DROP TABLE Ciudades;
DROP TABLE Departamentos;
DROP TABLE Paises;
DROP TABLE Continentes;

#--.......... CONSULTAS DE TABLAS ..........

SELECT *
FROM Continentes;

SELECT *
FROM Paises;

SELECT *
FROM Departamentos;

SELECT *
FROM Ciudades;

#--.......... DESCRIPCIÓN DE TABLAS ..........

DESC Continentes;
DESC Paises;
DESC Departamentos;
DESC Ciudades;

#--.......... CONSULTAS DE RESTRICCIONES ..........

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Continentes';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Paises';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Departamentos';

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Ciudades';

#--.......... CONSULTA DE DATOS ..........

#-- Query 1. Selecciona los paises y departamentos.
SELECT p.Nombre,
  d.Nombre
FROM Paises AS p
INNER JOIN Departamentos AS d
  ON p.PaisID = d.PaisID;

#-- Query 2. Selecciona los paises y departamentos aun sin es NULL.
SELECT p.Nombre,
  d.Nombre
FROM Paises AS p
LEFT JOIN Departamentos AS d
  ON p.PaisID = d.PaisID;

#-- Query 3. Selecciona los continentes que tengan mas de 35 paises.
SELECT ContinenteID,
  Nombre,
  NroPais
FROM Continentes
WHERE NroPais > 35;

#-- Query 4. Si el número de pasies de los continenetes es mayor a 48, se le asigna 0.
SELECT ContinenteID,
  Nombre,
  IF(NroPais < 48, NroPais,0)
FROM Continentes;
