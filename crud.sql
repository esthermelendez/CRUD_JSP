-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2018 a las 23:41:52
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_proveedor`
--

CREATE TABLE `articulo_proveedor` (
  `CODPRO` int(11) NOT NULL,
  `CODPROV` int(11) NOT NULL,
  `CODART` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CODCLI` int(11) NOT NULL,
  `NOMCLI` varchar(45) NOT NULL,
  `APECLI` varchar(45) NOT NULL,
  `DNICLI` varchar(45) NOT NULL,
  `TLFCLI` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CODCLI`, `NOMCLI`, `APECLI`, `DNICLI`, `TLFCLI`) VALUES
(11, 'Manuel', 'Zambrana Sanchez', '67498374N', '678940362'),
(18, 'Manuel', 'Zambrana Ruiz', '77654758P', '678932495'),
(23, 'Helena', 'Rodriguez Chavez', '74653298b', '674539072'),
(24, 'Miguel', 'Torres Canseco', '76352419V', '673625344'),
(25, 'Raul', 'Chamorro Gallardo', '76352145B', '653411289'),
(28, 'Toni ', 'Martynez Soria', '74635241N', '673546251'),
(31, 'Carlota', 'Gonzalez Sanchez', '78463521H', '674532635'),
(32, 'Raquel', 'Sanchez Silva', '74635241V', '678945367'),
(33, 'Juan Antonio', 'Castillo Subirez', '78364524L', '674835712'),
(35, 'Laura', 'Gomez Luque', '75849847L', '635241894'),
(36, 'Francisco', 'Garcia Romero', '75849847L', '645390086'),
(37, 'Mireia', 'Bravo Terruel', '76453298B', '675483972'),
(38, 'Carlos', 'Martin Lopez', '76352894L', '674531129');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `CODCLI` int(11) NOT NULL,
  `CODPRO` int(11) NOT NULL,
  `NUMFAC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CODPRO` int(11) NOT NULL,
  `NOMPRO` varchar(45) NOT NULL,
  `STOPRO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CODPRO`, `NOMPRO`, `STOPRO`) VALUES
(1, 'Mascarilla', 10),
(2, 'Champú matizador', 14),
(3, 'Champú', 20),
(4, 'Decoloracion 30vol', 18),
(5, 'Decoloracion 20vol', 17),
(6, 'Decoloracion 25vol', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `CODPROV` int(11) NOT NULL,
  `TLFPRO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  ADD PRIMARY KEY (`CODART`),
  ADD KEY `fk_PRODUCTO_has_PROVEEDOR_PROVEEDOR1_idx` (`CODPRO`),
  ADD KEY `fk_PRODUCTO_has_PROVEEDOR_PRODUCTO1_idx` (`CODPROV`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CODCLI`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`NUMFAC`),
  ADD KEY `fk_CLIENTE_has_PRODUCTO_PRODUCTO1_idx` (`CODPRO`),
  ADD KEY `fk_CLIENTE_has_PRODUCTO_CLIENTE_idx` (`CODCLI`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CODPRO`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`CODPROV`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  MODIFY `CODART` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CODCLI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `NUMFAC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `CODPRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `CODPROV` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  ADD CONSTRAINT `fk_PRODUCTO_has_PROVEEDOR_PRODUCTO1` FOREIGN KEY (`CODPRO`) REFERENCES `producto` (`CODPRO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PRODUCTO_has_PROVEEDOR_PROVEEDOR1` FOREIGN KEY (`CODPROV`) REFERENCES `proveedor` (`CODPROV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_CLIENTE_has_PRODUCTO_CLIENTE` FOREIGN KEY (`CODCLI`) REFERENCES `cliente` (`CODCLI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CLIENTE_has_PRODUCTO_PRODUCTO1` FOREIGN KEY (`CODPRO`) REFERENCES `producto` (`CODPRO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
