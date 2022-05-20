-- --------------------------------------------------------
-- Host:                         172.23.0.1
-- Versión del servidor:         10.5.13-MariaDB-1:10.5.13+maria~focal - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para apirest
CREATE DATABASE IF NOT EXISTS `apirest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */;
USE `apirest`;

-- Volcando estructura para tabla apirest.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apirest.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.inventarios
CREATE TABLE IF NOT EXISTS `inventarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_products` bigint(20) unsigned NOT NULL,
  `id_sucursal` bigint(20) unsigned NOT NULL,
  `gondola` decimal(8,2) DEFAULT NULL,
  `bodega` decimal(8,2) DEFAULT NULL,
  `resultado` decimal(8,2) DEFAULT NULL,
  `cantidad` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventarios_id_products_foreign` (`id_products`),
  KEY `inventarios_id_sucursal_foreign` (`id_sucursal`),
  CONSTRAINT `inventarios_id_products_foreign` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`),
  CONSTRAINT `inventarios_id_sucursal_foreign` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


-- Volcando estructura para tabla apirest.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apirest.migrations: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(31, '2014_10_06_141137_create_roles_table', 1),
	(32, '2014_10_12_000000_create_users_table', 1),
	(33, '2014_10_12_100000_create_password_resets_table', 1),
	(34, '2019_08_19_000000_create_failed_jobs_table', 1),
	(35, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(36, '2022_03_14_160142_create_proveedors_table', 1),
	(37, '2022_03_15_033017_create_products_table', 1),
	(38, '2022_04_06_184149_create_sucursals_table', 1),
	(39, '2022_04_06_184902_create_inventarios_table', 1),
	(40, '2022_04_06_192356_create_user_sucursals_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apirest.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apirest.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo1` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `codigo2` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `linea` bigint(20) unsigned NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `paqxcaja` bigint(20) DEFAULT NULL,
  `unixcaja` bigint(20) DEFAULT NULL,
  `paqxdisp` bigint(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_linea_foreign` (`linea`),
  CONSTRAINT `products_linea_foreign` FOREIGN KEY (`linea`) REFERENCES `proveedors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


-- Volcando estructura para tabla apirest.proveedors
CREATE TABLE IF NOT EXISTS `proveedors` (
  `id` bigint(20) unsigned NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando estructura para tabla apirest.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla apirest.roles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'xb36pvbtt6hd8dt', 'Usuario', '2022-04-13 21:53:08', '2022-04-13 21:53:08'),
	(2, 'xb36pvbtt6bq8vt', 'Administrador', '2022-04-13 21:53:08', '2022-04-19 07:36:14'),
	(3, 'xb36pvbtt6crf46', 'Superusuario', '2022-04-13 21:53:08', '2022-04-13 21:53:08');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.sucursals
CREATE TABLE IF NOT EXISTS `sucursals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla apirest.sucursals: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `sucursals` DISABLE KEYS */;
REPLACE INTO `sucursals` (`id`, `nombre`, `direccion`, `telefono`, `created_at`, `updated_at`) VALUES
	(1, 'Chimita', 'km 4 Via Girón - Chimita', '6761111', '2022-04-13 21:53:08', '2022-04-13 21:53:08'),
	(2, 'Guarín 2', 'Cra 33 # 32-35', '6457123', '2022-04-13 21:53:08', '2022-04-16 19:09:38');
/*!40000 ALTER TABLE `sucursals` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 0,
  `role` bigint(20) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_foreign` (`role`),
  CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Volcando datos para la tabla apirest.users: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `password`, `estado`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'johnbarb71@gmail.com', '$2y$10$zxUCALyIhrkOF3LnU.jUkuhDc0LlVhdqx3as1NF2kExmUtDhZ6tZC', 1, 3, NULL, '2022-04-13 21:53:08', '2022-04-13 21:53:08'),
	(2, 'Jhon H. Barbosa G.', 'johnbarb@hotmail.com', '$2y$10$VYAJ55Yb8sbKSme4oKTn4OFKbwZruN9NsDw6U2Yt/d5lJMKRF0h3m', 1, 2, NULL, '2022-04-13 21:53:08', '2022-04-17 08:06:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla apirest.user_sucursals
CREATE TABLE IF NOT EXISTS `user_sucursals` (
  `id_user` bigint(20) unsigned NOT NULL,
  `id_sucursal` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `user_sucursals_id_user_foreign` (`id_user`),
  KEY `user_sucursals_id_sucursal_foreign` (`id_sucursal`),
  CONSTRAINT `user_sucursals_id_sucursal_foreign` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursals` (`id`),
  CONSTRAINT `user_sucursals_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla apirest.user_sucursals: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `user_sucursals` DISABLE KEYS */;
REPLACE INTO `user_sucursals` (`id_user`, `id_sucursal`, `created_at`, `updated_at`) VALUES
	(1, 1, '2022-04-13 21:53:08', '2022-04-13 21:53:08'),
	(2, 2, '2022-04-13 21:53:08', '2022-04-13 21:53:08');
/*!40000 ALTER TABLE `user_sucursals` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
