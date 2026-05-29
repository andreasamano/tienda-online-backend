/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.5-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: tienda_online
-- ------------------------------------------------------
-- Server version	11.4.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `pedido_detalles`
--

DROP TABLE IF EXISTS `pedido_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `producto_nombre` varchar(120) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `pedido_detalles_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_detalles`
--

LOCK TABLES `pedido_detalles` WRITE;
/*!40000 ALTER TABLE `pedido_detalles` DISABLE KEYS */;
INSERT INTO `pedido_detalles` VALUES
(1,1,11,'Laptop HP 15',8999.00,3,26997.00),
(2,2,11,'Laptop HP 15',8999.00,3,26997.00),
(3,3,11,'Laptop HP 15',8999.00,3,26997.00),
(4,4,11,'Laptop HP 15',8999.00,3,26997.00),
(5,5,11,'Laptop HP 15',8999.00,3,26997.00),
(6,6,11,'Laptop HP 15',8999.00,3,26997.00),
(7,7,11,'Laptop HP 15',8999.00,3,26997.00),
(8,8,11,'Laptop HP 15',8999.00,3,26997.00),
(9,9,11,'Laptop HP 15',8999.00,3,26997.00),
(10,10,8,'Teclado Mecánico RGB',899.00,1,899.00),
(11,11,8,'Teclado Mecánico RGB',899.00,1,899.00),
(12,12,8,'Teclado Mecánico RGB',899.00,1,899.00),
(13,13,8,'Teclado Mecánico RGB',899.00,1,899.00),
(14,14,8,'Teclado Mecánico RGB',899.00,1,899.00),
(15,15,8,'Teclado Mecánico RGB',899.00,1,899.00),
(16,16,8,'Teclado Mecánico RGB',899.00,1,899.00),
(17,17,8,'Teclado Mecánico RGB',899.00,1,899.00);
/*!40000 ALTER TABLE `pedido_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(120) NOT NULL,
  `cliente_correo` varchar(120) NOT NULL,
  `direccion` text NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(40) DEFAULT 'Recibido',
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES
(1,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:15:18'),
(2,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:15:19'),
(3,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:15:21'),
(4,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:15:53'),
(5,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:15:54'),
(6,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:16:54'),
(7,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:16:55'),
(8,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1062 infonavit cañadas',26997.00,'Recibido','2026-05-27 21:16:56'),
(9,'andrea','L2217081416@culiacan.tecnm.mx','blv virreyes 1231',26997.00,'Recibido','2026-05-27 21:20:31'),
(10,'Andrea','samano@gamil.com','boulevar virreyes',899.00,'Recibido','2026-05-27 21:45:10'),
(11,'Andrea','samano@gamil.com','boulevar virreyes',899.00,'Recibido','2026-05-27 21:45:12'),
(12,'Andrea','samano@gamil.com','boulevar virreyes',899.00,'Recibido','2026-05-27 21:45:13'),
(13,'Andrea','samano@gamil.com','boulevar virreyes',899.00,'Recibido','2026-05-27 21:45:34'),
(14,'Andrea','samano@gamil.com','boulevar virreyes',899.00,'Recibido','2026-05-27 21:45:34'),
(15,'andrea','andrea@gmail.com','boulevar virreyes 1062',899.00,'Recibido','2026-05-27 21:55:39'),
(16,'andrea','andrea@gmail.com','boulevar virreyes 1062',899.00,'Recibido','2026-05-27 21:55:43'),
(17,'andrea','andrea@gmail.com','blv virreyes',899.00,'Recibido','2026-05-27 21:57:11');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `categoria` varchar(80) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `icono` varchar(10) DEFAULT '?',
  `activo` tinyint(1) DEFAULT 1,
  `destacado` tinyint(1) DEFAULT 0,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Audífonos Bluetooth AirBeat','Tecnología','Audífonos inalámbricos con cancelación de ruido y batería de larga duración.',699.00,18,'🎧',1,1,'2026-05-27 20:17:03'),
(2,'Mochila Urbana Pro','Accesorios','Mochila resistente al agua con compartimento para laptop y cargador.',549.00,12,'🎒',1,0,'2026-05-27 20:17:03'),
(3,'Teclado Mecánico RGB','Gaming','Teclado mecánico con iluminación RGB, switches azules y diseño compacto.',899.00,9,'⌨️',1,1,'2026-05-27 20:17:03'),
(4,'Playera Oversize Nova','Ropa','Playera de algodón corte oversize disponible en varias tallas.',249.00,25,'👕',1,0,'2026-05-27 20:17:03'),
(5,'Lámpara LED Smart','Hogar','Lámpara inteligente con control de intensidad y colores desde app.',399.00,15,'💡',1,0,'2026-05-27 20:17:03'),
(6,'Audífonos Bluetooth AirBeat','Tecnología','Audífonos inalámbricos con cancelación de ruido y batería de larga duración.',699.00,18,'🎧',1,1,'2026-05-27 20:18:28'),
(7,'Mochila Urbana Pro','Accesorios','Mochila resistente al agua con compartimento para laptop y cargador.',549.00,12,'🎒',1,0,'2026-05-27 20:18:28'),
(8,'Teclado Mecánico RGB','Gaming','Teclado mecánico con iluminación RGB, switches azules y diseño compacto.',899.00,1,'⌨️',1,1,'2026-05-27 20:18:28'),
(9,'Playera Oversize Nova','Ropa','Playera de algodón corte oversize disponible en varias tallas.',249.00,25,'👕',1,0,'2026-05-27 20:18:28'),
(10,'Lámpara LED Smart','Hogar','Lámpara inteligente con control de intensidad y colores desde app.',399.00,15,'💡',1,0,'2026-05-27 20:18:28'),
(11,'Laptop HP 15','Tecnología','Laptop para escuela y oficina.',8999.00,0,'💻',1,1,'2026-05-27 20:22:15');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-05-27 15:02:06
