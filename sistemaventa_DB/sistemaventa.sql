-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2023 a las 22:02:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemaventa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `dni` int(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` int(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `razon` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `telefono`, `direccion`, `razon`, `fecha`) VALUES
(4, 52347896, 'Emily Johnson', 91234567, 'Calle Uruguay 123, Montevideo, Uruguay', '', '2023-11-30 16:59:28'),
(5, 56781234, 'Marcus Rodriguez', 97765432, 'Avenida Brasil 456, Punta del Este, Uruguay', '', '2023-11-30 17:00:25'),
(6, 58907643, 'Sophia Patel', 93456789, 'Rambla República de México 789, Colonia del Sacramento, Uruguay', '', '2023-11-30 17:01:03'),
(7, 51234567, 'Liam Chang', 98876543, 'Avenida Italia 1011, Montevideo, Uruguay', '', '2023-11-30 17:01:31'),
(8, 59872361, 'Isabella Andersson', 95012345, 'Calle Juan Zorrilla de San Martín 1213, Maldonado, Uruguay', '', '2023-11-30 17:02:02'),
(9, 54321987, 'Noah Fernandez', 90123456, 'Camino de los Gauchos 1415, Paysandú, Uruguay', '', '2023-11-30 17:02:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `telefono` int(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `razon` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL,
  `cod_pro` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `proveedor` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `proveedor`, `stock`, `precio`, `fecha`) VALUES
(3, 'HW1001', 'Tarjeta gráfica GeForce RTX 3080	', 'NVIDIA', 50, 900, '2023-11-30 17:41:00'),
(4, 'HW1002', 'Procesador Intel Core i9-11900K	', 'Intel', 30, 550, '2023-11-30 17:41:27'),
(5, 'HW1003', 'Disco Duro SSD Samsung 1TB	', 'Samsung', 100, 130, '2023-11-30 17:42:16'),
(6, 'HW1004', 'Placa base ASUS ROG Strix Z590	', 'ASUS', 40, 280, '2023-11-30 17:42:50'),
(7, 'HW1005', 'Memoria RAM Corsair Vengeance 32GB	', 'Corsair', 80, 190, '2023-11-30 17:43:16'),
(8, 'HW1006', 'Monitor gaming Acer Predator XB271HU	', 'Acer', 20, 600, '2023-11-30 17:43:41'),
(9, 'HW1007', 'Teclado mecánico Logitech G Pro	', 'Logitech', 60, 130, '2023-11-30 17:44:03'),
(10, 'HW1008', 'Ratón inalámbrico Razer DeathAdder	', 'Razer', 70, 80, '2023-11-30 17:44:25'),
(11, 'HW1009', 'Fuente de alimentación EVGA 850W	', 'EVGA', 35, 150, '2023-11-30 17:44:45'),
(12, 'HW1010', 'Caja de PC NZXT H510	', 'NZXT', 25, 80, '2023-11-30 17:45:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `ruc` int(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` int(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `razon` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `ruc`, `nombre`, `telefono`, `direccion`, `razon`, `fecha`) VALUES
(2, 123456789, 'NVIDIA', 912345678, 'Av. de la Tecnología 123, Montevideo, UY	', 'NVIDIA Uruguay\r\n', '2023-11-30 17:22:19'),
(3, 987654321, 'Intel', 987654321, 'Calle de los Procesadores 456, Montevideo, UY	', 'Intel Uruguay\r\n', '2023-11-30 17:22:52'),
(4, 567891234, 'Samsung', 777777777, 'Plaza de los Discos 789, Montevideo, UY	', 'Samsung Uruguay\r\n', '2023-11-30 17:23:22'),
(5, 345678912, 'ASUS', 666666666, 'Ruta de las Placas 012, Montevideo, UY	', 'ASUS Uruguay\r\n', '2023-11-30 17:23:51'),
(6, 789123456, 'Corsair', 555555555, 'Av. de las Memorias 345, Montevideo, UY	', 'Corsair Uruguay\r\n', '2023-11-30 17:25:44'),
(7, 234567891, 'Acer', 444444444, 'Esquina de los Monitores 678, Montevideo, UY	', 'Acer Uruguay\r\n', '2023-11-30 17:26:12'),
(8, 876543219, 'Logitech', 333333333, 'Av. de los Teclados 901, Montevideo, UY	', 'Logitech Uruguay\r\n', '2023-11-30 17:26:39'),
(9, 432198765, 'Razer', 222222222, 'Plaza de los Ratones 234, Montevideo, UY	', 'Razer Uruguay\r\n', '2023-11-30 17:27:07'),
(10, 654321987, 'EVGA', 111111111, 'Calle de las Fuentes 567, Montevideo, UY	', 'EVGA Uruguay\r\n', '2023-11-30 17:27:34'),
(11, 321987654, 'NZXT', 999999999, 'Ruta de las Cajas 890, Montevideo, UY	', 'NZXT Uruguay\r\n', '2023-11-30 17:27:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `pass` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `pass`) VALUES
(6, 'Dylan Lequini', 'dylan@gmail.com', '1a402bd4764f2e442619e239a3872573');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
