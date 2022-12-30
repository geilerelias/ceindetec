-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-10-2022 a las 07:46:39
-- Versión del servidor: 10.5.17-MariaDB-cll-lve
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `almaguaj_sigacdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ethnic_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attended_by` bigint(20) UNSIGNED DEFAULT NULL,
  `relationship` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_id` bigint(20) UNSIGNED NOT NULL,
  `headquarter_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `name`, `surname`, `gender`, `identification_type`, `identification_number`, `birthday_date`, `ethnic_group`, `email`, `phone`, `blood_type`, `person_type`, `attended_by`, `relationship`, `department`, `municipality`, `direction`, `profile_photo_path`, `establishment_id`, `headquarter_id`, `created_at`, `updated_at`) VALUES
(9, 'luis elisander', 'cotes pushaina', 'Masculino', 'CC', '84035273', '1969-08-03', 'Comunidades indígenas', 'eliyei2012@hotmail.com', '3133213066', 'B+', 'Director', NULL, NULL, 'La Guajira', 'Riohacha-1', 'calle 3A N° 6 ESTE 43', NULL, 19, 24, '2022-10-10 21:02:44', '2022-10-10 21:02:44'),
(10, 'omar enrique', 'López Iguaran', 'Masculino', 'CC', '84077526', '1976-10-25', 'Comunidades indígenas', 'oelopez21@hotmail.com', '3226497319', 'A+', 'Coordinador', NULL, NULL, 'La Guajira', 'Riohacha-1', 'carrera 7A # 17- 45', NULL, 19, 24, '2022-10-10 21:45:07', '2022-10-10 21:45:07'),
(11, 'Jhon Jairo', 'Rodríguez', 'Masculino', 'CC', '17858544', '1973-05-22', 'Comunidades indígenas', 'sanrafaeldelpajaro@yahoo.com', '3135587488', 'O+', 'Rector', NULL, NULL, 'La Guajira', 'Manaure', 'Rancheria la Paz', 'person/person-image-1665420456.jpeg', 10, 11, '2022-10-10 21:47:37', '2022-10-10 21:47:37'),
(12, 'Celso', 'Hernández', 'Masculino', 'CC', '84029922', '2008-12-16', 'Comunidades indígenas', 'herespelta2709@gmail.com', '3164567155', 'O+', 'Director', NULL, NULL, 'La Guajira', 'Riohacha-1', 'Calle 17 N 1 143', NULL, 20, 25, '2022-10-10 23:46:43', '2022-10-10 23:46:43'),
(13, 'luisa maría', 'socarras Mendoza', 'Femenino', 'CC', '40931864', '1972-12-08', 'Comunidades indígenas', 'lumasome2013@hotmail.com', '3205688024', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'carrera 12B # 33-50', NULL, 19, 24, '2022-10-11 00:35:39', '2022-10-11 00:35:39'),
(14, 'dulce maria', 'Mendoza', 'Femenino', 'CC', '40929954', '1975-04-28', 'Comunidades indígenas', 'dulcemendoza@uniguajira.edu.co', '3126626876', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'carrera 8 # 34B-66', NULL, 19, 24, '2022-10-11 00:42:00', '2022-10-11 00:42:00'),
(15, 'Edilberto Manuel', 'Prasca Uriana', 'Masculino', 'CC', '84078862', '1973-04-05', 'Comunidades indígenas', 'Edilbertoprasca@yahoo.com', '3002781670', 'O+', 'Rector', NULL, NULL, 'La Guajira', 'Manaure', 'Calle 6 N.8-85', 'person/person-image-1665439142.jpg', 14, 18, '2022-10-11 02:59:02', '2022-10-11 02:59:02'),
(16, 'Over', 'Cárdenas Gutiérrez', 'Masculino', 'CC', '1124414347', '1996-09-09', 'Comunidades indígenas', 'overcardenasgutierrez@gmail.com', '3004048823', 'B+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'Calle 1 número 12-72', 'person/person-image-1665494886.jpg', 14, 18, '2022-10-11 18:28:06', '2022-10-11 18:28:06'),
(17, 'Eider', 'Castellar', 'Masculino', 'CC', '1143341656', '1990-03-27', 'Comunidades indígenas', 'eidercastellar48@gmail.com', '3005691513', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'carrera 2 # 9-57', 'person/person-image-1665495034.jpg', 14, 18, '2022-10-11 18:30:34', '2022-10-11 18:30:34'),
(18, 'Francisco Javier', 'Restrepo Arroyave', 'Masculino', 'CC', '14795987', '1982-11-02', 'Comunidad Raizal', 'cerba.campana@gmail.com', '3104113246', 'O+', 'Director', NULL, NULL, 'La Guajira', 'Dibulla', 'Carrera 4 # 3-48', NULL, 6, 6, '2022-10-11 18:35:59', '2022-10-11 18:35:59'),
(19, 'GUILLERMO', 'SOTO TORRES', 'Masculino', 'CC', '79718762', '1975-07-22', 'Comunidad Raizal', 'guillermosototorres@yahoo.es', '3233215245', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Dibulla', 'Calle 3 # 3 - 11', 'person/person-image-1665499057.jpg', 6, 6, '2022-10-11 19:37:37', '2022-10-11 19:37:37'),
(20, 'Leydis Dallana', 'Julio González', 'Femenino', 'CC', '1094249317', '1990-03-06', 'Comunidades afrocolombianas', 'leydisdayana@hotmail.com', '3008604562', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'Cr 28#27a-55', NULL, 6, 6, '2022-10-12 02:08:48', '2022-10-12 02:08:48'),
(21, 'amilkar de jesus', 'gamez ipuana', 'Masculino', 'CC', '1124370560', '1987-11-04', 'Comunidades indígenas', 'amilkargamez11|@hotmail.es', '3214537196', 'O+', 'Director', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad lamana', NULL, 12, 15, '2022-10-12 04:11:03', '2022-10-12 04:11:03'),
(22, 'sofi', 'marin ipuana', 'Femenino', 'CC', '1118834369', '1990-11-24', 'Comunidades indígenas', 'sofimarin24@gmail.com', '3205715813', 'O+', 'Coordinador', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad de lamana', NULL, 12, 15, '2022-10-12 04:38:10', '2022-10-12 04:38:10'),
(23, 'diba patricia', 'jusayu zambrano', 'Femenino', 'CC', '1124369505', '1987-08-17', 'Comunidades indígenas', 'bjusayusambaramo@gmail.com', '3127381925', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad de lamana', NULL, 12, 15, '2022-10-12 04:44:34', '2022-10-12 04:44:34'),
(24, 'keider', 'ipuana epinayu', 'Masculino', 'CC', '1124382764', '1989-12-06', 'Comunidades indígenas', 'keideripu@gmail.com', '3157395617', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad de lamana', NULL, 12, 15, '2022-10-12 04:47:18', '2022-10-12 04:47:18'),
(25, 'Romelia María', 'Floriano Jiménez', 'Femenino', 'CC', '60395182', '1978-12-26', 'Comunidades afrocolombianas', 'janckerandrey@hotmail.com', '3043875778', 'B+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'Carrera 6 A # 20 A 23', 'person/person-image-1665577193.jpg', 6, 6, '2022-10-12 17:19:53', '2022-10-12 17:19:53'),
(26, 'yakelina', 'benjumea', 'Femenino', 'CC', '1118817335', '1981-07-25', 'Comunidades indígenas', 'benjumeayakelina@gmail.com', '3207643627', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'barrio villa Fátima', NULL, 19, 24, '2022-10-12 18:30:02', '2022-10-12 18:30:02'),
(27, 'elizabeht', 'cotes larrada', 'Femenino', 'CC', '1006617521', '1980-05-29', 'Comunidades indígenas', 'nicolbonivento123@gmail.com', '3208166804', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'calle 20 # 5B-20', NULL, 19, 24, '2022-10-12 18:32:58', '2022-10-12 18:32:58'),
(28, 'claudia maria', 'cotes pusahina', 'Femenino', 'CC', '40944743', '1985-02-14', 'Comunidades indígenas', 'ccotes@uniguajira.edu.com', '3042151402', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'comunidad indigena el pasito', NULL, 19, 24, '2022-10-12 18:37:38', '2022-10-12 18:37:38'),
(29, 'amis daniela', 'gouriyu benjumea', 'Femenino', 'TI', '1118838238', '2009-08-24', 'Comunidades indígenas', 'benjumeayakelin@gmail.com', '3207643627', 'B+', 'Estudiante', 26, 'Madre', 'La Guajira', 'Riohacha-1', 'barrio villa fatima', NULL, 19, 24, '2022-10-12 18:41:29', '2022-10-12 18:41:29'),
(30, 'antonela maria', 'jimenez cotes', 'Femenino', 'TI', '1119396370', '2010-03-18', 'Comunidades indígenas', 'anbonivento@uniguajira.edu.co', '3208166804', 'B+', 'Estudiante', 27, 'Madre', 'La Guajira', 'Riohacha-1', 'calle 20 #5B-20', NULL, 19, 24, '2022-10-12 18:50:33', '2022-10-12 18:50:33'),
(31, 'Luna  Talhietg', 'Cotes Cotes', 'Femenino', 'TI', '1139325527', '2012-05-22', 'Comunidades indígenas', 'ccotes@uniguajira.edu.co', '3042151402', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha-1', 'comunidad el pasito', NULL, 19, 24, '2022-10-12 18:57:02', '2022-10-12 18:57:02'),
(32, 'orlys ademir', 'cotes epiayu', 'Masculino', 'CC', '1118850277', '1996-04-07', 'Comunidades indígenas', 'orlytronik@gmail.com', '3172447452', 'B+', 'Administrativo', NULL, NULL, 'La Guajira', 'Riohacha-1', 'calle 3A # 6 ESTE 43', NULL, 19, 24, '2022-10-12 19:16:33', '2022-10-12 19:16:33'),
(33, 'César Hernando', 'Benítez Pérez', 'Masculino', 'CC', '92533226', '1979-02-04', 'Comunidades afrocolombianas', 'cbenitezp@uniguajira.edu.co', '3114292269', 'A+', 'Coordinador', NULL, NULL, 'La Guajira', 'Dibulla', 'Cra 3A # 15A - 20', NULL, 5, 5, '2022-10-14 00:09:43', '2022-10-14 00:09:43'),
(34, 'Franklin Omar', 'Alarcón Mengual', 'Masculino', 'CC', '84035910', '1971-10-22', 'Comunidades indígenas', 'falarconmengual@yahoo.es', '3213516548', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'Calle 2#1~105 el Pájaro', NULL, 10, 11, '2022-10-14 22:10:18', '2022-10-14 22:10:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_email_unique` (`email`),
  ADD KEY `people_establishment_id_foreign` (`establishment_id`),
  ADD KEY `people_headquarter_id_foreign` (`headquarter_id`),
  ADD KEY `people_attended_by_foreign` (`attended_by`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_attended_by_foreign` FOREIGN KEY (`attended_by`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `people_establishment_id_foreign` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `people_headquarter_id_foreign` FOREIGN KEY (`headquarter_id`) REFERENCES `headquarters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
