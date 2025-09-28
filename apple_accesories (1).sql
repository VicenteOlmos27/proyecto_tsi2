-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2025 a las 23:38:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apple_accesories`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes`
--

CREATE TABLE `ajustes` (
  `cod_ajuste` varchar(10) NOT NULL,
  `cod_pedido` varchar(10) DEFAULT NULL,
  `tipo_ajuste` tinyint(1) NOT NULL,
  `cantidad` tinyint(4) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date NOT NULL,
  `cod_usuario` varchar(10) DEFAULT NULL,
  `cod_producto` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `cod_carrito` varchar(20) NOT NULL,
  `cod_producto` varchar(10) NOT NULL,
  `cantidad` tinyint(4) NOT NULL,
  `precio_unitario` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cod_categoria` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`cod_categoria`, `nombre`, `descripcion`) VALUES
('CAT01', 'Mac', 'Computadores Apple: MacBook y iMac'),
('CAT02', 'MAINCRAA', 'Tablets Apple'),
('CAT03', 'iPhone', 'Smartphones Apple'),
('CAT04', 'Accesorios', 'Accesorios oficiales de Apple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cod_usuario` varchar(10) NOT NULL,
  `nombre_apellido` varchar(20) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `contraseña` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cod_usuario`, `nombre_apellido`, `correo`, `direccion`, `telefono`, `contraseña`) VALUES
('00958362-4', 'Seba KarPEmain', 'Isbeaa@gmail.com', 'Valparaiso', '984637721', '$2b$10$u2seDefIDfob1KITkQcwa.EBLZPbV4T.ldESCSOTq4wSLKv8rHHLW'),
('12345678-9', 'Juan Pérez', 'juan@example.com', 'Calle Falsa 123', '912345678', '$2b$10$5yEwLZuCibSg1pCUIA2rcO.YhgRUgAoCMLN35O7FKYBgTgodO7Nru'),
('21347835-9', 'Floripondia Maldonad', 'flori@gmail.com', 'santiago', '839274401', '$2b$10$ieqpq94VNlB2YU3CkJtAf.LtZj1aLE/8ynV/DEZ8Eezt6UxeUzGnO'),
('22292570-3', 'Nicole Castillo', 'nico@gmail.com', 'placilla city', '874629472', '$2b$10$t3Wzt/yTaAa7Dt9LkSEjteOIPlbNpI0Ea/OE6No3NK84AMK7fhC7K'),
('26482684-1', 'Vixito Olmos', 'v@gmail.com', 'tumama 23', '974820412', '$2b$10$kU/kwlpAck9RdGwcRDRFueOd00h4x9pwywOLfNsdhXVCX/F6bqdY6'),
('34874653-4', 'Jennifer Reymer', 'Jenny@gmail.com', 'playa ancha', '847020013', '$2b$10$mX5D3L7pGuMcARN7XF/O9OhkRsvi/SY/goa6YsiqUf5aeUq0PtWQG'),
('73095672-4', 'Isabella Karmain', 'Isa@gmail.com', 'Valparaiso', '984637721', '$2b$10$cqejUYaVQtVZxKJUWV1YUua79UMKAQiOeOo70kUwLLQP7OGF3bbv.'),
('75492048-2', 'Juana Bondado', 'juani@gmail.com', 'playa ancha', '948376612', '$2b$10$05eMMnxnR87tJkLzgj3pCO.nN2V6jyrfmTdPxP949Zztv3WcrX0MS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `cod_usuario` varchar(10) NOT NULL,
  `cantidad` tinyint(4) NOT NULL,
  `total_unitario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `cod_pedido` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `total` int(11) NOT NULL,
  `comprobante` varchar(60) DEFAULT NULL,
  `empresa_envio` varchar(20) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cod_producto` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `precio_unitario` float NOT NULL,
  `stock` tinyint(4) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `cod_categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cod_producto`, `nombre`, `descripcion`, `precio_unitario`, `stock`, `imagen`, `cod_categoria`) VALUES
('ACC001', 'AirPods Pro 2', 'Auriculares inalámbricos con cancelación', 250000, 30, 'airpods_pro_2.jpg', 'CAT04'),
('ACC002', 'Apple Watch Series 9', 'Reloj inteligente con pantalla Always-On', 550000, 12, 'apple_watch_s9.jpg', 'CAT04'),
('ACC003', 'Magic Mouse', 'Mouse inalámbrico de Apple', 90000, 40, 'magic_mouse.jpg', 'CAT04'),
('ACC004', 'Funda MagSafe iPhone', 'Funda de silicona con MagSafe', 60000, 50, 'funda_magsafe_iphone15.jpg', 'CAT04'),
('IPD001', 'iPad Pro 12.9\"', 'Tablet profesional con chip M2', 1100000, 12, 'ipad_pro_12_9.jpg', 'CAT02'),
('IPD002', 'iPad Air', 'Tablet ligera con chip M1', 750000, 15, 'ipad_air.jpg', 'CAT02'),
('IPD003', 'iPad Mini', 'Tablet compacta de 8.3\"', 600000, 20, 'ipad_mini.jpg', 'CAT02'),
('IPH001', 'PENEMAN', 'Smartphone con chip A17 Pro', 1200000, 20, 'iphone_15_pro.jpg', 'CAT03'),
('IPH002', 'iPhone 15', 'Smartphone con chip A16 Bionic', 950000, 20, 'iphone_15.jpg', 'CAT03'),
('IPH003', 'iPhone SE (3ra gen)', 'iPhone compacto con Touch ID', 500000, 25, 'iphone_se.jpg', 'CAT03'),
('MAC001', 'MacBook Air M2', 'Laptop ultradelgada con chip M2', 1250000, 10, 'macbook_air_m2.jpg', 'CAT01'),
('MAC002', 'MacBook Pro 14\"', 'Laptop profesional con chip M2 Pro', 1900000, 8, 'macbook_pro_14.jpg', 'CAT01'),
('MAC003', 'iMac 24\"', 'Computador de escritorio con chip M1', 1500000, 6, 'imac_24.jpg', 'CAT01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `nro_seguimiento` varchar(10) NOT NULL,
  `cod_pedido` varchar(20) NOT NULL,
  `fecha_cambio` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cod_usuario` varchar(10) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `tipo_usuario` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `nombre_usuario`, `contraseña`, `tipo_usuario`) VALUES
('00958362-4', 'Seba KarPEmain', '$2b$10$5ZQqKxgjLZcz.OB0dPi9X.a7spxfLXGo1w2mBzEmFMWDRFmMcq5G2', 0),
('34874653-4', 'Jennifer Reymer', '$2b$10$RcdNy0dyf5PUBNhWb5p93OdEjO4AiIEpOVkHOASgyfG4ZeyX8GlI.', 0),
('73095672-4', 'Isabella Karmain', '$2b$10$TcIFALyyhl8eleU6Ec7HG.DaQJq6G6DNVogc2GKtMi81gML3.NCyO', 0),
('75492048-2', 'Juana Bondado', '$2b$10$2P/yAyMI.DQbN8arsyCMBOxWPAsXwXeKH6H8WcVSIPfgKN5k2b3m2', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD PRIMARY KEY (`cod_ajuste`),
  ADD KEY `cod_usuario` (`cod_usuario`),
  ADD KEY `cod_producto` (`cod_producto`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`cod_carrito`),
  ADD KEY `cod_producto` (`cod_producto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`cod_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Indices de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`nro_seguimiento`),
  ADD KEY `cod_pedido` (`cod_pedido`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD CONSTRAINT `ajustes_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`),
  ADD CONSTRAINT `ajustes_ibfk_2` FOREIGN KEY (`cod_producto`) REFERENCES `productos` (`cod_producto`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`cod_producto`) REFERENCES `productos` (`cod_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categorias` (`cod_categoria`);

--
-- Filtros para la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_ibfk_1` FOREIGN KEY (`cod_pedido`) REFERENCES `pedido` (`cod_pedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
