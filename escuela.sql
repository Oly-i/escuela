-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2025 at 04:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escuela`
--

-- --------------------------------------------------------

--
-- Table structure for table `carrera`
--

CREATE TABLE `carrera` (
  `Codigo` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Duracion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `carrera`
--

INSERT INTO `carrera` (`Codigo`, `Nombre`, `Duracion`) VALUES
('AR2514', 'Arquitectura', '4 años'),
('DDMI93', 'Diseño Digital de Medios Interactivos', '4 años'),
('DM0234', 'Diseño de Modas', '3 años'),
('IAB350', 'Ingeniería Ambiental', '4 años');

-- --------------------------------------------------------

--
-- Table structure for table `inscripcion`
--

CREATE TABLE `inscripcion` (
  `CodigoInscripcion` int(11) NOT NULL,
  `Fecha` varchar(25) NOT NULL,
  `CodigoAlumno` varchar(25) NOT NULL,
  `CodigoCarrera` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `inscripcion`
--

INSERT INTO `inscripcion` (`CodigoInscripcion`, `Fecha`, `CodigoAlumno`, `CodigoCarrera`) VALUES
(100, '2 feb 2025', '219630', 'AR2514');

-- --------------------------------------------------------

--
-- Table structure for table `alumno`
--

CREATE TABLE `alumno` (
  `Codigo` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Edad` int(20) NOT NULL,
  `Telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `alumno`
--

INSERT INTO `alumno` (`Codigo`, `Nombre`, `Apellido`, `Edad`, `Telefono`) VALUES
('219630', 'Sarah', 'Esparza', 20, '6563378337');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`CodigoInscripcion`),
  ADD KEY `FKAlumno` (`CodigoAlumno`),
  ADD KEY `FKCarrera` (`CodigoCarrera`);

--
-- Indexes for table `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `CodigoInscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123457;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`CodigoAlumno`) REFERENCES `alumno` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`CodigoCarrera`) REFERENCES `carrera` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
