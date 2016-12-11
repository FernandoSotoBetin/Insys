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


  --......... ELIMINAR TABLAS ........

  DROP TABLE Empleados;

  #--.......... CONSULTAS DE TABLAS ..........

  SELECT *
  FROM Empleados;


  #--.......... DESCRIPCIÓN DE TABLAS ..........

  DESC Empleados;


  #--.......... CONSULTAS DE RESTRICCIONES ..........

  SELECT *
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_NAME = 'Empleados';


  #--.......... CONSULTA DE DATOS ..........

  #-- Query 1. Visualiza cada ciudad de la tabla de forma única.
  SELECT DISTINCT Ciudad
  FROM Empleados;

  #-- Query 2. Visualiza cada ciudad de la tabla de forma única con el nombre 'Lista De Cuidades'.
  SELECT DISTINCT Ciudad 'Lista De Cuidades'
  FROM Empleados;

  #-- Query 3. Visualiza los empleados que son de Barranquilla.
  SELECT Nombre,
    Apellido,
    Cargo
  FROM Empleados
  WHERE Ciudad='Barranquilla';

  #-- Query 4. Visualiza los empleados nacidos entre enero 1 de 1980 y enero 1 de 1987.
  SELECT Nombre,
    Apellido,
    Cargo
  FROM Empleados
  WHERE FechaNacimiento BETWEEN '1980-01-01' AND '1987-01-01';

  #-- Query 5. Visualiza los empleados con cargos de Gerente General y Administrador De Sistemas.
  SELECT Nombre,
    Apellido,
    Cargo,
    Ciudad
  FROM Empleados
  WHERE Cargo IN ('Gerente General', 'Administrador De Sistemas');
