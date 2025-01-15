-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2023 at 02:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transito`
--

-- --------------------------------------------------------

--
-- Table structure for table `agente_de_transito`
--

CREATE TABLE `agente_de_transito` (
  `Id_Agente` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `No_domicilio` int(11) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Calle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agente_de_transito`
--

INSERT INTO `agente_de_transito` (`Id_Agente`, `Nombre`, `Apellidos`, `No_domicilio`, `Fecha_nacimiento`, `Calle`) VALUES
(1, 'Cesar', 'Augusto Peréz', 42, '2003-12-08', 'La bella rosa'),
(2, 'Hugo', 'Macondo Pino', 120, '2020-10-18', 'Viacruz street'),
(3, 'Hitler', 'Joel Suaréz', 246, '2012-03-08', '15 Sur'),
(4, 'Lincon', 'Díaz Evelio', 2, '1823-02-18', 'La bella rosa'),
(5, 'Simón', 'Gaviria Rodrígez', 2, '2023-11-12', '45 Oeste'),
(6, 'José', 'Miguel Fast', 11, '2023-11-18', 'Laver plaza');

-- --------------------------------------------------------

--
-- Table structure for table `casa_automotriz`
--

CREATE TABLE `casa_automotriz` (
  `Id_Casa_Automotriz` int(11) NOT NULL,
  `Direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casa_automotriz`
--

INSERT INTO `casa_automotriz` (`Id_Casa_Automotriz`, `Direccion`) VALUES
(1, 'Los hermanos Toyo'),
(2, 'La reparadora de la esquina'),
(3, 'Todo motos'),
(4, 'Motocruz'),
(5, 'RumRumCarros');

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE `ciudad` (
  `id_Ciudad` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Id_Departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` (`id_Ciudad`, `Nombre`, `Id_Departamento`) VALUES
(1, 'Pereira', 1),
(2, 'San Alfonzo', 2),
(3, 'Dosquebradas', 1),
(4, 'Virginia', 4),
(5, 'Aguazure', 3);

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `Id_Departamento` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`Id_Departamento`, `Nombre`) VALUES
(1, 'Risaralda'),
(2, 'Bolivar'),
(3, 'Magdalena'),
(4, 'Sucre'),
(5, 'Caldas');

-- --------------------------------------------------------

--
-- Table structure for table `lugar`
--

CREATE TABLE `lugar` (
  `Id_lugar` int(11) NOT NULL,
  `Kilometro` int(11) DEFAULT NULL,
  `Carretera` varchar(30) DEFAULT NULL,
  `Dirección` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lugar`
--

INSERT INTO `lugar` (`Id_lugar`, `Kilometro`, `Carretera`, `Dirección`) VALUES
(1, 45, 'Simón Bolivar', '12 Norte'),
(2, 505, 'Pollo', '7 Occidente'),
(3, 66, 'Rio viejo', '13 Sur'),
(4, 12, 'La verde', '25 Oeste'),
(5, 12, 'La vieja', '15 Norte');

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `Id_Marca` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`Id_Marca`, `Nombre`) VALUES
(1, 'Mazda'),
(2, 'Ferrari'),
(3, 'Yamaha'),
(4, 'BMW'),
(5, 'Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `Id_Modelo` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Potencia` varchar(30) NOT NULL,
  `Id_Marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`Id_Modelo`, `Nombre`, `Potencia`, `Id_Marca`) VALUES
(1, '23W', '1,36 CV ', 1),
(2, 'Aventador', '1,46 CV ', 1),
(3, 'Brum', '10,8 CV ', 2),
(4, 'Cobra', '2,31 CV ', 3),
(5, 'LaVerg', '1,06 CV ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `multa`
--

CREATE TABLE `multa` (
  `Id_Multa` int(11) NOT NULL,
  `Fecha_multa` date NOT NULL,
  `Importe` int(11) NOT NULL,
  `Descripcion_infraccion` varchar(100) NOT NULL,
  `Id_Persona_Infractora` int(11) NOT NULL,
  `Id_Agente` int(11) NOT NULL,
  `Id_Lugar` int(11) NOT NULL,
  `Id_Vehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `multa`
--

INSERT INTO `multa` (`Id_Multa`, `Fecha_multa`, `Importe`, `Descripcion_infraccion`, `Id_Persona_Infractora`, `Id_Agente`, `Id_Lugar`, `Id_Vehiculo`) VALUES
(1, '2015-10-08', 100000, 'Atropello a 15 huerfanos', 1, 2, 4, 3),
(2, '2010-12-01', 150000, 'Se paso un semáforo', 2, 2, 4, 1),
(3, '2022-10-10', 230000, 'Atropello un perro', 2, 5, 4, 2),
(4, '2005-03-03', 123000, 'Hablo en el teléfono mientras conducia', 1, 1, 1, 2),
(5, '2011-11-08', 450000, 'Conducia sin frenos', 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `persona_infractora`
--

CREATE TABLE `persona_infractora` (
  `Id_Persona_Infractora` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `No_domicilio` int(11) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Calle` varchar(30) NOT NULL,
  `Id_Ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona_infractora`
--

INSERT INTO `persona_infractora` (`Id_Persona_Infractora`, `Nombre`, `Apellidos`, `No_domicilio`, `Fecha_nacimiento`, `Calle`, `Id_Ciudad`) VALUES
(1, 'Alvaro', 'Nazaret Peréz', 452, '2003-10-08', '13 Sur', 2),
(2, 'Pastor', 'Dorado Socorro', 10, '2020-10-18', 'Sesame street', 1),
(3, 'Billy', 'Joel Peréz', 2, '2012-12-08', '15 Norte', 3),
(4, 'Michael', 'West Jackson', 12, '1923-11-18', 'La cardinal', 1),
(5, 'Yara', 'Gaviria Giraldo', 42, '2013-11-18', '21 Oeste', 5),
(6, 'José', 'Miguel Santa', 11, '2023-01-08', 'Hunted plaza', 4);

-- --------------------------------------------------------

--
-- Table structure for table `propietario`
--

CREATE TABLE `propietario` (
  `Id_Propietario` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `No_domicilio` int(11) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Calle` varchar(30) NOT NULL,
  `Id_Ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `propietario`
--

INSERT INTO `propietario` (`Id_Propietario`, `Nombre`, `Apellidos`, `No_domicilio`, `Fecha_nacimiento`, `Calle`, `Id_Ciudad`) VALUES
(1, 'Pastor', 'Gaviria Horro', 12, '2023-11-08', 'Elment Street', 1),
(2, 'Pastor', 'Agudelo Socorro', 1, '2020-10-18', 'Simón Bolivar', 2),
(3, 'Roberto', 'Espinel Peréz', 102, '2012-12-08', 'La bella rosa', 3),
(4, 'Federico', 'Santa Horro', 124, '1923-11-18', 'La cardinal', 1),
(5, 'Sofía', 'Gaviria Salázar', 402, '2013-11-18', '19 Norte', 5),
(6, 'Luis', 'Dorado Durán', 111, '2023-01-08', 'Hunted plaza', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo`
--

CREATE TABLE `vehiculo` (
  `Id_Vehiculo` int(11) NOT NULL,
  `Matricula` varchar(30) NOT NULL,
  `Fecha_Matriculacion` date NOT NULL,
  `Id_Propietario` int(11) NOT NULL,
  `Id_Casa_Automotriz` int(11) NOT NULL,
  `Id_Modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehiculo`
--

INSERT INTO `vehiculo` (`Id_Vehiculo`, `Matricula`, `Fecha_Matriculacion`, `Id_Propietario`, `Id_Casa_Automotriz`, `Id_Modelo`) VALUES
(1, 'BCD-123', '2012-10-04', 1, 4, 2),
(2, 'ASD-454', '2003-12-01', 1, 4, 3),
(3, 'SDF-456', '2003-02-01', 2, 5, 4),
(4, 'ERT-758', '2010-11-12', 2, 5, 1),
(5, 'THD-345', '2003-10-09', 3, 1, 2),
(6, 'SGK-567', '2015-10-08', 3, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agente_de_transito`
--
ALTER TABLE `agente_de_transito`
  ADD PRIMARY KEY (`Id_Agente`);

--
-- Indexes for table `casa_automotriz`
--
ALTER TABLE `casa_automotriz`
  ADD PRIMARY KEY (`Id_Casa_Automotriz`);

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_Ciudad`),
  ADD KEY `Id_Departamento` (`Id_Departamento`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Id_Departamento`);

--
-- Indexes for table `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`Id_lugar`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`Id_Marca`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`Id_Modelo`),
  ADD KEY `Id_Marca` (`Id_Marca`);

--
-- Indexes for table `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`Id_Multa`),
  ADD KEY `Id_Persona_Infractora` (`Id_Persona_Infractora`),
  ADD KEY `Id_Agente` (`Id_Agente`),
  ADD KEY `Id_Lugar` (`Id_Lugar`),
  ADD KEY `Id_Vehiculo` (`Id_Vehiculo`);

--
-- Indexes for table `persona_infractora`
--
ALTER TABLE `persona_infractora`
  ADD PRIMARY KEY (`Id_Persona_Infractora`),
  ADD KEY `Id_Ciudad` (`Id_Ciudad`);

--
-- Indexes for table `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`Id_Propietario`),
  ADD KEY `Id_Ciudad` (`Id_Ciudad`);

--
-- Indexes for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`Id_Vehiculo`),
  ADD KEY `Id_Propietario` (`Id_Propietario`),
  ADD KEY `Id_Casa_Automotriz` (`Id_Casa_Automotriz`),
  ADD KEY `Id_Modelo` (`Id_Modelo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agente_de_transito`
--
ALTER TABLE `agente_de_transito`
  MODIFY `Id_Agente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `casa_automotriz`
--
ALTER TABLE `casa_automotriz`
  MODIFY `Id_Casa_Automotriz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_Ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `Id_Departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lugar`
--
ALTER TABLE `lugar`
  MODIFY `Id_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `Id_Marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `Id_Modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `multa`
--
ALTER TABLE `multa`
  MODIFY `Id_Multa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `persona_infractora`
--
ALTER TABLE `persona_infractora`
  MODIFY `Id_Persona_Infractora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `propietario`
--
ALTER TABLE `propietario`
  MODIFY `Id_Propietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `Id_Vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamento` (`Id_Departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`Id_Marca`) REFERENCES `marca` (`Id_Marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`Id_Persona_Infractora`) REFERENCES `persona_infractora` (`Id_Persona_Infractora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `multa_ibfk_2` FOREIGN KEY (`Id_Agente`) REFERENCES `agente_de_transito` (`Id_Agente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `multa_ibfk_3` FOREIGN KEY (`Id_Lugar`) REFERENCES `lugar` (`Id_lugar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `multa_ibfk_4` FOREIGN KEY (`Id_Vehiculo`) REFERENCES `vehiculo` (`Id_Vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `persona_infractora`
--
ALTER TABLE `persona_infractora`
  ADD CONSTRAINT `persona_infractora_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudad` (`id_Ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`Id_Ciudad`) REFERENCES `ciudad` (`id_Ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`Id_Propietario`) REFERENCES `propietario` (`Id_Propietario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`Id_Casa_Automotriz`) REFERENCES `casa_automotriz` (`Id_Casa_Automotriz`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehiculo_ibfk_3` FOREIGN KEY (`Id_Modelo`) REFERENCES `modelo` (`Id_Modelo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
