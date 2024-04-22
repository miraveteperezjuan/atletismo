create database if not exists ATLETISMO;
use ATLETISMO;

CREATE TABLE `ATLETAS` (
`ID` char(6) NOT NULL,
`NOMBRE` varchar(15) NOT NULL,
`APELLIDO` varchar (15) NOT NULL,
`COMUNIDAD` varchar (15) NOT NULL,
`CATEGORIA` varchar (15) NOT NULL,
`PRUEBA` varchar (15) NOT NULL,
`FECHA DE NACIMIENTO` date DEFAULT NULL
);

INSERT INTO `ATLETAS` (`ID`, `NOMBRE`, `APELLIDO`, `COMUNIDAD`, `CATEGORIA`, `PRUEBA`, `FECHA DE NACIMIENTO`) VALUES
('AR3241', 'Ana', 'Carrasco', 'ARAGÓN', 'Sub-23', 'Pértiga', '2002-09-17'),
('N3214', 'Aitana', 'López', 'NAVARRA', 'Sub-20', '400 metros', '2005-07-27'),
('GC3287', 'Quevedo', 'Inglés', 'CANARIAS', 'Absoluto', '100 metros', '1999-02-02'),
('M4784', 'Daniel', 'Martin', 'MADRID', 'Absoluto', '100 metros vallas', '2001-08-10'),
('AR3247', 'Ali', 'Al-Mehi', 'Aragón', 'Absoluto', '800 metros', '1997-10-14'),
('S6987', 'Ana', 'Carrasco', 'CYL', 'Sub-18', 'Altura', null);

CREATE TABLE `FEDERACIONES` (
`ID` int (10) NOT NULL,
`COMUNIDAD` varchar (15) NOT NULL,
`FEDERADOS` int (10) NOT NULL,
`PRESUPUESTO` int (10) DEFAULT NULL
);

INSERT INTO `FEDERACIONES` (`ID`, `COMUNIDAD`, `FEDERADOS`, `PRESUPUESTO`) VALUES
('1', 'ARAGÓN', '5000', '100000'),
('2', 'NAVARRA', '1500', '50000'),
('3', 'CANARIAS', '7000', '90000'),
('4', 'CYL', '9000', '120000'),
('5', 'MADRID', '15000', '150000');

CREATE TABLE `PISTAS` (
`ID` int (10) NOT NULL,
`CIUDAD` varchar (15) NOT NULL,
`NOMBRE` varchar (15) NOT NULL,
`CAPACIDAD` int (10) DEFAULT NULL,
`ULTIMA REFORMA` date DEFAULT NULL
);

INSERT INTO `PISTAS` (`ID`, `CIUDAD`, `NOMBRE`, `CAPACIDAD`, `ULTIMA REFORMA`) VALUES
(1, 'Madrid', 'Vallermoso', 9000, '2023-05-15'),
(2, 'Zaragoza', 'Corona de Aragón', 1200, null),
(3, 'Gran Canaria', 'Oceanix', 800, '2019-08-12'),
(4, 'Pamplona', 'Larrabide', 1500, '2022-01-30'),
(5, 'Soria', 'Celtiveria', 900, null),
(6, 'Málaga', 'Caja Mar', 1100, '2023-03-10');

-- Añadir clave primaria a la tabla ATLETAS
ALTER TABLE `ATLETAS` 
ADD PRIMARY KEY (`ID`);

-- Añadir clave primaria a la tabla FEDERACIONES
ALTER TABLE `FEDERACIONES` 
ADD PRIMARY KEY (`ID`);

-- Añadir clave primaria a la tabla PISTAS
ALTER TABLE `PISTAS` 
ADD PRIMARY KEY (`ID`);

-- Añadir clave foránea a la tabla ATLETAS referenciando la tabla FEDERACIONES
ALTER TABLE `ATLETAS`
ADD CONSTRAINT `fk_atletas_federaciones`
FOREIGN KEY (`COMUNIDAD`)
REFERENCES `FEDERACIONES` (`COMUNIDAD`);