-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2023 at 03:57 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almaguaj_sigacdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_plans`
--

CREATE TABLE `area_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `establishments`
--

CREATE TABLE `establishments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `establishments`
--

INSERT INTO `establishments` (`id`, `name`, `nit`, `municipality`, `department`, `created_at`, `updated_at`) VALUES
(1, 'Centro Educativo Eduardo Pinto Aragón de Porciosa', '0000', 'Albania', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(2, 'Centro Etnoeducativo Rural Utpurai', '0000', 'Albania', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(3, 'Institución Etnoeducativa Rural Akuaipa Internado Indígena de Albania', '0000', 'Albania', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(4, 'Centro Educativo luis A. Brito de San Pedro', '0000', 'Barrancas', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(5, 'Institución educativa técnica rural agropecuaria de mingueo', '0000', 'Dibulla', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(6, 'Centro educativo rural buenos aires de campana', '0000', 'Dibulla', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(7, 'Institución educativa rural san antonio de palomino', '0000', 'Dibulla', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(8, 'Institución educativa técnica roig y villalba', '0000', 'Fonseca', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(9, 'Institución educativa técnica agropecuaria anaurio manjarrez', '0000', 'La Jagua', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(10, 'Institución etnoeducativa san rafael del pájaro', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(11, 'Institución etnoeducativa técnica eusebio septimio mari', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(12, 'Centro etnoeducativo rural kanaan', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(13, 'Centro etnoeducativo rural de ishashimana', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(14, 'Institución educativa urbana mixta no.1', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(15, 'Institución etnoducativa rural internado laachon mayapo', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(16, 'Institución etnoeducativa nuestra señora de Fátima', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(17, 'Institución etnoeducativa de maracari', '0000', 'Manaure', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(18, 'Centro etnoeducativo #17 (kousachon)', '0000', 'Riohacha', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(19, 'Centro etnoeducativo #4', '0000', 'Riohacha', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(20, 'Centro etnoeducativo #8 (paraver)', '0000', 'Riohacha', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(21, 'Centro etnoeducativo #9 (mañature)', '0000', 'Riohacha', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `headquarters`
--

CREATE TABLE `headquarters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `dane_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `establishment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `headquarters`
--

INSERT INTO `headquarters` (`id`, `name`, `dane_code`, `address`, `municipality`, `department`, `email`, `phone`, `establishment_id`, `created_at`, `updated_at`) VALUES
(1, 'Escuela Rural de Santa Fe', '244035003360', 'Resguardo Pitulumani', 'Albania', 'La Guajira', 'mail@mail.com', '3145053111', 1, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(2, 'Escuela Indígena Itaka', '244035003432', 'Km 41 Via Riohacha', 'Albania', 'La Guajira', 'mail@mail.com', '3133782458', 2, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(3, 'Escuela Indígena Almirante Padilla', '2443000086', 'Zona Rural de Albania', 'Albania', 'La Guajira', 'mail@mail.com', '3145517794', 3, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(4, 'Escuela Rural de La Granjita', '244078001484', 'Rancheria La Granjita', 'Barrancas', 'La Guajira', 'mail@mail.com', '3008052296', 4, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(5, 'Escuela Rural Siete de Junio', '244001000515', 'Barrio Campo Alegre', 'Dibulla', 'La Guajira', 'mail@mail.com', '3145517794', 5, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(6, 'Sede Principal', '2440001001678', 'Vereda Campana Nuevo', 'Dibulla', 'La Guajira', 'mail@mail.com', '3104113246', 6, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(7, 'Sede Principal', '244090003069', 'Corregimiento de Palomino', 'Dibulla', 'La Guajira', 'mail@mail.com', '3175849898', 7, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(8, 'Escuela Tomas Emilio Medina Curiel', '144560000067', 'Calle 17 Nro 19-46', 'Fonseca', 'La Guajira', 'mail@mail.com', '0000000000', 8, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(9, 'Escuela Cleotilde Povea de Romero', '144560000067', 'Cra 20 Nro 10B-12', 'Fonseca', 'La Guajira', 'mail@mail.com', '3164619810', 8, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(10, 'Escuela Mixta Emira Armenta', '244560000067', 'Cra 3 Nro 2-67', 'La Jagua del Pilar', 'La Guajira', 'mail@mail.com', '3134077030', 9, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(11, 'Sede Principal', '244560000037', 'Corregimiento del Pájaro', 'Manaure', 'La Guajira', 'mail@mail.com', '0000000000', 10, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(12, 'Escuela Rural Indígena Amaichon #1', '244560001661', 'Comunidad Amaichon', 'Manaure', 'La Guajira', 'mail@mail.com', '0000000000', 10, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(13, 'Escuela Rural Indígena Tatailamana', '244560001734', 'Corregimiento del Pájaro', 'Manaure', 'La Guajira', 'mail@mail.com', '0000000000', 10, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(14, 'Escuela Urbana Mixta Primero de Octubre', '24456000067', 'Calle 14 Nro 5-41', 'Manaure', 'La Guajira', 'mail@mail.com', '3144545651', 11, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(15, 'Sede Principal', '244560003362', 'Comunidad Kanaan', 'Manaure', 'La Guajira', 'mail@mail.com', '3214537196', 12, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(16, 'Sede Principal', '244560004253', 'Rancheria Ishashimana', 'Manaure', 'La Guajira', 'mail@mail.com', '3154144725', 13, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(17, 'Escuela Rural Indigena Chojonchon', '244560003478', 'Rancheria Chojonchon', 'Manaure', 'La Guajira', 'mail@mail.com', '3008052296', 13, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(18, 'Escuela Urbana Santa Rita de Cassia', '2445600000211', 'Calle 2 N 8-50', 'Manaure', 'La Guajira', 'mail@mail.com', '3002781670', 14, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(19, 'Sede Principal', '244560000151', 'Corregimiento Mayapo', 'Manaure', 'La Guajira', 'mail@mail.com', '3114114457', 15, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(20, 'Escuela Rural Indígena Manzana', '244560000568', 'Corregimiento Mayapo', 'Manaure', 'La Guajira', 'mail@mail.com', '3216975095', 15, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(21, 'Escuela Rural Indígena Iyospa', '244560002196', 'Ranchería Fatima', 'Manaure', 'La Guajira', 'mail@mail.com', '3163849660', 16, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(22, 'Escuela Rural Indígena Ricardo Gomez', '244560000681', 'Caraca Ruleya', 'Manaure', 'La Guajira', 'mail@mail.com', '3135618416', 16, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(23, 'Sede Principal', '244560003834', 'Ranchería Maracari', 'Manaure', 'La Guajira', 'mail@mail.com', '3135905197', 17, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(24, 'Sede El pasito', '3004215140', 'Comunidad El Pasito', 'Riohacha', 'La Guajira', 'mail@mail.com', '3004215140', 19, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(25, 'Sede Paraver', '244001003514', 'Comunidad Paraver', 'Riohacha', 'La Guajira', 'mail@mail.com', '3106120762', 20, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(26, 'Sede Kousachon', '24400001005011', 'Comunidad Kousachon', 'Riohacha', 'La Guajira', 'mail@mail.com', '3008052296', 18, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(27, 'Sede Mañature', '244001004529', 'Resguardo Mañature', 'Riohacha', 'La Guajira', 'mail@mail.com', '0000000000', 21, '2022-08-05 19:19:07', '2022-08-05 19:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(47, '2014_10_12_000000_create_users_table', 1),
(48, '2014_10_12_100000_create_password_resets_table', 1),
(49, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(50, '2019_08_19_000000_create_failed_jobs_table', 1),
(51, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(52, '2020_05_21_100000_create_teams_table', 1),
(53, '2020_05_21_200000_create_team_user_table', 1),
(54, '2022_05_16_155419_create_sessions_table', 1),
(55, '2022_05_16_200809_create_permission_tables', 1),
(56, '2022_05_16_201119_create_products_table', 1),
(57, '2022_05_24_000547_create_establishments_table', 1),
(58, '2022_05_25_203535_create_headquarters_table', 1),
(59, '2022_05_25_232340_create_people_table', 1),
(60, '2022_05_29_203935_create_posts_table', 1),
(61, '2022_05_30_140729_create_years_table', 1),
(62, '2022_06_01_140047_create_study_plans_table', 1),
(63, '2022_06_01_151122_create_areas_table', 1),
(64, '2022_06_01_151255_create_subjects_table', 1),
(65, '2022_06_01_202505_create_area_plans_table', 1),
(66, '2022_06_01_202654_create_subject_teachers_table', 1),
(67, '2022_06_06_113248_create_works_table', 1),
(68, '2022_06_07_113027_create_tracings_table', 1),
(69, '2022_07_19_171609_create_qr_codes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `identification_type` varchar(255) DEFAULT NULL,
  `identification_number` varchar(255) DEFAULT NULL,
  `birthday_date` varchar(255) DEFAULT NULL,
  `ethnic_group` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `person_type` varchar(255) NOT NULL,
  `attended_by` bigint(20) UNSIGNED DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `establishment_id` bigint(20) UNSIGNED NOT NULL,
  `headquarter_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `surname`, `gender`, `identification_type`, `identification_number`, `birthday_date`, `ethnic_group`, `email`, `phone`, `blood_type`, `person_type`, `attended_by`, `relationship`, `department`, `municipality`, `direction`, `profile_photo_path`, `establishment_id`, `headquarter_id`, `created_at`, `updated_at`) VALUES
(9, 'luis elisander', 'cotes pushaina', 'Masculino', 'CC', '84035273', '1969-08-03', 'Comunidades indígenas', 'eliyei2012@hotmail.com', '3133213066', 'B+', 'Director', NULL, NULL, 'La Guajira', 'Riohacha', 'calle 3A N° 6 ESTE 43', NULL, 19, 24, '2022-10-10 21:02:44', '2022-10-10 21:02:44'),
(10, 'omar enrique', 'López Iguaran', 'Masculino', 'CC', '84077526', '1976-10-25', 'Comunidades indígenas', 'oelopez21@hotmail.com', '3226497319', 'A+', 'Coordinador', NULL, NULL, 'La Guajira', 'Riohacha', 'carrera 7A # 17- 45', NULL, 19, 24, '2022-10-10 21:45:07', '2022-10-10 21:45:07'),
(11, 'Jhon Jairo', 'Rodríguez', 'Masculino', 'CC', '17858544', '1973-05-22', 'Comunidades indígenas', 'sanrafaeldelpajaro@yahoo.com', '3135587488', 'O+', 'Rector', NULL, NULL, 'La Guajira', 'Manaure', 'Rancheria la Paz', 'person/person-image-1665420456.jpeg', 10, 11, '2022-10-10 21:47:37', '2022-10-10 21:47:37'),
(12, 'Celso', 'Hernández', 'Masculino', 'CC', '84029922', '2008-12-16', 'Comunidades indígenas', 'herespelta2709@gmail.com', '3164567155', 'O+', 'Director', NULL, NULL, 'La Guajira', 'Riohacha', 'Calle 17 N 1 143', NULL, 20, 25, '2022-10-10 23:46:43', '2022-10-10 23:46:43'),
(13, 'luisa maría', 'socarras Mendoza', 'Femenino', 'CC', '40931864', '1972-12-08', 'Comunidades indígenas', 'lumasome2013@hotmail.com', '3205688024', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha', 'carrera 12B # 33-50', NULL, 19, 24, '2022-10-11 00:35:39', '2022-10-11 00:35:39'),
(14, 'dulce maria', 'Mendoza', 'Femenino', 'CC', '40929954', '1975-04-28', 'Comunidades indígenas', 'dulcemendoza@uniguajira.edu.co', '3126626876', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha', 'carrera 8 # 34B-66', NULL, 19, 24, '2022-10-11 00:42:00', '2022-10-11 00:42:00'),
(15, 'Edilberto Manuel', 'Prasca Uriana', 'Masculino', 'CC', '84078862', '1973-04-05', 'Comunidades indígenas', 'Edilbertoprasca@yahoo.com', '3002781670', 'O+', 'Rector', NULL, NULL, 'La Guajira', 'Manaure', 'Calle 6 N.8-85', 'person/person-image-1665439142.jpg', 14, 18, '2022-10-11 02:59:02', '2022-10-11 02:59:02'),
(16, 'Over', 'Cárdenas Gutiérrez', 'Masculino', 'CC', '1124414347', '1996-09-09', 'Comunidades indígenas', 'overcardenasgutierrez@gmail.com', '3004048823', 'B+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'Calle 1 número 12-72', 'person/person-image-1665494886.jpg', 14, 18, '2022-10-11 18:28:06', '2022-10-11 18:28:06'),
(17, 'Eider', 'Castellar', 'Masculino', 'CC', '1143341656', '1990-03-27', 'Comunidades indígenas', 'eidercastellar48@gmail.com', '3005691513', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'carrera 2 # 9-57', 'person/person-image-1665495034.jpg', 14, 18, '2022-10-11 18:30:34', '2022-10-11 18:30:34'),
(18, 'Francisco Javier', 'Restrepo Arroyave', 'Masculino', 'CC', '14795987', '1982-11-02', 'Comunidad Raizal', 'cerba.campana@gmail.com', '3104113246', 'O+', 'Director', NULL, NULL, 'La Guajira', 'Dibulla', 'Carrera 4 # 3-48', NULL, 6, 6, '2022-10-11 18:35:59', '2022-10-11 18:35:59'),
(19, 'GUILLERMO', 'SOTO TORRES', 'Masculino', 'CC', '79718762', '1975-07-22', 'Comunidad Raizal', 'guillermosototorres@yahoo.es', '3233215245', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Dibulla', 'Calle 3 # 3 - 11', 'person/person-image-1665499057.jpg', 6, 6, '2022-10-11 19:37:37', '2022-10-11 19:37:37'),
(20, 'Leydis Dallana', 'Julio González', 'Femenino', 'CC', '1094249317', '1990-03-06', 'Comunidades afrocolombianas', 'leydisdayana@hotmail.com', '3008604562', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha', 'Cr 28#27a-55', NULL, 6, 6, '2022-10-12 02:08:48', '2022-10-12 02:08:48'),
(21, 'amilkar de jesus', 'gamez ipuana', 'Masculino', 'CC', '1124370560', '1987-11-04', 'Comunidades indígenas', 'amilkargamez11|@hotmail.es', '3214537196', 'O+', 'Director', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad lamana', NULL, 12, 15, '2022-10-12 04:11:03', '2022-10-12 04:11:03'),
(22, 'sofi', 'marin ipuana', 'Femenino', 'CC', '1118834369', '1990-11-24', 'Comunidades indígenas', 'sofimarin24@gmail.com', '3205715813', 'O+', 'Coordinador', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad de lamana', NULL, 12, 15, '2022-10-12 04:38:10', '2022-10-12 04:38:10'),
(23, 'diba patricia', 'jusayu zambrano', 'Femenino', 'CC', '1124369505', '1987-08-17', 'Comunidades indígenas', 'bjusayusambaramo@gmail.com', '3127381925', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad de lamana', NULL, 12, 15, '2022-10-12 04:44:34', '2022-10-12 04:44:34'),
(24, 'keider', 'ipuana epinayu', 'Masculino', 'CC', '1124382764', '1989-12-06', 'Comunidades indígenas', 'keideripu@gmail.com', '3157395617', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'comunidad de lamana', NULL, 12, 15, '2022-10-12 04:47:18', '2022-10-12 04:47:18'),
(25, 'Romelia María', 'Floriano Jiménez', 'Femenino', 'CC', '60395182', '1978-12-26', 'Comunidades afrocolombianas', 'janckerandrey@hotmail.com', '3043875778', 'B+', 'Docente', NULL, NULL, 'La Guajira', 'Riohacha', 'Carrera 6 A # 20 A 23', 'person/person-image-1665577193.jpg', 6, 6, '2022-10-12 17:19:53', '2022-10-12 17:19:53'),
(26, 'yakelina', 'benjumea', 'Femenino', 'CC', '1118817335', '1981-07-25', 'Comunidades indígenas', 'benjumeayakelina@gmail.com', '3207643627', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha', 'barrio villa Fátima', NULL, 19, 24, '2022-10-12 18:30:02', '2022-10-12 18:30:02'),
(27, 'elizabeht', 'cotes larrada', 'Femenino', 'CC', '1006617521', '1980-05-29', 'Comunidades indígenas', 'nicolbonivento123@gmail.com', '3208166804', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha', 'calle 20 # 5B-20', NULL, 19, 24, '2022-10-12 18:32:58', '2022-10-12 18:32:58'),
(28, 'claudia maria', 'cotes pusahina', 'Femenino', 'CC', '40944743', '1985-02-14', 'Comunidades indígenas', 'ccotes@uniguajira.edu.com', '3042151402', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha', 'comunidad indigena el pasito', NULL, 19, 24, '2022-10-12 18:37:38', '2022-10-12 18:37:38'),
(29, 'amis daniela', 'gouriyu benjumea', 'Femenino', 'TI', '1118838238', '2009-08-24', 'Comunidades indígenas', 'benjumeayakelin@gmail.com', '3207643627', 'B+', 'Estudiante', 26, 'Madre', 'La Guajira', 'Riohacha', 'barrio villa fatima', NULL, 19, 24, '2022-10-12 18:41:29', '2022-10-12 18:41:29'),
(30, 'antonela maria', 'jimenez cotes', 'Femenino', 'TI', '1119396370', '2010-03-18', 'Comunidades indígenas', 'anbonivento@uniguajira.edu.co', '3208166804', 'B+', 'Estudiante', 27, 'Madre', 'La Guajira', 'Riohacha', 'calle 20 #5B-20', NULL, 19, 24, '2022-10-12 18:50:33', '2022-10-12 18:50:33'),
(31, 'Luna  Talhietg', 'Cotes Cotes', 'Femenino', 'TI', '1139325527', '2012-05-22', 'Comunidades indígenas', 'ccotes@uniguajira.edu.co', '3042151402', 'B+', 'Acudiente', NULL, NULL, 'La Guajira', 'Riohacha', 'comunidad el pasito', NULL, 19, 24, '2022-10-12 18:57:02', '2022-10-12 18:57:02'),
(32, 'orlys ademir', 'cotes epiayu', 'Masculino', 'CC', '1118850277', '1996-04-07', 'Comunidades indígenas', 'orlytronik@gmail.com', '3172447452', 'B+', 'Administrativo', NULL, NULL, 'La Guajira', 'Riohacha', 'calle 3A # 6 ESTE 43', NULL, 19, 24, '2022-10-12 19:16:33', '2022-10-12 19:16:33'),
(33, 'César Hernando', 'Benítez Pérez', 'Masculino', 'CC', '92533226', '1979-02-04', 'Comunidades afrocolombianas', 'cbenitezp@uniguajira.edu.co', '3114292269', 'A+', 'Coordinador', NULL, NULL, 'La Guajira', 'Dibulla', 'Cra 3A # 15A - 20', NULL, 5, 5, '2022-10-14 00:09:43', '2022-10-14 00:09:43'),
(34, 'Franklin Omar', 'Alarcón Mengual', 'Masculino', 'CC', '84035910', '1971-10-22', 'Comunidades indígenas', 'falarconmengual@yahoo.es', '3213516548', 'O+', 'Docente', NULL, NULL, 'La Guajira', 'Manaure', 'Calle 2#1~105 el Pájaro', NULL, 10, 11, '2022-10-14 22:10:18', '2022-10-14 22:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'Crear rol', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(3, 'Edit rol', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(4, 'Ver user', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(5, 'Ver persona', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(6, 'Ver rol', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(7, 'Ver permisos', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(8, 'Edit persona', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(9, 'Eliminar persona', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(10, 'Crear persona', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(11, 'Asignar permisos', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(12, 'Get permisos', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(13, 'Eliminar rol', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(14, 'Asignar roles', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(15, 'Quitar roles', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(16, 'Crear qrcode', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(17, 'Ver qrcode', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(18, 'Editar qrcode', 'sanctum', '2022-08-06 21:55:53', '2022-08-06 21:55:53'),
(20, 'Ver dashboard', 'sanctum', '2022-08-09 09:52:28', '2022-08-09 09:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consecutive` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'inactive',
  `description` varchar(255) DEFAULT NULL,
  `photo_path` text DEFAULT NULL,
  `establishment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `headquarters_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `consecutive`, `status`, `description`, `photo_path`, `establishment_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(1, 'CONV005-000356', 'active', '<p class=\"secondary--text font-weight-bold\">Centro de Desarrollo tecnológico</p>\n<ul>\n<li>Torre de 9 Metros Autosoportada</li>\n<li>Tipo de enlace: Fibra Óptica</li>\n</ul><p><br></p>', NULL, NULL, NULL, NULL, NULL),
(2, 'CONV005-000141', 'active', '<ul><li> Torre de 21 metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 1, 1, NULL, '2022-08-07 03:31:26'),
(3, 'CONV005-000898', 'active', '<ul><li> Torre de 42 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 2, 2, NULL, '2022-08-07 09:48:44'),
(4, 'CONV005-000052', 'active', '<ul><li> Torre de 42 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 3, 3, NULL, '2022-08-07 09:49:28'),
(5, 'CONV005-000553', 'active', '<ul><li> Torre de 30 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con Escuela Tomas Emilio Medina Curiel</li></ul><p><br></p>', 'null', 4, 4, NULL, '2022-08-07 09:44:19'),
(6, 'CONV005-000143', 'active', '<ul><li> Torre de 30 Metros Riendada</li><li>Tipo de  Enlace: Fibra Óptica </li></ul><p><br></p>', 'null', 5, 5, NULL, '2022-08-07 09:46:03'),
(7, 'CONV005-000091', 'active', '<ul><li> Torre de 42 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con Escuela Siete de Junio -- Mingueo</li></ul><p><br></p>', 'null', 6, 6, NULL, '2022-08-07 09:50:49'),
(8, 'CONV005-000661', 'active', '<ul><li> Torre de 21 Metros Autosoportada</li><li>Tipo de  Enlace: Radio-Enlace con Escuela Cleotilde Povea de Romero</li></ul><p><br></p>', 'null', 8, 8, NULL, '2022-08-07 08:51:58'),
(9, 'CONV005-000130', 'active', '<ul><li> Torre de 42 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 21, 27, NULL, '2022-08-07 09:51:20'),
(10, 'CONV005-000176', 'active', '<ul><li> Torre de 30 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 18, 26, NULL, '2022-08-07 09:42:28'),
(11, 'CONV005-000140', 'active', '<ul><li> Torre de 30 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 20, 25, NULL, '2022-08-07 09:42:58'),
(12, 'CONV005-000175', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 19, 24, NULL, '2022-08-07 04:07:16'),
(13, 'CONV005-000148', 'active', '<ul><li>Torre de 21 Metros Riendada</li><li>Tipo de enlace: Radio-Enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 17, 23, NULL, '2022-08-07 05:11:50'),
(14, 'CONV005-000146', 'active', '<ul><li> Torre de 30 Metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 16, 22, NULL, '2022-08-07 09:41:27'),
(15, 'CONV005-000142', 'active', '<ul><li> Torre de 30 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 16, 21, NULL, '2022-08-07 09:03:02'),
(16, 'CONV005-000149', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 15, 20, NULL, '2022-08-08 21:03:28'),
(17, 'CONV005-000900', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 15, 19, NULL, '2022-08-07 04:09:29'),
(18, 'CONV005-000899', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 14, 18, NULL, '2022-08-07 04:14:01'),
(19, 'CONV005-000127', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo Escuela Santa Rita de Cassia.</li></ul><p><br></p>', 'null', 13, 17, NULL, '2022-08-08 21:12:00'),
(20, 'CONV005-000897', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo Escuela Santa Rita de Cassia.</li></ul><p><br></p>', 'null', 13, 16, NULL, '2022-08-08 21:10:56'),
(21, 'CONV005-000993', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 12, 15, NULL, '2022-08-07 04:16:36'),
(22, 'CONV005-000555', 'active', '<ul><li> Torre de 9 Metros Autosoportada</li><li>Tipo de  Enlace: Radio-enlace con nodo Escuela Santa Rita de Cassia</li></ul>', 'null', 11, 14, NULL, '2022-08-09 00:45:17'),
(23, 'CONV005-000147', 'active', '<ul><li> Torre de 21 metros Riendada</li><li>Tipo de  Enlace: Radio-enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 10, 13, NULL, '2022-08-07 04:55:02'),
(24, 'CONV005-000554', 'active', '<ul><li> Torre de 21 Metros Riendada</li><li>Tipo de  Enlace: Radio enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 10, 12, NULL, '2022-08-07 04:11:33'),
(25, 'CONV005-000917', 'active', '<ul><li> Torre de 21 Metros Autosoportada</li><li>Tipo de  Enlace: Radio-Enlace con nodo principal Ceindetec</li></ul><p><br></p>', 'null', 10, 11, NULL, '2022-08-08 21:15:00'),
(26, 'CONV005-000916', 'active', '<ul><li> Torre de 21 Metros Autosoportada</li><li>Tipo de  Enlace: Radioenlace con nodo Externo</li></ul>', 'null', 9, 10, NULL, '2022-08-09 00:39:34'),
(27, 'CONV005-000915', 'active', '<ul><li> Torre de 21 Metros Autosoportada</li><li>Tipo de  Enlace: Enlace por Fibra óptica</li></ul><p><br></p>', 'null', 8, 9, NULL, '2022-08-07 08:50:09'),
(28, 'CONV005-001000', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(29, 'CONV005-001001', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(30, 'CONV005-001002', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(31, 'CONV005-001003', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(32, 'CONV005-001004', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(33, 'CONV005-001005', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(34, 'CONV005-001006', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(35, 'CONV005-001007', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(36, 'CONV005-001008', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(37, 'CONV005-001009', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(38, 'CONV005-001010', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(39, 'CONV005-001011', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(40, 'CONV005-001012', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(41, 'CONV005-001013', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(42, 'CONV005-001014', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(43, 'CONV005-001015', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(44, 'CONV005-001016', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(45, 'CONV005-001017', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(46, 'CONV005-001018', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(47, 'CONV005-001019', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(48, 'CONV005-001020', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(49, 'CONV005-001021', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(50, 'CONV005-001022', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(51, 'CONV005-001023', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(52, 'CONV005-001024', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(53, 'CONV005-001025', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(54, 'CONV005-001026', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(55, 'CONV005-001027', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(56, 'CONV005-001028', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(57, 'CONV005-001029', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(58, 'CONV005-001030', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(59, 'CONV005-001031', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(60, 'CONV005-001032', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(61, 'CONV005-001033', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(62, 'CONV005-001034', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(63, 'CONV005-001035', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(64, 'CONV005-001036', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(65, 'CONV005-001037', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(66, 'CONV005-001038', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(67, 'CONV005-001039', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(68, 'CONV005-001040', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(69, 'CONV005-001041', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(70, 'CONV005-001042', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(71, 'CONV005-001043', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(72, 'CONV005-001044', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(73, 'CONV005-001045', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(74, 'CONV005-001046', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(75, 'CONV005-001047', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(76, 'CONV005-001048', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(77, 'CONV005-001049', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(78, 'CONV005-001050', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(79, 'CONV005-001051', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(80, 'CONV005-001052', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(81, 'CONV005-001053', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(82, 'CONV005-001054', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(83, 'CONV005-001055', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(84, 'CONV005-001056', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(85, 'CONV005-001057', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(86, 'CONV005-001058', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(87, 'CONV005-001059', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(88, 'CONV005-001060', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(89, 'CONV005-001061', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(90, 'CONV005-001062', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(91, 'CONV005-001063', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(92, 'CONV005-001064', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(93, 'CONV005-001065', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(94, 'CONV005-001066', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(95, 'CONV005-001067', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(96, 'CONV005-001068', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(97, 'CONV005-001069', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(98, 'CONV005-001070', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(99, 'CONV005-001071', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(100, 'CONV005-001072', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(101, 'CONV005-001073', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(102, 'CONV005-001074', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(103, 'CONV005-001075', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(104, 'CONV005-001076', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(105, 'CONV005-001077', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(106, 'CONV005-001078', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(107, 'CONV005-001079', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(108, 'CONV005-001080', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(109, 'CONV005-001081', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(110, 'CONV005-001082', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(111, 'CONV005-001083', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(112, 'CONV005-001084', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(113, 'CONV005-001085', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(114, 'CONV005-001086', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(115, 'CONV005-001087', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(116, 'CONV005-001088', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(117, 'CONV005-001089', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(118, 'CONV005-001090', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(119, 'CONV005-001091', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(120, 'CONV005-001092', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(121, 'CONV005-001093', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(122, 'CONV005-001094', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(123, 'CONV005-001095', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(124, 'CONV005-001096', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(125, 'CONV005-001097', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(126, 'CONV005-001098', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(127, 'CONV005-001099', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(128, 'CONV005-001100', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(129, 'CONV005-001101', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(130, 'CONV005-001102', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(131, 'CONV005-001103', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(132, 'CONV005-001104', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(133, 'CONV005-001105', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(134, 'CONV005-001106', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(135, 'CONV005-001107', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(136, 'CONV005-001108', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(137, 'CONV005-001109', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(138, 'CONV005-001110', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(139, 'CONV005-001111', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(140, 'CONV005-001112', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(141, 'CONV005-001113', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(142, 'CONV005-001114', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(143, 'CONV005-001115', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(144, 'CONV005-001116', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(145, 'CONV005-001117', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(146, 'CONV005-001118', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(147, 'CONV005-001119', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(148, 'CONV005-001120', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(149, 'CONV005-001121', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(150, 'CONV005-001122', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(151, 'CONV005-001123', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(152, 'CONV005-001124', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(153, 'CONV005-001125', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(154, 'CONV005-001126', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(155, 'CONV005-001127', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(156, 'CONV005-001128', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(157, 'CONV005-001129', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(158, 'CONV005-001130', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(159, 'CONV005-001131', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(160, 'CONV005-001132', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(161, 'CONV005-001133', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(162, 'CONV005-001134', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(163, 'CONV005-001135', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(164, 'CONV005-001136', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(165, 'CONV005-001137', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(166, 'CONV005-001138', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(167, 'CONV005-001139', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(168, 'CONV005-001140', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(169, 'CONV005-001141', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(170, 'CONV005-001142', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(171, 'CONV005-001143', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(172, 'CONV005-001144', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(173, 'CONV005-001145', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(174, 'CONV005-001146', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(175, 'CONV005-001147', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(176, 'CONV005-001148', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(177, 'CONV005-001149', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(178, 'CONV005-001150', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(179, 'CONV005-001151', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(180, 'CONV005-001152', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(181, 'CONV005-001153', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(182, 'CONV005-001154', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(183, 'CONV005-001155', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(184, 'CONV005-001156', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(185, 'CONV005-001157', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(186, 'CONV005-001158', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(187, 'CONV005-001159', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(188, 'CONV005-001160', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(189, 'CONV005-001161', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(190, 'CONV005-001162', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(191, 'CONV005-001163', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(192, 'CONV005-001164', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(193, 'CONV005-001165', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(194, 'CONV005-001166', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(195, 'CONV005-001167', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(196, 'CONV005-001168', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(197, 'CONV005-001169', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(198, 'CONV005-001170', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(199, 'CONV005-001171', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(200, 'CONV005-001172', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(201, 'CONV005-001173', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(202, 'CONV005-001174', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(203, 'CONV005-001175', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(204, 'CONV005-001176', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(205, 'CONV005-001177', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(206, 'CONV005-001178', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(207, 'CONV005-001179', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(208, 'CONV005-001180', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(209, 'CONV005-001181', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(210, 'CONV005-001182', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(211, 'CONV005-001183', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(212, 'CONV005-001184', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(213, 'CONV005-001185', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(214, 'CONV005-001186', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(215, 'CONV005-001187', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(216, 'CONV005-001188', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(217, 'CONV005-001189', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(218, 'CONV005-001190', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(219, 'CONV005-001191', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(220, 'CONV005-001192', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(221, 'CONV005-001193', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(222, 'CONV005-001194', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(223, 'CONV005-001195', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(224, 'CONV005-001196', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(225, 'CONV005-001197', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(226, 'CONV005-001198', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(227, 'CONV005-001199', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(228, 'CONV005-001200', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(229, 'CONV005-001201', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(230, 'CONV005-001202', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(231, 'CONV005-001203', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(232, 'CONV005-001204', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(233, 'CONV005-001205', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(234, 'CONV005-001206', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(235, 'CONV005-001207', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(236, 'CONV005-001208', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(237, 'CONV005-001209', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(238, 'CONV005-001210', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(239, 'CONV005-001211', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(240, 'CONV005-001212', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(241, 'CONV005-001213', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(242, 'CONV005-001214', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(243, 'CONV005-001215', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(244, 'CONV005-001216', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(245, 'CONV005-001217', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(246, 'CONV005-001218', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(247, 'CONV005-001219', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(248, 'CONV005-001220', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(249, 'CONV005-001221', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(250, 'CONV005-001222', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(251, 'CONV005-001223', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(252, 'CONV005-001224', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(253, 'CONV005-001225', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(254, 'CONV005-001226', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(255, 'CONV005-001227', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(256, 'CONV005-001228', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(257, 'CONV005-001229', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(258, 'CONV005-001230', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(259, 'CONV005-001231', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(260, 'CONV005-001232', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(261, 'CONV005-001233', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(262, 'CONV005-001234', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(263, 'CONV005-001235', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(264, 'CONV005-001236', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(265, 'CONV005-001237', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(266, 'CONV005-001238', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(267, 'CONV005-001239', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(268, 'CONV005-001240', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(269, 'CONV005-001241', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(270, 'CONV005-001242', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(271, 'CONV005-001243', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(272, 'CONV005-001244', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(273, 'CONV005-001245', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(274, 'CONV005-001246', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(275, 'CONV005-001247', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(276, 'CONV005-001248', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(277, 'CONV005-001249', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(278, 'CONV005-001250', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(279, 'CONV005-001251', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(280, 'CONV005-001252', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(281, 'CONV005-001253', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(282, 'CONV005-001254', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(283, 'CONV005-001255', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(284, 'CONV005-001256', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(285, 'CONV005-001257', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(286, 'CONV005-001258', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(287, 'CONV005-001259', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(288, 'CONV005-001260', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(289, 'CONV005-001261', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(290, 'CONV005-001262', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(291, 'CONV005-001263', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(292, 'CONV005-001264', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(293, 'CONV005-001265', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(294, 'CONV005-001266', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(295, 'CONV005-001267', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(296, 'CONV005-001268', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(297, 'CONV005-001269', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(298, 'CONV005-001270', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(299, 'CONV005-001271', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(300, 'CONV005-001272', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(301, 'CONV005-001273', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(302, 'CONV005-001274', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(303, 'CONV005-001275', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(304, 'CONV005-001276', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(305, 'CONV005-001277', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(306, 'CONV005-001278', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(307, 'CONV005-001279', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(308, 'CONV005-001280', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(309, 'CONV005-001281', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(310, 'CONV005-001282', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(311, 'CONV005-001283', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(312, 'CONV005-001284', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(313, 'CONV005-001285', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(314, 'CONV005-001286', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(315, 'CONV005-001287', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(316, 'CONV005-001288', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(317, 'CONV005-001289', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(318, 'CONV005-001290', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(319, 'CONV005-001291', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(320, 'CONV005-001292', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(321, 'CONV005-001293', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(322, 'CONV005-001294', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(323, 'CONV005-001295', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(324, 'CONV005-001296', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(325, 'CONV005-001297', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(326, 'CONV005-001298', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(327, 'CONV005-001299', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(328, 'CONV005-001300', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(329, 'CONV005-001301', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(330, 'CONV005-001302', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(331, 'CONV005-001303', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(332, 'CONV005-001304', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(333, 'CONV005-001305', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(334, 'CONV005-001306', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(335, 'CONV005-001307', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(336, 'CONV005-001308', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(337, 'CONV005-001309', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(338, 'CONV005-001310', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(339, 'CONV005-001311', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(340, 'CONV005-001312', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(341, 'CONV005-001313', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(342, 'CONV005-001314', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(343, 'CONV005-001315', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(344, 'CONV005-001316', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(345, 'CONV005-001317', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(346, 'CONV005-001318', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(347, 'CONV005-001319', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(348, 'CONV005-001320', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(349, 'CONV005-001321', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(350, 'CONV005-001322', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(351, 'CONV005-001323', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(352, 'CONV005-001324', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(353, 'CONV005-001325', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(354, 'CONV005-001326', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(355, 'CONV005-001327', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(356, 'CONV005-001328', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(357, 'CONV005-001329', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(358, 'CONV005-001330', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(359, 'CONV005-001331', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(360, 'CONV005-001332', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(361, 'CONV005-001333', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(362, 'CONV005-001334', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(363, 'CONV005-001335', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(364, 'CONV005-001336', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(365, 'CONV005-001337', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(366, 'CONV005-001338', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(367, 'CONV005-001339', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(368, 'CONV005-001340', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(369, 'CONV005-001341', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(370, 'CONV005-001342', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(371, 'CONV005-001343', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(372, 'CONV005-001344', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(373, 'CONV005-001345', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(374, 'CONV005-001346', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(375, 'CONV005-001347', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(376, 'CONV005-001348', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(377, 'CONV005-001349', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(378, 'CONV005-001350', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(379, 'CONV005-001351', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(380, 'CONV005-001352', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(381, 'CONV005-001353', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(382, 'CONV005-001354', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(383, 'CONV005-001355', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(384, 'CONV005-001356', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(385, 'CONV005-001357', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(386, 'CONV005-001358', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(387, 'CONV005-001359', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(388, 'CONV005-001360', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(389, 'CONV005-001361', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(390, 'CONV005-001362', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(391, 'CONV005-001363', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(392, 'CONV005-001364', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(393, 'CONV005-001365', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(394, 'CONV005-001366', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(395, 'CONV005-001367', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(396, 'CONV005-001368', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(397, 'CONV005-001369', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(398, 'CONV005-001370', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(399, 'CONV005-001371', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(400, 'CONV005-001372', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(401, 'CONV005-001373', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(402, 'CONV005-001374', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(403, 'CONV005-001375', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(404, 'CONV005-001376', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(405, 'CONV005-001377', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(406, 'CONV005-001378', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(407, 'CONV005-001379', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(408, 'CONV005-001380', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(409, 'CONV005-001381', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(410, 'CONV005-001382', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(411, 'CONV005-001383', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(412, 'CONV005-001384', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(413, 'CONV005-001385', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(414, 'CONV005-001386', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(415, 'CONV005-001387', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(416, 'CONV005-001388', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(417, 'CONV005-001389', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(418, 'CONV005-001390', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(419, 'CONV005-001391', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(420, 'CONV005-001392', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(421, 'CONV005-001393', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(422, 'CONV005-001394', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(423, 'CONV005-001395', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(424, 'CONV005-001396', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(425, 'CONV005-001397', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(426, 'CONV005-001398', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(427, 'CONV005-001399', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(428, 'CONV005-001400', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(429, 'CONV005-001401', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(430, 'CONV005-001402', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(431, 'CONV005-001403', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(432, 'CONV005-001404', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(433, 'CONV005-001405', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(434, 'CONV005-001406', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(435, 'CONV005-001407', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(436, 'CONV005-001408', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(437, 'CONV005-001409', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(438, 'CONV005-001410', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(439, 'CONV005-001411', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(440, 'CONV005-001412', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(441, 'CONV005-001413', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(442, 'CONV005-001414', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(443, 'CONV005-001415', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(444, 'CONV005-001416', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(445, 'CONV005-001417', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(446, 'CONV005-001418', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(447, 'CONV005-001419', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(448, 'CONV005-001420', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(449, 'CONV005-001421', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42');
INSERT INTO `qr_codes` (`id`, `consecutive`, `status`, `description`, `photo_path`, `establishment_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(450, 'CONV005-001422', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(451, 'CONV005-001423', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(452, 'CONV005-001424', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(453, 'CONV005-001425', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(454, 'CONV005-001426', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(455, 'CONV005-001427', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(456, 'CONV005-001428', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(457, 'CONV005-001429', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(458, 'CONV005-001430', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(459, 'CONV005-001431', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(460, 'CONV005-001432', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(461, 'CONV005-001433', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(462, 'CONV005-001434', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(463, 'CONV005-001435', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(464, 'CONV005-001436', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(465, 'CONV005-001437', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(466, 'CONV005-001438', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(467, 'CONV005-001439', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(468, 'CONV005-001440', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(469, 'CONV005-001441', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(470, 'CONV005-001442', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(471, 'CONV005-001443', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(472, 'CONV005-001444', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(473, 'CONV005-001445', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(474, 'CONV005-001446', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(475, 'CONV005-001447', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(476, 'CONV005-001448', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(477, 'CONV005-001449', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(478, 'CONV005-001450', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(479, 'CONV005-001451', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(480, 'CONV005-001452', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(481, 'CONV005-001453', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(482, 'CONV005-001454', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(483, 'CONV005-001455', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(484, 'CONV005-001456', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(485, 'CONV005-001457', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(486, 'CONV005-001458', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(487, 'CONV005-001459', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(488, 'CONV005-001460', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(489, 'CONV005-001461', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(490, 'CONV005-001462', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(491, 'CONV005-001463', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(492, 'CONV005-001464', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(493, 'CONV005-001465', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(494, 'CONV005-001466', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(495, 'CONV005-001467', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(496, 'CONV005-001468', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(497, 'CONV005-001469', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(498, 'CONV005-001470', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(499, 'CONV005-001471', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(500, 'CONV005-001472', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(501, 'CONV005-001473', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(502, 'CONV005-001474', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(503, 'CONV005-001475', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(504, 'CONV005-001476', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(505, 'CONV005-001477', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(506, 'CONV005-001478', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(507, 'CONV005-001479', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(508, 'CONV005-001480', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(509, 'CONV005-001481', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(510, 'CONV005-001482', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(511, 'CONV005-001483', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(512, 'CONV005-001484', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(513, 'CONV005-001485', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(514, 'CONV005-001486', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(515, 'CONV005-001487', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(516, 'CONV005-001488', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(517, 'CONV005-001489', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(518, 'CONV005-001490', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(519, 'CONV005-001491', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(520, 'CONV005-001492', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(521, 'CONV005-001493', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(522, 'CONV005-001494', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(523, 'CONV005-001495', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(524, 'CONV005-001496', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(525, 'CONV005-001497', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(526, 'CONV005-001498', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(527, 'CONV005-001499', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(528, 'CONV005-001500', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(529, 'CONV005-001501', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(530, 'CONV005-001502', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(531, 'CONV005-001503', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(532, 'CONV005-001504', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(533, 'CONV005-001505', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(534, 'CONV005-001506', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(535, 'CONV005-001507', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(536, 'CONV005-001508', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(537, 'CONV005-001509', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(538, 'CONV005-001510', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(539, 'CONV005-001511', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(540, 'CONV005-001512', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(541, 'CONV005-001513', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(542, 'CONV005-001514', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(543, 'CONV005-001515', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(544, 'CONV005-001516', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(545, 'CONV005-001517', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(546, 'CONV005-001518', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(547, 'CONV005-001519', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(548, 'CONV005-001520', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(549, 'CONV005-001521', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(550, 'CONV005-001522', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(551, 'CONV005-001523', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(552, 'CONV005-001524', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(553, 'CONV005-001525', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(554, 'CONV005-001526', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(555, 'CONV005-001527', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(556, 'CONV005-001528', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(557, 'CONV005-001529', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(558, 'CONV005-001530', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(559, 'CONV005-001531', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(560, 'CONV005-001532', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(561, 'CONV005-001533', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(562, 'CONV005-001534', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(563, 'CONV005-001535', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(564, 'CONV005-001536', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(565, 'CONV005-001537', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(566, 'CONV005-001538', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(567, 'CONV005-001539', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(568, 'CONV005-001540', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(569, 'CONV005-001541', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(570, 'CONV005-001542', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(571, 'CONV005-001543', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(572, 'CONV005-001544', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(573, 'CONV005-001545', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(574, 'CONV005-001546', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(575, 'CONV005-001547', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(576, 'CONV005-001548', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(577, 'CONV005-001549', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(578, 'CONV005-001550', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(579, 'CONV005-001551', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(580, 'CONV005-001552', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(581, 'CONV005-001553', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(582, 'CONV005-001554', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(583, 'CONV005-001555', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(584, 'CONV005-001556', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(585, 'CONV005-001557', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(586, 'CONV005-001558', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(587, 'CONV005-001559', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(588, 'CONV005-001560', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(589, 'CONV005-001561', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(590, 'CONV005-001562', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(591, 'CONV005-001563', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(592, 'CONV005-001564', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(593, 'CONV005-001565', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(594, 'CONV005-001566', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(595, 'CONV005-001567', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(596, 'CONV005-001568', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(597, 'CONV005-001569', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(598, 'CONV005-001570', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(599, 'CONV005-001571', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(600, 'CONV005-001572', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(601, 'CONV005-001573', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(602, 'CONV005-001574', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(603, 'CONV005-001575', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(604, 'CONV005-001576', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(605, 'CONV005-001577', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(606, 'CONV005-001578', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(607, 'CONV005-001579', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(608, 'CONV005-001580', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(609, 'CONV005-001581', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(610, 'CONV005-001582', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(611, 'CONV005-001583', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(612, 'CONV005-001584', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(613, 'CONV005-001585', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(614, 'CONV005-001586', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(615, 'CONV005-001587', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(616, 'CONV005-001588', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(617, 'CONV005-001589', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(618, 'CONV005-001590', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(619, 'CONV005-001591', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(620, 'CONV005-001592', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(621, 'CONV005-001593', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(622, 'CONV005-001594', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(623, 'CONV005-001595', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(624, 'CONV005-001596', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(625, 'CONV005-001597', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(626, 'CONV005-001598', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(627, 'CONV005-001599', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(628, 'CONV005-001600', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(629, 'CONV005-001601', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(630, 'CONV005-001602', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(631, 'CONV005-001603', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(632, 'CONV005-001604', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(633, 'CONV005-001605', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(634, 'CONV005-001606', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(635, 'CONV005-001607', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(636, 'CONV005-001608', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(637, 'CONV005-001609', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(638, 'CONV005-001610', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(639, 'CONV005-001611', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(640, 'CONV005-001612', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(641, 'CONV005-001613', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(642, 'CONV005-001614', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(643, 'CONV005-001615', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(644, 'CONV005-001616', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(645, 'CONV005-001617', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(646, 'CONV005-001618', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(647, 'CONV005-001619', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(648, 'CONV005-001620', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(649, 'CONV005-001621', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(650, 'CONV005-001622', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(651, 'CONV005-001623', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(652, 'CONV005-001624', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(653, 'CONV005-001625', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(654, 'CONV005-001626', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(655, 'CONV005-001627', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(656, 'CONV005-001628', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(657, 'CONV005-001629', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(658, 'CONV005-001630', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(659, 'CONV005-001631', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(660, 'CONV005-001632', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(661, 'CONV005-001633', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(662, 'CONV005-001634', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(663, 'CONV005-001635', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(664, 'CONV005-001636', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(665, 'CONV005-001637', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(666, 'CONV005-001638', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(667, 'CONV005-001639', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(668, 'CONV005-001640', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(669, 'CONV005-001641', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(670, 'CONV005-001642', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(671, 'CONV005-001643', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(672, 'CONV005-001644', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(673, 'CONV005-001645', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(674, 'CONV005-001646', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(675, 'CONV005-001647', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(676, 'CONV005-001648', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(677, 'CONV005-001649', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(678, 'CONV005-001650', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(679, 'CONV005-001651', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(680, 'CONV005-001652', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(681, 'CONV005-001653', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(682, 'CONV005-001654', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(683, 'CONV005-001655', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(684, 'CONV005-001656', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(685, 'CONV005-001657', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(686, 'CONV005-001658', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(687, 'CONV005-001659', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(688, 'CONV005-001660', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(689, 'CONV005-001661', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(690, 'CONV005-001662', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(691, 'CONV005-001663', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(692, 'CONV005-001664', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(693, 'CONV005-001665', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(694, 'CONV005-001666', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(695, 'CONV005-001667', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(696, 'CONV005-001668', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(697, 'CONV005-001669', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(698, 'CONV005-001670', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(699, 'CONV005-001671', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(700, 'CONV005-001672', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(701, 'CONV005-001673', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(702, 'CONV005-001674', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(703, 'CONV005-001675', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(704, 'CONV005-001676', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(705, 'CONV005-001677', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(706, 'CONV005-001678', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(707, 'CONV005-001679', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(708, 'CONV005-001680', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(709, 'CONV005-001681', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(710, 'CONV005-001682', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(711, 'CONV005-001683', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(712, 'CONV005-001684', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(713, 'CONV005-001685', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(714, 'CONV005-001686', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(715, 'CONV005-001687', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(716, 'CONV005-001688', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(717, 'CONV005-001689', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(718, 'CONV005-001690', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(719, 'CONV005-001691', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(720, 'CONV005-001692', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(721, 'CONV005-001693', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(722, 'CONV005-001694', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(723, 'CONV005-001695', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(724, 'CONV005-001696', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(725, 'CONV005-001697', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(726, 'CONV005-001698', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(727, 'CONV005-001699', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(728, 'CONV005-001700', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(729, 'CONV005-001701', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(730, 'CONV005-001702', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(731, 'CONV005-001703', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(732, 'CONV005-001704', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(733, 'CONV005-001705', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(734, 'CONV005-001706', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(735, 'CONV005-001707', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(736, 'CONV005-001708', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(737, 'CONV005-001709', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(738, 'CONV005-001710', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(739, 'CONV005-001711', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(740, 'CONV005-001712', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(741, 'CONV005-001713', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(742, 'CONV005-001714', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(743, 'CONV005-001715', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(744, 'CONV005-001716', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(745, 'CONV005-001717', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(746, 'CONV005-001718', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(747, 'CONV005-001719', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(748, 'CONV005-001720', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(749, 'CONV005-001721', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(750, 'CONV005-001722', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(751, 'CONV005-001723', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(752, 'CONV005-001724', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(753, 'CONV005-001725', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(754, 'CONV005-001726', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(755, 'CONV005-001727', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(756, 'CONV005-001728', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(757, 'CONV005-001729', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(758, 'CONV005-001730', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(759, 'CONV005-001731', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(760, 'CONV005-001732', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(761, 'CONV005-001733', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(762, 'CONV005-001734', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(763, 'CONV005-001735', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(764, 'CONV005-001736', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(765, 'CONV005-001737', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(766, 'CONV005-001738', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(767, 'CONV005-001739', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(768, 'CONV005-001740', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(769, 'CONV005-001741', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(770, 'CONV005-001742', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(771, 'CONV005-001743', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(772, 'CONV005-001744', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(773, 'CONV005-001745', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(774, 'CONV005-001746', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(775, 'CONV005-001747', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(776, 'CONV005-001748', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(777, 'CONV005-001749', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(778, 'CONV005-001750', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(779, 'CONV005-001751', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(780, 'CONV005-001752', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(781, 'CONV005-001753', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(782, 'CONV005-001754', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(783, 'CONV005-001755', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(784, 'CONV005-001756', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(785, 'CONV005-001757', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(786, 'CONV005-001758', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(787, 'CONV005-001759', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(788, 'CONV005-001760', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(789, 'CONV005-001761', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(790, 'CONV005-001762', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(791, 'CONV005-001763', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(792, 'CONV005-001764', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(793, 'CONV005-001765', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(794, 'CONV005-001766', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(795, 'CONV005-001767', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(796, 'CONV005-001768', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(797, 'CONV005-001769', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(798, 'CONV005-001770', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(799, 'CONV005-001771', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(800, 'CONV005-001772', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(801, 'CONV005-001773', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(802, 'CONV005-001774', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(803, 'CONV005-001775', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(804, 'CONV005-001776', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(805, 'CONV005-001777', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(806, 'CONV005-001778', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(807, 'CONV005-001779', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(808, 'CONV005-001780', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(809, 'CONV005-001781', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(810, 'CONV005-001782', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(811, 'CONV005-001783', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(812, 'CONV005-001784', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(813, 'CONV005-001785', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(814, 'CONV005-001786', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(815, 'CONV005-001787', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(816, 'CONV005-001788', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(817, 'CONV005-001789', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(818, 'CONV005-001790', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(819, 'CONV005-001791', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(820, 'CONV005-001792', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(821, 'CONV005-001793', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(822, 'CONV005-001794', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(823, 'CONV005-001795', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(824, 'CONV005-001796', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(825, 'CONV005-001797', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(826, 'CONV005-001798', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(827, 'CONV005-001799', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(828, 'CONV005-001800', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(829, 'CONV005-001801', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(830, 'CONV005-001802', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(831, 'CONV005-001803', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(832, 'CONV005-001804', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(833, 'CONV005-001805', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(834, 'CONV005-001806', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(835, 'CONV005-001807', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(836, 'CONV005-001808', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(837, 'CONV005-001809', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(838, 'CONV005-001810', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(839, 'CONV005-001811', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(840, 'CONV005-001812', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(841, 'CONV005-001813', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(842, 'CONV005-001814', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(843, 'CONV005-001815', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(844, 'CONV005-001816', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(845, 'CONV005-001817', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(846, 'CONV005-001818', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(847, 'CONV005-001819', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(848, 'CONV005-001820', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(849, 'CONV005-001821', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(850, 'CONV005-001822', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(851, 'CONV005-001823', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(852, 'CONV005-001824', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(853, 'CONV005-001825', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(854, 'CONV005-001826', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(855, 'CONV005-001827', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(856, 'CONV005-001828', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(857, 'CONV005-001829', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(858, 'CONV005-001830', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(859, 'CONV005-001831', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(860, 'CONV005-001832', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(861, 'CONV005-001833', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(862, 'CONV005-001834', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(863, 'CONV005-001835', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(864, 'CONV005-001836', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(865, 'CONV005-001837', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(866, 'CONV005-001838', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(867, 'CONV005-001839', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(868, 'CONV005-001840', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(869, 'CONV005-001841', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(870, 'CONV005-001842', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(871, 'CONV005-001843', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(872, 'CONV005-001844', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(873, 'CONV005-001845', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(874, 'CONV005-001846', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(875, 'CONV005-001847', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(876, 'CONV005-001848', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(877, 'CONV005-001849', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(878, 'CONV005-001850', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(879, 'CONV005-001851', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(880, 'CONV005-001852', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(881, 'CONV005-001853', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(882, 'CONV005-001854', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(883, 'CONV005-001855', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(884, 'CONV005-001856', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(885, 'CONV005-001857', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(886, 'CONV005-001858', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(887, 'CONV005-001859', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(888, 'CONV005-001860', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(889, 'CONV005-001861', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(890, 'CONV005-001862', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(891, 'CONV005-001863', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(892, 'CONV005-001864', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(893, 'CONV005-001865', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(894, 'CONV005-001866', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(895, 'CONV005-001867', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(896, 'CONV005-001868', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(897, 'CONV005-001869', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(898, 'CONV005-001870', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(899, 'CONV005-001871', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(900, 'CONV005-001872', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(901, 'CONV005-001873', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(902, 'CONV005-001874', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(903, 'CONV005-001875', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(904, 'CONV005-001876', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(905, 'CONV005-001877', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(906, 'CONV005-001878', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(907, 'CONV005-001879', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(908, 'CONV005-001880', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(909, 'CONV005-001881', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(910, 'CONV005-001882', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(911, 'CONV005-001883', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(912, 'CONV005-001884', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(913, 'CONV005-001885', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(914, 'CONV005-001886', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(915, 'CONV005-001887', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(916, 'CONV005-001888', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(917, 'CONV005-001889', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(918, 'CONV005-001890', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(919, 'CONV005-001891', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(920, 'CONV005-001892', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(921, 'CONV005-001893', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(922, 'CONV005-001894', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(923, 'CONV005-001895', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42');
INSERT INTO `qr_codes` (`id`, `consecutive`, `status`, `description`, `photo_path`, `establishment_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(924, 'CONV005-001896', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(925, 'CONV005-001897', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(926, 'CONV005-001898', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(927, 'CONV005-001899', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(928, 'CONV005-001900', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(929, 'CONV005-001901', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(930, 'CONV005-001902', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:42', '2022-08-09 15:19:42'),
(931, 'CONV005-001903', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(932, 'CONV005-001904', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(933, 'CONV005-001905', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(934, 'CONV005-001906', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(935, 'CONV005-001907', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(936, 'CONV005-001908', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(937, 'CONV005-001909', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(938, 'CONV005-001910', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(939, 'CONV005-001911', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(940, 'CONV005-001912', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(941, 'CONV005-001913', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(942, 'CONV005-001914', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(943, 'CONV005-001915', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(944, 'CONV005-001916', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(945, 'CONV005-001917', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(946, 'CONV005-001918', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(947, 'CONV005-001919', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(948, 'CONV005-001920', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(949, 'CONV005-001921', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(950, 'CONV005-001922', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(951, 'CONV005-001923', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(952, 'CONV005-001924', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(953, 'CONV005-001925', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(954, 'CONV005-001926', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(955, 'CONV005-001927', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(956, 'CONV005-001928', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(957, 'CONV005-001929', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(958, 'CONV005-001930', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(959, 'CONV005-001931', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(960, 'CONV005-001932', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(961, 'CONV005-001933', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(962, 'CONV005-001934', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(963, 'CONV005-001935', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(964, 'CONV005-001936', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(965, 'CONV005-001937', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(966, 'CONV005-001938', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(967, 'CONV005-001939', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(968, 'CONV005-001940', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(969, 'CONV005-001941', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(970, 'CONV005-001942', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(971, 'CONV005-001943', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(972, 'CONV005-001944', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(973, 'CONV005-001945', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(974, 'CONV005-001946', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(975, 'CONV005-001947', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(976, 'CONV005-001948', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(977, 'CONV005-001949', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(978, 'CONV005-001950', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(979, 'CONV005-001951', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(980, 'CONV005-001952', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(981, 'CONV005-001953', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(982, 'CONV005-001954', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(983, 'CONV005-001955', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(984, 'CONV005-001956', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(985, 'CONV005-001957', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(986, 'CONV005-001958', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(987, 'CONV005-001959', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(988, 'CONV005-001960', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(989, 'CONV005-001961', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(990, 'CONV005-001962', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(991, 'CONV005-001963', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(992, 'CONV005-001964', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(993, 'CONV005-001965', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(994, 'CONV005-001966', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(995, 'CONV005-001967', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(996, 'CONV005-001968', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(997, 'CONV005-001969', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(998, 'CONV005-001970', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(999, 'CONV005-001971', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1000, 'CONV005-001972', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1001, 'CONV005-001973', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1002, 'CONV005-001974', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1003, 'CONV005-001975', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1004, 'CONV005-001976', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1005, 'CONV005-001977', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1006, 'CONV005-001978', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1007, 'CONV005-001979', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1008, 'CONV005-001980', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1009, 'CONV005-001981', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1010, 'CONV005-001982', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1011, 'CONV005-001983', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1012, 'CONV005-001984', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1013, 'CONV005-001985', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1014, 'CONV005-001986', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1015, 'CONV005-001987', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1016, 'CONV005-001988', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1017, 'CONV005-001989', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1018, 'CONV005-001990', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1019, 'CONV005-001991', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1020, 'CONV005-001992', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1021, 'CONV005-001993', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1022, 'CONV005-001994', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1023, 'CONV005-001995', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1024, 'CONV005-001996', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1025, 'CONV005-001997', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1026, 'CONV005-001998', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1027, 'CONV005-001999', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1028, 'CONV005-002000', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1029, 'CONV005-002001', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1030, 'CONV005-002002', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1031, 'CONV005-002003', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1032, 'CONV005-002004', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1033, 'CONV005-002005', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1034, 'CONV005-002006', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1035, 'CONV005-002007', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1036, 'CONV005-002008', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1037, 'CONV005-002009', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1038, 'CONV005-002010', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1039, 'CONV005-002011', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1040, 'CONV005-002012', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1041, 'CONV005-002013', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1042, 'CONV005-002014', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1043, 'CONV005-002015', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1044, 'CONV005-002016', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1045, 'CONV005-002017', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1046, 'CONV005-002018', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1047, 'CONV005-002019', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1048, 'CONV005-002020', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1049, 'CONV005-002021', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1050, 'CONV005-002022', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1051, 'CONV005-002023', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1052, 'CONV005-002024', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1053, 'CONV005-002025', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1054, 'CONV005-002026', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1055, 'CONV005-002027', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1056, 'CONV005-002028', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1057, 'CONV005-002029', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1058, 'CONV005-002030', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1059, 'CONV005-002031', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1060, 'CONV005-002032', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1061, 'CONV005-002033', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1062, 'CONV005-002034', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1063, 'CONV005-002035', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1064, 'CONV005-002036', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1065, 'CONV005-002037', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1066, 'CONV005-002038', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1067, 'CONV005-002039', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1068, 'CONV005-002040', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1069, 'CONV005-002041', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1070, 'CONV005-002042', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1071, 'CONV005-002043', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1072, 'CONV005-002044', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1073, 'CONV005-002045', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1074, 'CONV005-002046', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1075, 'CONV005-002047', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1076, 'CONV005-002048', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1077, 'CONV005-002049', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1078, 'CONV005-002050', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1079, 'CONV005-002051', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1080, 'CONV005-002052', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1081, 'CONV005-002053', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1082, 'CONV005-002054', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1083, 'CONV005-002055', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1084, 'CONV005-002056', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1085, 'CONV005-002057', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1086, 'CONV005-002058', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1087, 'CONV005-002059', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1088, 'CONV005-002060', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1089, 'CONV005-002061', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1090, 'CONV005-002062', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1091, 'CONV005-002063', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1092, 'CONV005-002064', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1093, 'CONV005-002065', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1094, 'CONV005-002066', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1095, 'CONV005-002067', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1096, 'CONV005-002068', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1097, 'CONV005-002069', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1098, 'CONV005-002070', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1099, 'CONV005-002071', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1100, 'CONV005-002072', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1101, 'CONV005-002073', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1102, 'CONV005-002074', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1103, 'CONV005-002075', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1104, 'CONV005-002076', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1105, 'CONV005-002077', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1106, 'CONV005-002078', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1107, 'CONV005-002079', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1108, 'CONV005-002080', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1109, 'CONV005-002081', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1110, 'CONV005-002082', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1111, 'CONV005-002083', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1112, 'CONV005-002084', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1113, 'CONV005-002085', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1114, 'CONV005-002086', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1115, 'CONV005-002087', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1116, 'CONV005-002088', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1117, 'CONV005-002089', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1118, 'CONV005-002090', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1119, 'CONV005-002091', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1120, 'CONV005-002092', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1121, 'CONV005-002093', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1122, 'CONV005-002094', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1123, 'CONV005-002095', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1124, 'CONV005-002096', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1125, 'CONV005-002097', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1126, 'CONV005-002098', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1127, 'CONV005-002099', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1128, 'CONV005-002100', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1129, 'CONV005-002101', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1130, 'CONV005-002102', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1131, 'CONV005-002103', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1132, 'CONV005-002104', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1133, 'CONV005-002105', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1134, 'CONV005-002106', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1135, 'CONV005-002107', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1136, 'CONV005-002108', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1137, 'CONV005-002109', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1138, 'CONV005-002110', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1139, 'CONV005-002111', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1140, 'CONV005-002112', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1141, 'CONV005-002113', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1142, 'CONV005-002114', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1143, 'CONV005-002115', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1144, 'CONV005-002116', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1145, 'CONV005-002117', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1146, 'CONV005-002118', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1147, 'CONV005-002119', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1148, 'CONV005-002120', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1149, 'CONV005-002121', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1150, 'CONV005-002122', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1151, 'CONV005-002123', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1152, 'CONV005-002124', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1153, 'CONV005-002125', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1154, 'CONV005-002126', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1155, 'CONV005-002127', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1156, 'CONV005-002128', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1157, 'CONV005-002129', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1158, 'CONV005-002130', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1159, 'CONV005-002131', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1160, 'CONV005-002132', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1161, 'CONV005-002133', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1162, 'CONV005-002134', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1163, 'CONV005-002135', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1164, 'CONV005-002136', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1165, 'CONV005-002137', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1166, 'CONV005-002138', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1167, 'CONV005-002139', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1168, 'CONV005-002140', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1169, 'CONV005-002141', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1170, 'CONV005-002142', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1171, 'CONV005-002143', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1172, 'CONV005-002144', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1173, 'CONV005-002145', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1174, 'CONV005-002146', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1175, 'CONV005-002147', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1176, 'CONV005-002148', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1177, 'CONV005-002149', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1178, 'CONV005-002150', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1179, 'CONV005-002151', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1180, 'CONV005-002152', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1181, 'CONV005-002153', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1182, 'CONV005-002154', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1183, 'CONV005-002155', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1184, 'CONV005-002156', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1185, 'CONV005-002157', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1186, 'CONV005-002158', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1187, 'CONV005-002159', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1188, 'CONV005-002160', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1189, 'CONV005-002161', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1190, 'CONV005-002162', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1191, 'CONV005-002163', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1192, 'CONV005-002164', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1193, 'CONV005-002165', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1194, 'CONV005-002166', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1195, 'CONV005-002167', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1196, 'CONV005-002168', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1197, 'CONV005-002169', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1198, 'CONV005-002170', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1199, 'CONV005-002171', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1200, 'CONV005-002172', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1201, 'CONV005-002173', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1202, 'CONV005-002174', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1203, 'CONV005-002175', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1204, 'CONV005-002176', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1205, 'CONV005-002177', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1206, 'CONV005-002178', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1207, 'CONV005-002179', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1208, 'CONV005-002180', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1209, 'CONV005-002181', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1210, 'CONV005-002182', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1211, 'CONV005-002183', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1212, 'CONV005-002184', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1213, 'CONV005-002185', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1214, 'CONV005-002186', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1215, 'CONV005-002187', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1216, 'CONV005-002188', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1217, 'CONV005-002189', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1218, 'CONV005-002190', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1219, 'CONV005-002191', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1220, 'CONV005-002192', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1221, 'CONV005-002193', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1222, 'CONV005-002194', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1223, 'CONV005-002195', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1224, 'CONV005-002196', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1225, 'CONV005-002197', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1226, 'CONV005-002198', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1227, 'CONV005-002199', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1228, 'CONV005-002200', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1229, 'CONV005-002201', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1230, 'CONV005-002202', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1231, 'CONV005-002203', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1232, 'CONV005-002204', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1233, 'CONV005-002205', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1234, 'CONV005-002206', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1235, 'CONV005-002207', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1236, 'CONV005-002208', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1237, 'CONV005-002209', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1238, 'CONV005-002210', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1239, 'CONV005-002211', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1240, 'CONV005-002212', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1241, 'CONV005-002213', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1242, 'CONV005-002214', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1243, 'CONV005-002215', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1244, 'CONV005-002216', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1245, 'CONV005-002217', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1246, 'CONV005-002218', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1247, 'CONV005-002219', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1248, 'CONV005-002220', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1249, 'CONV005-002221', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1250, 'CONV005-002222', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1251, 'CONV005-002223', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1252, 'CONV005-002224', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1253, 'CONV005-002225', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1254, 'CONV005-002226', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1255, 'CONV005-002227', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1256, 'CONV005-002228', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1257, 'CONV005-002229', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1258, 'CONV005-002230', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1259, 'CONV005-002231', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1260, 'CONV005-002232', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1261, 'CONV005-002233', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1262, 'CONV005-002234', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1263, 'CONV005-002235', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1264, 'CONV005-002236', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1265, 'CONV005-002237', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1266, 'CONV005-002238', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1267, 'CONV005-002239', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1268, 'CONV005-002240', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1269, 'CONV005-002241', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1270, 'CONV005-002242', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1271, 'CONV005-002243', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1272, 'CONV005-002244', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1273, 'CONV005-002245', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1274, 'CONV005-002246', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1275, 'CONV005-002247', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1276, 'CONV005-002248', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1277, 'CONV005-002249', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1278, 'CONV005-002250', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1279, 'CONV005-002251', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1280, 'CONV005-002252', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1281, 'CONV005-002253', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1282, 'CONV005-002254', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1283, 'CONV005-002255', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1284, 'CONV005-002256', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1285, 'CONV005-002257', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1286, 'CONV005-002258', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1287, 'CONV005-002259', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1288, 'CONV005-002260', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1289, 'CONV005-002261', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1290, 'CONV005-002262', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1291, 'CONV005-002263', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1292, 'CONV005-002264', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1293, 'CONV005-002265', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1294, 'CONV005-002266', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1295, 'CONV005-002267', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1296, 'CONV005-002268', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1297, 'CONV005-002269', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1298, 'CONV005-002270', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1299, 'CONV005-002271', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1300, 'CONV005-002272', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1301, 'CONV005-002273', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1302, 'CONV005-002274', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1303, 'CONV005-002275', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1304, 'CONV005-002276', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1305, 'CONV005-002277', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1306, 'CONV005-002278', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1307, 'CONV005-002279', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1308, 'CONV005-002280', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1309, 'CONV005-002281', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1310, 'CONV005-002282', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1311, 'CONV005-002283', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1312, 'CONV005-002284', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1313, 'CONV005-002285', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1314, 'CONV005-002286', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1315, 'CONV005-002287', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1316, 'CONV005-002288', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1317, 'CONV005-002289', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1318, 'CONV005-002290', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1319, 'CONV005-002291', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1320, 'CONV005-002292', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1321, 'CONV005-002293', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1322, 'CONV005-002294', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1323, 'CONV005-002295', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1324, 'CONV005-002296', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1325, 'CONV005-002297', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1326, 'CONV005-002298', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1327, 'CONV005-002299', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1328, 'CONV005-002300', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1329, 'CONV005-002301', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1330, 'CONV005-002302', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1331, 'CONV005-002303', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1332, 'CONV005-002304', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1333, 'CONV005-002305', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1334, 'CONV005-002306', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1335, 'CONV005-002307', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1336, 'CONV005-002308', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1337, 'CONV005-002309', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1338, 'CONV005-002310', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1339, 'CONV005-002311', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1340, 'CONV005-002312', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1341, 'CONV005-002313', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1342, 'CONV005-002314', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1343, 'CONV005-002315', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1344, 'CONV005-002316', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1345, 'CONV005-002317', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1346, 'CONV005-002318', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1347, 'CONV005-002319', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1348, 'CONV005-002320', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1349, 'CONV005-002321', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1350, 'CONV005-002322', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1351, 'CONV005-002323', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1352, 'CONV005-002324', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1353, 'CONV005-002325', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1354, 'CONV005-002326', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1355, 'CONV005-002327', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1356, 'CONV005-002328', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1357, 'CONV005-002329', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1358, 'CONV005-002330', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1359, 'CONV005-002331', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1360, 'CONV005-002332', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1361, 'CONV005-002333', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1362, 'CONV005-002334', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1363, 'CONV005-002335', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1364, 'CONV005-002336', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1365, 'CONV005-002337', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1366, 'CONV005-002338', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1367, 'CONV005-002339', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1368, 'CONV005-002340', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1369, 'CONV005-002341', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1370, 'CONV005-002342', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1371, 'CONV005-002343', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1372, 'CONV005-002344', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1373, 'CONV005-002345', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1374, 'CONV005-002346', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1375, 'CONV005-002347', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1376, 'CONV005-002348', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1377, 'CONV005-002349', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1378, 'CONV005-002350', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1379, 'CONV005-002351', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1380, 'CONV005-002352', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1381, 'CONV005-002353', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1382, 'CONV005-002354', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1383, 'CONV005-002355', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1384, 'CONV005-002356', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1385, 'CONV005-002357', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1386, 'CONV005-002358', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1387, 'CONV005-002359', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1388, 'CONV005-002360', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1389, 'CONV005-002361', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1390, 'CONV005-002362', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1391, 'CONV005-002363', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1392, 'CONV005-002364', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1393, 'CONV005-002365', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43');
INSERT INTO `qr_codes` (`id`, `consecutive`, `status`, `description`, `photo_path`, `establishment_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(1394, 'CONV005-002366', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1395, 'CONV005-002367', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1396, 'CONV005-002368', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1397, 'CONV005-002369', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1398, 'CONV005-002370', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1399, 'CONV005-002371', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1400, 'CONV005-002372', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1401, 'CONV005-002373', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1402, 'CONV005-002374', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1403, 'CONV005-002375', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1404, 'CONV005-002376', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1405, 'CONV005-002377', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1406, 'CONV005-002378', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1407, 'CONV005-002379', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1408, 'CONV005-002380', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1409, 'CONV005-002381', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1410, 'CONV005-002382', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1411, 'CONV005-002383', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1412, 'CONV005-002384', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1413, 'CONV005-002385', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1414, 'CONV005-002386', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1415, 'CONV005-002387', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1416, 'CONV005-002388', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1417, 'CONV005-002389', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1418, 'CONV005-002390', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1419, 'CONV005-002391', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1420, 'CONV005-002392', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1421, 'CONV005-002393', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1422, 'CONV005-002394', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1423, 'CONV005-002395', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1424, 'CONV005-002396', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1425, 'CONV005-002397', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1426, 'CONV005-002398', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1427, 'CONV005-002399', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1428, 'CONV005-002400', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1429, 'CONV005-002401', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1430, 'CONV005-002402', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1431, 'CONV005-002403', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1432, 'CONV005-002404', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1433, 'CONV005-002405', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1434, 'CONV005-002406', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1435, 'CONV005-002407', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1436, 'CONV005-002408', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1437, 'CONV005-002409', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1438, 'CONV005-002410', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1439, 'CONV005-002411', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1440, 'CONV005-002412', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1441, 'CONV005-002413', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1442, 'CONV005-002414', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1443, 'CONV005-002415', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1444, 'CONV005-002416', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1445, 'CONV005-002417', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1446, 'CONV005-002418', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1447, 'CONV005-002419', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1448, 'CONV005-002420', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1449, 'CONV005-002421', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1450, 'CONV005-002422', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1451, 'CONV005-002423', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1452, 'CONV005-002424', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1453, 'CONV005-002425', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1454, 'CONV005-002426', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1455, 'CONV005-002427', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1456, 'CONV005-002428', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1457, 'CONV005-002429', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1458, 'CONV005-002430', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1459, 'CONV005-002431', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1460, 'CONV005-002432', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1461, 'CONV005-002433', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1462, 'CONV005-002434', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1463, 'CONV005-002435', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1464, 'CONV005-002436', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1465, 'CONV005-002437', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1466, 'CONV005-002438', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1467, 'CONV005-002439', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1468, 'CONV005-002440', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1469, 'CONV005-002441', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1470, 'CONV005-002442', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1471, 'CONV005-002443', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1472, 'CONV005-002444', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1473, 'CONV005-002445', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1474, 'CONV005-002446', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1475, 'CONV005-002447', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1476, 'CONV005-002448', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1477, 'CONV005-002449', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1478, 'CONV005-002450', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1479, 'CONV005-002451', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1480, 'CONV005-002452', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1481, 'CONV005-002453', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1482, 'CONV005-002454', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1483, 'CONV005-002455', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1484, 'CONV005-002456', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1485, 'CONV005-002457', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1486, 'CONV005-002458', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1487, 'CONV005-002459', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1488, 'CONV005-002460', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1489, 'CONV005-002461', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1490, 'CONV005-002462', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1491, 'CONV005-002463', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1492, 'CONV005-002464', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1493, 'CONV005-002465', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1494, 'CONV005-002466', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1495, 'CONV005-002467', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1496, 'CONV005-002468', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1497, 'CONV005-002469', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1498, 'CONV005-002470', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1499, 'CONV005-002471', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1500, 'CONV005-002472', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1501, 'CONV005-002473', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1502, 'CONV005-002474', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1503, 'CONV005-002475', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1504, 'CONV005-002476', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1505, 'CONV005-002477', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1506, 'CONV005-002478', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1507, 'CONV005-002479', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1508, 'CONV005-002480', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1509, 'CONV005-002481', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1510, 'CONV005-002482', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1511, 'CONV005-002483', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1512, 'CONV005-002484', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1513, 'CONV005-002485', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1514, 'CONV005-002486', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1515, 'CONV005-002487', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1516, 'CONV005-002488', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1517, 'CONV005-002489', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1518, 'CONV005-002490', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1519, 'CONV005-002491', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1520, 'CONV005-002492', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1521, 'CONV005-002493', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1522, 'CONV005-002494', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1523, 'CONV005-002495', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1524, 'CONV005-002496', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1525, 'CONV005-002497', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1526, 'CONV005-002498', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1527, 'CONV005-002499', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1528, 'CONV005-002500', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1529, 'CONV005-002501', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1530, 'CONV005-002502', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1531, 'CONV005-002503', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1532, 'CONV005-002504', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1533, 'CONV005-002505', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1534, 'CONV005-002506', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1535, 'CONV005-002507', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1536, 'CONV005-002508', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1537, 'CONV005-002509', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1538, 'CONV005-002510', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1539, 'CONV005-002511', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1540, 'CONV005-002512', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1541, 'CONV005-002513', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1542, 'CONV005-002514', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1543, 'CONV005-002515', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1544, 'CONV005-002516', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1545, 'CONV005-002517', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1546, 'CONV005-002518', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1547, 'CONV005-002519', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1548, 'CONV005-002520', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1549, 'CONV005-002521', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1550, 'CONV005-002522', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1551, 'CONV005-002523', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1552, 'CONV005-002524', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1553, 'CONV005-002525', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1554, 'CONV005-002526', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1555, 'CONV005-002527', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1556, 'CONV005-002528', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1557, 'CONV005-002529', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1558, 'CONV005-002530', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1559, 'CONV005-002531', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1560, 'CONV005-002532', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1561, 'CONV005-002533', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1562, 'CONV005-002534', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1563, 'CONV005-002535', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1564, 'CONV005-002536', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1565, 'CONV005-002537', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1566, 'CONV005-002538', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1567, 'CONV005-002539', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1568, 'CONV005-002540', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1569, 'CONV005-002541', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1570, 'CONV005-002542', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1571, 'CONV005-002543', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1572, 'CONV005-002544', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1573, 'CONV005-002545', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1574, 'CONV005-002546', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1575, 'CONV005-002547', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1576, 'CONV005-002548', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1577, 'CONV005-002549', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1578, 'CONV005-002550', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1579, 'CONV005-002551', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1580, 'CONV005-002552', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1581, 'CONV005-002553', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1582, 'CONV005-002554', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1583, 'CONV005-002555', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1584, 'CONV005-002556', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1585, 'CONV005-002557', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1586, 'CONV005-002558', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1587, 'CONV005-002559', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1588, 'CONV005-002560', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1589, 'CONV005-002561', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1590, 'CONV005-002562', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1591, 'CONV005-002563', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1592, 'CONV005-002564', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1593, 'CONV005-002565', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1594, 'CONV005-002566', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1595, 'CONV005-002567', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1596, 'CONV005-002568', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1597, 'CONV005-002569', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1598, 'CONV005-002570', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1599, 'CONV005-002571', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1600, 'CONV005-002572', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1601, 'CONV005-002573', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1602, 'CONV005-002574', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1603, 'CONV005-002575', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1604, 'CONV005-002576', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1605, 'CONV005-002577', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1606, 'CONV005-002578', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1607, 'CONV005-002579', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1608, 'CONV005-002580', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1609, 'CONV005-002581', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1610, 'CONV005-002582', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1611, 'CONV005-002583', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1612, 'CONV005-002584', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1613, 'CONV005-002585', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1614, 'CONV005-002586', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1615, 'CONV005-002587', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1616, 'CONV005-002588', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1617, 'CONV005-002589', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1618, 'CONV005-002590', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1619, 'CONV005-002591', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1620, 'CONV005-002592', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1621, 'CONV005-002593', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1622, 'CONV005-002594', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1623, 'CONV005-002595', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1624, 'CONV005-002596', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1625, 'CONV005-002597', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1626, 'CONV005-002598', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1627, 'CONV005-002599', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1628, 'CONV005-002600', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1629, 'CONV005-002601', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1630, 'CONV005-002602', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1631, 'CONV005-002603', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1632, 'CONV005-002604', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1633, 'CONV005-002605', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1634, 'CONV005-002606', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1635, 'CONV005-002607', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1636, 'CONV005-002608', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1637, 'CONV005-002609', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1638, 'CONV005-002610', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1639, 'CONV005-002611', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1640, 'CONV005-002612', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1641, 'CONV005-002613', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1642, 'CONV005-002614', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1643, 'CONV005-002615', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1644, 'CONV005-002616', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1645, 'CONV005-002617', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1646, 'CONV005-002618', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1647, 'CONV005-002619', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1648, 'CONV005-002620', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1649, 'CONV005-002621', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1650, 'CONV005-002622', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1651, 'CONV005-002623', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1652, 'CONV005-002624', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1653, 'CONV005-002625', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1654, 'CONV005-002626', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1655, 'CONV005-002627', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1656, 'CONV005-002628', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1657, 'CONV005-002629', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1658, 'CONV005-002630', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1659, 'CONV005-002631', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1660, 'CONV005-002632', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1661, 'CONV005-002633', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1662, 'CONV005-002634', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1663, 'CONV005-002635', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1664, 'CONV005-002636', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1665, 'CONV005-002637', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1666, 'CONV005-002638', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1667, 'CONV005-002639', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1668, 'CONV005-002640', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1669, 'CONV005-002641', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1670, 'CONV005-002642', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1671, 'CONV005-002643', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1672, 'CONV005-002644', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1673, 'CONV005-002645', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1674, 'CONV005-002646', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1675, 'CONV005-002647', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1676, 'CONV005-002648', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1677, 'CONV005-002649', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1678, 'CONV005-002650', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1679, 'CONV005-002651', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1680, 'CONV005-002652', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1681, 'CONV005-002653', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1682, 'CONV005-002654', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1683, 'CONV005-002655', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1684, 'CONV005-002656', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1685, 'CONV005-002657', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1686, 'CONV005-002658', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1687, 'CONV005-002659', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1688, 'CONV005-002660', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1689, 'CONV005-002661', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1690, 'CONV005-002662', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1691, 'CONV005-002663', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1692, 'CONV005-002664', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1693, 'CONV005-002665', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1694, 'CONV005-002666', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1695, 'CONV005-002667', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1696, 'CONV005-002668', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1697, 'CONV005-002669', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1698, 'CONV005-002670', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1699, 'CONV005-002671', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1700, 'CONV005-002672', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1701, 'CONV005-002673', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1702, 'CONV005-002674', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1703, 'CONV005-002675', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1704, 'CONV005-002676', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1705, 'CONV005-002677', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1706, 'CONV005-002678', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1707, 'CONV005-002679', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1708, 'CONV005-002680', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1709, 'CONV005-002681', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1710, 'CONV005-002682', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1711, 'CONV005-002683', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1712, 'CONV005-002684', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1713, 'CONV005-002685', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1714, 'CONV005-002686', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1715, 'CONV005-002687', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1716, 'CONV005-002688', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1717, 'CONV005-002689', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1718, 'CONV005-002690', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1719, 'CONV005-002691', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1720, 'CONV005-002692', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1721, 'CONV005-002693', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1722, 'CONV005-002694', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1723, 'CONV005-002695', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1724, 'CONV005-002696', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1725, 'CONV005-002697', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1726, 'CONV005-002698', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1727, 'CONV005-002699', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1728, 'CONV005-002700', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1729, 'CONV005-002701', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1730, 'CONV005-002702', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1731, 'CONV005-002703', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1732, 'CONV005-002704', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1733, 'CONV005-002705', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1734, 'CONV005-002706', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1735, 'CONV005-002707', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1736, 'CONV005-002708', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1737, 'CONV005-002709', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1738, 'CONV005-002710', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1739, 'CONV005-002711', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1740, 'CONV005-002712', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1741, 'CONV005-002713', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1742, 'CONV005-002714', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1743, 'CONV005-002715', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1744, 'CONV005-002716', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1745, 'CONV005-002717', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1746, 'CONV005-002718', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1747, 'CONV005-002719', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1748, 'CONV005-002720', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1749, 'CONV005-002721', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1750, 'CONV005-002722', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1751, 'CONV005-002723', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1752, 'CONV005-002724', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1753, 'CONV005-002725', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1754, 'CONV005-002726', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1755, 'CONV005-002727', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1756, 'CONV005-002728', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1757, 'CONV005-002729', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1758, 'CONV005-002730', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1759, 'CONV005-002731', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1760, 'CONV005-002732', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1761, 'CONV005-002733', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1762, 'CONV005-002734', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1763, 'CONV005-002735', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1764, 'CONV005-002736', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1765, 'CONV005-002737', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1766, 'CONV005-002738', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1767, 'CONV005-002739', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1768, 'CONV005-002740', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1769, 'CONV005-002741', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1770, 'CONV005-002742', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1771, 'CONV005-002743', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1772, 'CONV005-002744', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1773, 'CONV005-002745', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1774, 'CONV005-002746', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1775, 'CONV005-002747', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1776, 'CONV005-002748', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1777, 'CONV005-002749', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1778, 'CONV005-002750', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1779, 'CONV005-002751', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1780, 'CONV005-002752', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1781, 'CONV005-002753', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1782, 'CONV005-002754', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1783, 'CONV005-002755', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1784, 'CONV005-002756', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1785, 'CONV005-002757', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1786, 'CONV005-002758', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1787, 'CONV005-002759', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1788, 'CONV005-002760', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1789, 'CONV005-002761', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1790, 'CONV005-002762', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1791, 'CONV005-002763', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1792, 'CONV005-002764', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1793, 'CONV005-002765', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1794, 'CONV005-002766', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1795, 'CONV005-002767', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1796, 'CONV005-002768', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1797, 'CONV005-002769', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1798, 'CONV005-002770', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1799, 'CONV005-002771', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1800, 'CONV005-002772', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1801, 'CONV005-002773', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1802, 'CONV005-002774', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1803, 'CONV005-002775', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1804, 'CONV005-002776', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1805, 'CONV005-002777', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1806, 'CONV005-002778', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1807, 'CONV005-002779', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1808, 'CONV005-002780', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1809, 'CONV005-002781', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1810, 'CONV005-002782', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1811, 'CONV005-002783', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1812, 'CONV005-002784', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1813, 'CONV005-002785', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1814, 'CONV005-002786', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1815, 'CONV005-002787', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1816, 'CONV005-002788', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1817, 'CONV005-002789', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1818, 'CONV005-002790', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1819, 'CONV005-002791', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1820, 'CONV005-002792', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1821, 'CONV005-002793', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1822, 'CONV005-002794', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1823, 'CONV005-002795', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1824, 'CONV005-002796', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1825, 'CONV005-002797', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1826, 'CONV005-002798', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1827, 'CONV005-002799', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1828, 'CONV005-002800', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1829, 'CONV005-002801', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1830, 'CONV005-002802', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1831, 'CONV005-002803', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1832, 'CONV005-002804', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1833, 'CONV005-002805', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1834, 'CONV005-002806', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1835, 'CONV005-002807', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1836, 'CONV005-002808', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1837, 'CONV005-002809', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1838, 'CONV005-002810', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1839, 'CONV005-002811', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1840, 'CONV005-002812', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1841, 'CONV005-002813', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1842, 'CONV005-002814', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1843, 'CONV005-002815', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1844, 'CONV005-002816', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1845, 'CONV005-002817', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1846, 'CONV005-002818', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1847, 'CONV005-002819', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1848, 'CONV005-002820', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1849, 'CONV005-002821', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1850, 'CONV005-002822', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1851, 'CONV005-002823', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1852, 'CONV005-002824', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1853, 'CONV005-002825', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1854, 'CONV005-002826', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1855, 'CONV005-002827', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1856, 'CONV005-002828', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1857, 'CONV005-002829', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1858, 'CONV005-002830', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1859, 'CONV005-002831', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1860, 'CONV005-002832', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1861, 'CONV005-002833', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1862, 'CONV005-002834', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1863, 'CONV005-002835', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43');
INSERT INTO `qr_codes` (`id`, `consecutive`, `status`, `description`, `photo_path`, `establishment_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(1864, 'CONV005-002836', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1865, 'CONV005-002837', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1866, 'CONV005-002838', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1867, 'CONV005-002839', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1868, 'CONV005-002840', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1869, 'CONV005-002841', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1870, 'CONV005-002842', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1871, 'CONV005-002843', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1872, 'CONV005-002844', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1873, 'CONV005-002845', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1874, 'CONV005-002846', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1875, 'CONV005-002847', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1876, 'CONV005-002848', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1877, 'CONV005-002849', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1878, 'CONV005-002850', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1879, 'CONV005-002851', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1880, 'CONV005-002852', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1881, 'CONV005-002853', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1882, 'CONV005-002854', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1883, 'CONV005-002855', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1884, 'CONV005-002856', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1885, 'CONV005-002857', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1886, 'CONV005-002858', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1887, 'CONV005-002859', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1888, 'CONV005-002860', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1889, 'CONV005-002861', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1890, 'CONV005-002862', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1891, 'CONV005-002863', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1892, 'CONV005-002864', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1893, 'CONV005-002865', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1894, 'CONV005-002866', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1895, 'CONV005-002867', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1896, 'CONV005-002868', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1897, 'CONV005-002869', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1898, 'CONV005-002870', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1899, 'CONV005-002871', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1900, 'CONV005-002872', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1901, 'CONV005-002873', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1902, 'CONV005-002874', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1903, 'CONV005-002875', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1904, 'CONV005-002876', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1905, 'CONV005-002877', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1906, 'CONV005-002878', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1907, 'CONV005-002879', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1908, 'CONV005-002880', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1909, 'CONV005-002881', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1910, 'CONV005-002882', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1911, 'CONV005-002883', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1912, 'CONV005-002884', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1913, 'CONV005-002885', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1914, 'CONV005-002886', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1915, 'CONV005-002887', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1916, 'CONV005-002888', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1917, 'CONV005-002889', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1918, 'CONV005-002890', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1919, 'CONV005-002891', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1920, 'CONV005-002892', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1921, 'CONV005-002893', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1922, 'CONV005-002894', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1923, 'CONV005-002895', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1924, 'CONV005-002896', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1925, 'CONV005-002897', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1926, 'CONV005-002898', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1927, 'CONV005-002899', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1928, 'CONV005-002900', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1929, 'CONV005-002901', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1930, 'CONV005-002902', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1931, 'CONV005-002903', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1932, 'CONV005-002904', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1933, 'CONV005-002905', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1934, 'CONV005-002906', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1935, 'CONV005-002907', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1936, 'CONV005-002908', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1937, 'CONV005-002909', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1938, 'CONV005-002910', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1939, 'CONV005-002911', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1940, 'CONV005-002912', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1941, 'CONV005-002913', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1942, 'CONV005-002914', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1943, 'CONV005-002915', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1944, 'CONV005-002916', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1945, 'CONV005-002917', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1946, 'CONV005-002918', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1947, 'CONV005-002919', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1948, 'CONV005-002920', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1949, 'CONV005-002921', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1950, 'CONV005-002922', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1951, 'CONV005-002923', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1952, 'CONV005-002924', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1953, 'CONV005-002925', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1954, 'CONV005-002926', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1955, 'CONV005-002927', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1956, 'CONV005-002928', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1957, 'CONV005-002929', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1958, 'CONV005-002930', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1959, 'CONV005-002931', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1960, 'CONV005-002932', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1961, 'CONV005-002933', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1962, 'CONV005-002934', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1963, 'CONV005-002935', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1964, 'CONV005-002936', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1965, 'CONV005-002937', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1966, 'CONV005-002938', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1967, 'CONV005-002939', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1968, 'CONV005-002940', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1969, 'CONV005-002941', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1970, 'CONV005-002942', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1971, 'CONV005-002943', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1972, 'CONV005-002944', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1973, 'CONV005-002945', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1974, 'CONV005-002946', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1975, 'CONV005-002947', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1976, 'CONV005-002948', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1977, 'CONV005-002949', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1978, 'CONV005-002950', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1979, 'CONV005-002951', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1980, 'CONV005-002952', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1981, 'CONV005-002953', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1982, 'CONV005-002954', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1983, 'CONV005-002955', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1984, 'CONV005-002956', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1985, 'CONV005-002957', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1986, 'CONV005-002958', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1987, 'CONV005-002959', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1988, 'CONV005-002960', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1989, 'CONV005-002961', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1990, 'CONV005-002962', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1991, 'CONV005-002963', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1992, 'CONV005-002964', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1993, 'CONV005-002965', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1994, 'CONV005-002966', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1995, 'CONV005-002967', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1996, 'CONV005-002968', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1997, 'CONV005-002969', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1998, 'CONV005-002970', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(1999, 'CONV005-002971', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2000, 'CONV005-002972', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2001, 'CONV005-002973', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2002, 'CONV005-002974', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2003, 'CONV005-002975', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2004, 'CONV005-002976', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2005, 'CONV005-002977', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2006, 'CONV005-002978', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2007, 'CONV005-002979', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2008, 'CONV005-002980', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2009, 'CONV005-002981', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2010, 'CONV005-002982', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2011, 'CONV005-002983', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2012, 'CONV005-002984', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2013, 'CONV005-002985', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2014, 'CONV005-002986', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2015, 'CONV005-002987', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2016, 'CONV005-002988', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2017, 'CONV005-002989', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2018, 'CONV005-002990', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2019, 'CONV005-002991', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2020, 'CONV005-002992', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2021, 'CONV005-002993', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2022, 'CONV005-002994', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2023, 'CONV005-002995', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2024, 'CONV005-002996', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2025, 'CONV005-002997', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2026, 'CONV005-002998', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2027, 'CONV005-002999', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2028, 'CONV005-003000', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2029, 'CONV005-003001', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2030, 'CONV005-003002', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2031, 'CONV005-003003', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2032, 'CONV005-003004', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2033, 'CONV005-003005', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2034, 'CONV005-003006', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2035, 'CONV005-003007', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2036, 'CONV005-003008', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2037, 'CONV005-003009', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2038, 'CONV005-003010', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2039, 'CONV005-003011', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2040, 'CONV005-003012', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2041, 'CONV005-003013', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2042, 'CONV005-003014', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2043, 'CONV005-003015', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2044, 'CONV005-003016', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2045, 'CONV005-003017', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2046, 'CONV005-003018', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2047, 'CONV005-003019', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2048, 'CONV005-003020', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2049, 'CONV005-003021', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2050, 'CONV005-003022', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2051, 'CONV005-003023', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2052, 'CONV005-003024', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2053, 'CONV005-003025', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2054, 'CONV005-003026', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2055, 'CONV005-003027', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2056, 'CONV005-003028', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2057, 'CONV005-003029', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2058, 'CONV005-003030', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2059, 'CONV005-003031', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2060, 'CONV005-003032', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2061, 'CONV005-003033', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2062, 'CONV005-003034', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2063, 'CONV005-003035', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2064, 'CONV005-003036', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2065, 'CONV005-003037', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2066, 'CONV005-003038', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2067, 'CONV005-003039', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2068, 'CONV005-003040', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2069, 'CONV005-003041', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2070, 'CONV005-003042', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2071, 'CONV005-003043', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2072, 'CONV005-003044', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2073, 'CONV005-003045', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2074, 'CONV005-003046', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2075, 'CONV005-003047', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2076, 'CONV005-003048', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2077, 'CONV005-003049', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2078, 'CONV005-003050', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2079, 'CONV005-003051', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2080, 'CONV005-003052', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2081, 'CONV005-003053', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2082, 'CONV005-003054', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2083, 'CONV005-003055', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2084, 'CONV005-003056', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2085, 'CONV005-003057', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2086, 'CONV005-003058', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2087, 'CONV005-003059', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2088, 'CONV005-003060', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2089, 'CONV005-003061', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2090, 'CONV005-003062', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2091, 'CONV005-003063', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2092, 'CONV005-003064', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2093, 'CONV005-003065', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2094, 'CONV005-003066', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2095, 'CONV005-003067', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2096, 'CONV005-003068', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2097, 'CONV005-003069', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2098, 'CONV005-003070', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2099, 'CONV005-003071', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2100, 'CONV005-003072', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2101, 'CONV005-003073', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2102, 'CONV005-003074', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2103, 'CONV005-003075', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2104, 'CONV005-003076', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2105, 'CONV005-003077', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2106, 'CONV005-003078', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2107, 'CONV005-003079', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2108, 'CONV005-003080', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2109, 'CONV005-003081', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2110, 'CONV005-003082', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2111, 'CONV005-003083', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2112, 'CONV005-003084', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2113, 'CONV005-003085', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2114, 'CONV005-003086', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2115, 'CONV005-003087', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2116, 'CONV005-003088', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2117, 'CONV005-003089', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2118, 'CONV005-003090', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2119, 'CONV005-003091', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2120, 'CONV005-003092', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2121, 'CONV005-003093', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2122, 'CONV005-003094', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2123, 'CONV005-003095', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2124, 'CONV005-003096', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2125, 'CONV005-003097', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2126, 'CONV005-003098', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2127, 'CONV005-003099', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2128, 'CONV005-003100', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2129, 'CONV005-003101', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2130, 'CONV005-003102', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2131, 'CONV005-003103', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2132, 'CONV005-003104', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2133, 'CONV005-003105', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2134, 'CONV005-003106', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2135, 'CONV005-003107', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2136, 'CONV005-003108', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2137, 'CONV005-003109', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2138, 'CONV005-003110', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2139, 'CONV005-003111', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2140, 'CONV005-003112', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2141, 'CONV005-003113', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2142, 'CONV005-003114', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2143, 'CONV005-003115', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2144, 'CONV005-003116', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2145, 'CONV005-003117', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2146, 'CONV005-003118', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2147, 'CONV005-003119', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2148, 'CONV005-003120', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2149, 'CONV005-003121', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2150, 'CONV005-003122', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2151, 'CONV005-003123', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2152, 'CONV005-003124', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2153, 'CONV005-003125', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2154, 'CONV005-003126', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2155, 'CONV005-003127', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2156, 'CONV005-003128', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2157, 'CONV005-003129', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2158, 'CONV005-003130', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2159, 'CONV005-003131', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2160, 'CONV005-003132', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2161, 'CONV005-003133', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2162, 'CONV005-003134', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2163, 'CONV005-003135', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2164, 'CONV005-003136', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2165, 'CONV005-003137', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2166, 'CONV005-003138', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2167, 'CONV005-003139', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2168, 'CONV005-003140', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2169, 'CONV005-003141', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2170, 'CONV005-003142', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2171, 'CONV005-003143', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2172, 'CONV005-003144', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2173, 'CONV005-003145', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2174, 'CONV005-003146', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2175, 'CONV005-003147', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2176, 'CONV005-003148', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2177, 'CONV005-003149', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2178, 'CONV005-003150', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2179, 'CONV005-003151', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2180, 'CONV005-003152', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2181, 'CONV005-003153', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2182, 'CONV005-003154', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2183, 'CONV005-003155', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2184, 'CONV005-003156', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2185, 'CONV005-003157', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2186, 'CONV005-003158', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2187, 'CONV005-003159', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2188, 'CONV005-003160', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2189, 'CONV005-003161', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2190, 'CONV005-003162', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2191, 'CONV005-003163', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2192, 'CONV005-003164', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2193, 'CONV005-003165', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2194, 'CONV005-003166', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2195, 'CONV005-003167', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2196, 'CONV005-003168', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2197, 'CONV005-003169', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2198, 'CONV005-003170', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2199, 'CONV005-003171', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2200, 'CONV005-003172', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2201, 'CONV005-003173', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2202, 'CONV005-003174', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2203, 'CONV005-003175', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2204, 'CONV005-003176', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2205, 'CONV005-003177', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2206, 'CONV005-003178', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2207, 'CONV005-003179', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2208, 'CONV005-003180', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2209, 'CONV005-003181', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2210, 'CONV005-003182', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2211, 'CONV005-003183', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2212, 'CONV005-003184', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2213, 'CONV005-003185', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2214, 'CONV005-003186', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2215, 'CONV005-003187', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2216, 'CONV005-003188', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2217, 'CONV005-003189', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2218, 'CONV005-003190', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2219, 'CONV005-003191', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2220, 'CONV005-003192', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2221, 'CONV005-003193', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2222, 'CONV005-003194', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2223, 'CONV005-003195', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2224, 'CONV005-003196', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2225, 'CONV005-003197', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2226, 'CONV005-003198', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2227, 'CONV005-003199', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2228, 'CONV005-003200', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2229, 'CONV005-003201', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2230, 'CONV005-003202', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2231, 'CONV005-003203', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2232, 'CONV005-003204', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2233, 'CONV005-003205', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2234, 'CONV005-003206', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2235, 'CONV005-003207', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2236, 'CONV005-003208', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2237, 'CONV005-003209', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2238, 'CONV005-003210', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2239, 'CONV005-003211', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2240, 'CONV005-003212', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2241, 'CONV005-003213', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2242, 'CONV005-003214', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2243, 'CONV005-003215', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2244, 'CONV005-003216', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2245, 'CONV005-003217', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2246, 'CONV005-003218', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2247, 'CONV005-003219', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2248, 'CONV005-003220', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2249, 'CONV005-003221', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2250, 'CONV005-003222', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2251, 'CONV005-003223', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2252, 'CONV005-003224', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2253, 'CONV005-003225', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2254, 'CONV005-003226', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2255, 'CONV005-003227', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2256, 'CONV005-003228', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2257, 'CONV005-003229', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2258, 'CONV005-003230', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2259, 'CONV005-003231', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2260, 'CONV005-003232', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2261, 'CONV005-003233', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2262, 'CONV005-003234', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2263, 'CONV005-003235', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2264, 'CONV005-003236', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2265, 'CONV005-003237', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2266, 'CONV005-003238', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2267, 'CONV005-003239', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2268, 'CONV005-003240', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2269, 'CONV005-003241', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2270, 'CONV005-003242', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2271, 'CONV005-003243', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2272, 'CONV005-003244', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2273, 'CONV005-003245', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2274, 'CONV005-003246', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2275, 'CONV005-003247', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2276, 'CONV005-003248', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2277, 'CONV005-003249', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2278, 'CONV005-003250', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2279, 'CONV005-003251', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2280, 'CONV005-003252', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2281, 'CONV005-003253', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2282, 'CONV005-003254', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2283, 'CONV005-003255', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2284, 'CONV005-003256', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2285, 'CONV005-003257', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2286, 'CONV005-003258', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2287, 'CONV005-003259', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2288, 'CONV005-003260', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2289, 'CONV005-003261', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2290, 'CONV005-003262', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2291, 'CONV005-003263', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2292, 'CONV005-003264', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2293, 'CONV005-003265', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2294, 'CONV005-003266', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2295, 'CONV005-003267', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2296, 'CONV005-003268', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2297, 'CONV005-003269', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2298, 'CONV005-003270', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2299, 'CONV005-003271', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2300, 'CONV005-003272', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2301, 'CONV005-003273', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2302, 'CONV005-003274', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2303, 'CONV005-003275', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2304, 'CONV005-003276', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2305, 'CONV005-003277', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2306, 'CONV005-003278', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2307, 'CONV005-003279', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2308, 'CONV005-003280', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2309, 'CONV005-003281', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2310, 'CONV005-003282', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2311, 'CONV005-003283', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2312, 'CONV005-003284', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2313, 'CONV005-003285', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2314, 'CONV005-003286', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2315, 'CONV005-003287', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2316, 'CONV005-003288', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2317, 'CONV005-003289', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2318, 'CONV005-003290', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2319, 'CONV005-003291', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2320, 'CONV005-003292', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2321, 'CONV005-003293', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2322, 'CONV005-003294', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2323, 'CONV005-003295', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2324, 'CONV005-003296', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2325, 'CONV005-003297', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2326, 'CONV005-003298', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2327, 'CONV005-003299', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2328, 'CONV005-003300', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2329, 'CONV005-003301', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2330, 'CONV005-003302', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2331, 'CONV005-003303', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2332, 'CONV005-003304', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2333, 'CONV005-003305', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43');
INSERT INTO `qr_codes` (`id`, `consecutive`, `status`, `description`, `photo_path`, `establishment_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(2334, 'CONV005-003306', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2335, 'CONV005-003307', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2336, 'CONV005-003308', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2337, 'CONV005-003309', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2338, 'CONV005-003310', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2339, 'CONV005-003311', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2340, 'CONV005-003312', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2341, 'CONV005-003313', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2342, 'CONV005-003314', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2343, 'CONV005-003315', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2344, 'CONV005-003316', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2345, 'CONV005-003317', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2346, 'CONV005-003318', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2347, 'CONV005-003319', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2348, 'CONV005-003320', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2349, 'CONV005-003321', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2350, 'CONV005-003322', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2351, 'CONV005-003323', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2352, 'CONV005-003324', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2353, 'CONV005-003325', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2354, 'CONV005-003326', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2355, 'CONV005-003327', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2356, 'CONV005-003328', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2357, 'CONV005-003329', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2358, 'CONV005-003330', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2359, 'CONV005-003331', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2360, 'CONV005-003332', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2361, 'CONV005-003333', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2362, 'CONV005-003334', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2363, 'CONV005-003335', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2364, 'CONV005-003336', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2365, 'CONV005-003337', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2366, 'CONV005-003338', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2367, 'CONV005-003339', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2368, 'CONV005-003340', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2369, 'CONV005-003341', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2370, 'CONV005-003342', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2371, 'CONV005-003343', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2372, 'CONV005-003344', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2373, 'CONV005-003345', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2374, 'CONV005-003346', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2375, 'CONV005-003347', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2376, 'CONV005-003348', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2377, 'CONV005-003349', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2378, 'CONV005-003350', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2379, 'CONV005-003351', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2380, 'CONV005-003352', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2381, 'CONV005-003353', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2382, 'CONV005-003354', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2383, 'CONV005-003355', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2384, 'CONV005-003356', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2385, 'CONV005-003357', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2386, 'CONV005-003358', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2387, 'CONV005-003359', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2388, 'CONV005-003360', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2389, 'CONV005-003361', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2390, 'CONV005-003362', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2391, 'CONV005-003363', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2392, 'CONV005-003364', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2393, 'CONV005-003365', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2394, 'CONV005-003366', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2395, 'CONV005-003367', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2396, 'CONV005-003368', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2397, 'CONV005-003369', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2398, 'CONV005-003370', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2399, 'CONV005-003371', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2400, 'CONV005-003372', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2401, 'CONV005-003373', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2402, 'CONV005-003374', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2403, 'CONV005-003375', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2404, 'CONV005-003376', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2405, 'CONV005-003377', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2406, 'CONV005-003378', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2407, 'CONV005-003379', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2408, 'CONV005-003380', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2409, 'CONV005-003381', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2410, 'CONV005-003382', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2411, 'CONV005-003383', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2412, 'CONV005-003384', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2413, 'CONV005-003385', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2414, 'CONV005-003386', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2415, 'CONV005-003387', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2416, 'CONV005-003388', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2417, 'CONV005-003389', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2418, 'CONV005-003390', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2419, 'CONV005-003391', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2420, 'CONV005-003392', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2421, 'CONV005-003393', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2422, 'CONV005-003394', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2423, 'CONV005-003395', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2424, 'CONV005-003396', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2425, 'CONV005-003397', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2426, 'CONV005-003398', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2427, 'CONV005-003399', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2428, 'CONV005-003400', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2429, 'CONV005-003401', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2430, 'CONV005-003402', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2431, 'CONV005-003403', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2432, 'CONV005-003404', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2433, 'CONV005-003405', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2434, 'CONV005-003406', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2435, 'CONV005-003407', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2436, 'CONV005-003408', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2437, 'CONV005-003409', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2438, 'CONV005-003410', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2439, 'CONV005-003411', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2440, 'CONV005-003412', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2441, 'CONV005-003413', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2442, 'CONV005-003414', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2443, 'CONV005-003415', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2444, 'CONV005-003416', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2445, 'CONV005-003417', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2446, 'CONV005-003418', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2447, 'CONV005-003419', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2448, 'CONV005-003420', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2449, 'CONV005-003421', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2450, 'CONV005-003422', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2451, 'CONV005-003423', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2452, 'CONV005-003424', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2453, 'CONV005-003425', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2454, 'CONV005-003426', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2455, 'CONV005-003427', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2456, 'CONV005-003428', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2457, 'CONV005-003429', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2458, 'CONV005-003430', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2459, 'CONV005-003431', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2460, 'CONV005-003432', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2461, 'CONV005-003433', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2462, 'CONV005-003434', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2463, 'CONV005-003435', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2464, 'CONV005-003436', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2465, 'CONV005-003437', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2466, 'CONV005-003438', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2467, 'CONV005-003439', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2468, 'CONV005-003440', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2469, 'CONV005-003441', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2470, 'CONV005-003442', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2471, 'CONV005-003443', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2472, 'CONV005-003444', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2473, 'CONV005-003445', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2474, 'CONV005-003446', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2475, 'CONV005-003447', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2476, 'CONV005-003448', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2477, 'CONV005-003449', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2478, 'CONV005-003450', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2479, 'CONV005-003451', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2480, 'CONV005-003452', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2481, 'CONV005-003453', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2482, 'CONV005-003454', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2483, 'CONV005-003455', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2484, 'CONV005-003456', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2485, 'CONV005-003457', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2486, 'CONV005-003458', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2487, 'CONV005-003459', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2488, 'CONV005-003460', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2489, 'CONV005-003461', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2490, 'CONV005-003462', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2491, 'CONV005-003463', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2492, 'CONV005-003464', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2493, 'CONV005-003465', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2494, 'CONV005-003466', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2495, 'CONV005-003467', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2496, 'CONV005-003468', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2497, 'CONV005-003469', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2498, 'CONV005-003470', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2499, 'CONV005-003471', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2500, 'CONV005-003472', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2501, 'CONV005-003473', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2502, 'CONV005-003474', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2503, 'CONV005-003475', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2504, 'CONV005-003476', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2505, 'CONV005-003477', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2506, 'CONV005-003478', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2507, 'CONV005-003479', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2508, 'CONV005-003480', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2509, 'CONV005-003481', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2510, 'CONV005-003482', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2511, 'CONV005-003483', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2512, 'CONV005-003484', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2513, 'CONV005-003485', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2514, 'CONV005-003486', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2515, 'CONV005-003487', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2516, 'CONV005-003488', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2517, 'CONV005-003489', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2518, 'CONV005-003490', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2519, 'CONV005-003491', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2520, 'CONV005-003492', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2521, 'CONV005-003493', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2522, 'CONV005-003494', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2523, 'CONV005-003495', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2524, 'CONV005-003496', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2525, 'CONV005-003497', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2526, 'CONV005-003498', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2527, 'CONV005-003499', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43'),
(2528, 'CONV005-003500', 'inactive', NULL, NULL, NULL, NULL, '2022-08-09 15:19:43', '2022-08-09 15:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sanctum', '2022-01-04 18:32:03', '2022-08-05 19:19:06'),
(2, 'Directivo', 'sanctum', '2022-01-04 18:32:12', '2022-08-05 19:19:06'),
(3, 'Administrativo', 'sanctum', '2022-01-04 18:32:21', '2022-08-05 19:19:06'),
(4, 'Docente', 'sanctum', '2022-01-04 18:33:01', '2022-08-05 19:19:06'),
(5, 'Estudiante', 'sanctum', '2022-01-04 18:33:12', '2022-08-05 19:19:06'),
(6, 'Acudiente', 'sanctum', '2022-01-04 18:33:22', '2022-08-05 19:19:06'),
(7, 'Editor códigos Qr', 'sanctum', '2022-08-09 06:06:10', '2022-08-09 06:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 7),
(17, 1),
(17, 7),
(18, 1),
(18, 7),
(20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('awT93HHpMGxI1V9lDTFEALGPDZSoUOYnsTNsxsBc', NULL, '181.78.85.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjdzV2xmbzdlRHJNYXJaTThyVGxPY3JmY1hXY0ZKbHZwalNXWlR1WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9zaWdhYy5hbG1hZ3VhamlyYS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1681232960),
('Yrx46Dn1zhdKtNJxsaJ60fs4UFQ5HRfw7NLFjSmQ', NULL, '181.78.85.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2JKaXJ2VlMwcFZWTlZWS0V2a2p1bjJsWUsyZ0w4MGVsSVZTV1JvYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9zaWdhYy5hbG1hZ3VhamlyYS5jb20vYWRkLWluZm9ybWF0aW9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1681246558);

-- --------------------------------------------------------

--
-- Table structure for table `study_plans`
--

CREATE TABLE `study_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 3, 'Luis\'s Team', 1, '2022-10-25 23:01:42', '2022-10-25 23:01:42'),
(2, 4, 'CARMEN\'s Team', 1, '2022-10-26 01:28:09', '2022-10-26 01:28:09'),
(3, 5, 'Geiler\'s Team', 1, '2022-10-27 14:39:32', '2022-10-27 14:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracings`
--

CREATE TABLE `tracings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `path_route` text DEFAULT NULL,
  `work_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Geiler Elias Radillo Sarmiento', 'geilerelias@gmail.com', '2022-08-05 19:19:06', '$2y$10$Cs.Dmu3lFNBDtbIZDfIvveiTwSN/g9iknfvFfpepIDwEMk2ZBVx4m', NULL, NULL, '30Sq47WQLKA7LVpCk9648RpVNGsafh08agkj4o8QtgsXpU2lvBlIvatQFZJ1', NULL, NULL, '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(2, 'Ledis Beatriz Sarmiento', 'ledisbersage@gmail.com', NULL, '$2y$10$bQB0slBFv7OWlzWJWEg97uyN84bkNoDe.LX25M1jKjqcQiGJ7XM8q', NULL, NULL, '2FKzbjtgNuDpl5t1miE1Eup9L2Aj6qUv3VNpmu07Hxs2HH6PGCRbv6p0SdO1', NULL, NULL, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(3, 'Luis Fernando Pertuz Gómez', 'apoyosupereducacion@gmail.com', NULL, '$2y$10$k2MzlWRneaZjsh4omwcJhOSbcUvzkYkgNCHmHQPfuOfEpXPi7vgZa', NULL, NULL, NULL, NULL, NULL, '2022-10-25 23:01:42', '2022-10-25 23:01:42'),
(4, 'CARMEN ANGELICA BARROS', 'cangbarros@gmail.com', NULL, '$2y$10$2my26iQCOgqzevbKgFy/S.D4JXMO8.xdvi1HkNUOZdlPPNUmhWPDG', NULL, NULL, NULL, NULL, NULL, '2022-10-26 01:28:09', '2022-10-26 01:28:09'),
(5, 'Geiler Elias Radillo Sarmiento', 'gradillo@unicesar.edu.co', NULL, '$2y$10$b7te/5ESLvsbYb4OHcLSTeabupXVHacBL1yZZx2STGkFoDTWfo7ri', NULL, NULL, NULL, NULL, NULL, '2022-10-27 14:39:32', '2022-10-27 14:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type` varchar(255) NOT NULL,
  `coordinates` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `travel_time` varchar(255) DEFAULT NULL,
  `has_electricity` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `headquarters_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `work_type`, `coordinates`, `latitude`, `longitude`, `distance`, `travel_time`, `has_electricity`, `municipality`, `department`, `establishments_id`, `headquarters_id`, `created_at`, `updated_at`) VALUES
(1, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d125124.45455928803!2d-72.77991338139894!3d11.469876545533946!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.404692%2C-72.529604!3m2!1d11.404691999999999!2d-72.52960399999999!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647408375080!5m2!1ses!2sco', '11.202641', '-72.485201', '85,80', '1h11min', 'SI', 'Albania', 'LaGuajira', 2, 2, '2022-06-08 20:00:06', '2022-06-08 20:00:06'),
(2, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d500681.4183303019!2d-72.85168452667106!3d11.36582487722052!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e6!4m5!1s0x0%3A0xaf527c79e386de22!2s11.202641%2C-72.485201!3m2!1d11.202641!2d-72.485201!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647408225713!5m2!1ses!2sco', '11.404692', '-72.529604', '46,70', '55min', 'SI', 'Albania', 'LaGuajira', 1, 1, '2022-06-08 20:26:28', '2022-06-08 20:26:28'),
(3, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d1814.4318871809644!2d-72.52539372200397!3d11.189908738601089!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.189873%2C-72.525177!3m2!1d11.189872999999999!2d-72.525177!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses!2sco!4v1647408770057!5m2!1ses!2sco', '11.189873', '-72.525177', '85,30', '1h14min', 'SI', 'Albania', 'LaGuajira', 3, 3, '2022-06-08 20:27:10', '2022-06-08 20:27:10'),
(4, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m22!1m8!1m3!1d500886.28804637986!2d-72.865591!3d11.248598!3m2!1i1024!2i768!4f13.1!4m11!3e0!4m3!3m2!1d10.957479!2d-72.80398!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409271163!5m2!1ses!2sco', '10.957479', '-72.80398', '105,00', '1h52min', 'SI', 'Barrancas', 'LaGuajira', 4, 4, '2022-06-08 20:27:55', '2022-06-08 20:27:55'),
(5, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d250377.45694199976!2d-73.29406415649868!3d11.323908339189163!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.218284%2C-73.403556!3m2!1d11.218283999999999!2d-73.403556!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409086015!5m2!1ses!2sco', '11.218284', '-73.403556', '76,10', '1h13min', 'SI', 'Dibulla', 'LaGuajira', 5, 5, '2022-06-08 20:28:29', '2022-06-08 20:28:29'),
(6, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d250319.68354997237!2d-73.19322525538132!3d11.38973938000452!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.234278%09-73.216292!3m2!1d11.234278!2d-73.216292!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409206624!5m2!1ses!2sco', '11.234278', '-73.216292', '53,70', '53min', 'SI', 'Dibulla', 'LaGuajira', 6, 6, '2022-06-08 20:28:59', '2022-06-08 20:28:59'),
(7, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d250332.38264075827!2d-73.36500120562744!3d11.375301386871717!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s11.245742%2C-73.559901!3m2!1d11.245742!2d-73.559901!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409358781!5m2!1ses!2sco', '11.245742', '-73.559901', '95,00', '1h29min', 'SI', 'Dibulla', 'LaGuajira', 7, 7, '2022-06-08 20:39:39', '2022-06-08 20:39:39'),
(8, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d500947.30415450013!2d-72.89369796532719!3d11.213450693360329!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s10.886197%2C-72.84888!3m2!1d10.886197!2d-72.84888!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409404094!5m2!1ses!2sco', '10.886197', '-72.84888', '115,00', '2h4min', 'SI', 'Fonseca', 'LaGuajira', 8, 8, '2022-06-08 20:42:56', '2022-06-08 20:42:56'),
(9, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d595880.5513364471!2d-72.95249220872535!3d11.140224832084238!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s10.889683%2C-72.855073!3m2!1d10.889683!2d-72.85507299999999!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409548653!5m2!1ses!2sco', '10.889683', '-72.855073', '115,00', '2h5min', 'SI', 'Fonseca', 'LaGuajira', 8, 9, '2022-06-08 20:45:45', '2022-06-08 20:45:45'),
(10, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d501271.025644284!2d-73.02974402970597!3d11.025126362982384!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s10.509524%2C-73.071294!3m2!1d10.509523999999999!2d-73.071294!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409657703!5m2!1ses!2sco', '10.509524', '-73.071294', '182,00', '3h10min', 'SI', 'La Jagua del Pilar', 'LaGuajira', 9, 10, '2022-06-08 20:46:46', '2022-06-08 20:46:46'),
(11, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d125061.9898593816!2d-72.85244028083684!3d11.610000915228644!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s11.710043%2C-72.674667!3m2!1d11.710042999999999!2d-72.674667!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409803037!5m2!1ses!2sco', '11.710043', '-72.674667', '41,30', '46min', 'SI', 'Manaure', 'LaGuajira', 10, 11, '2022-06-08 20:49:00', '2022-06-08 20:49:00'),
(12, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d125065.529986592!2d-72.79911673086889!3d11.602104125411259!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s11.655803%2C-72.647341!3m2!1d11.655802999999999!2d-72.647341!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409862695!5m2!1ses!2sco', '11.655803', '-72.647341', '50,40', '1h9min', 'NO', 'Manaure', 'LaGuajira', 10, 12, '2022-06-08 20:50:07', '2022-06-08 20:50:07'),
(13, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d125091.92715632319!2d-72.799116731107!3d11.543053251474138!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e0!4m4!2s11.525375%2C-72.79094!3m2!1d11.525374999999999!2d-72.79093999999999!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647409920682!5m2!1ses!2sco', '11.525375', '-72.79094', '15,60', '21min', 'NO', 'Manaure', 'LaGuajira', 10, 13, '2022-06-08 21:01:11', '2022-06-08 21:01:11'),
(14, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d125048.98919589119!2d-72.73709538071915!3d11.638955527870927!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.767792%2C-72.443924!3m2!1d11.767792!2d-72.443924!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647410016663!5m2!1ses!2sco', '11.767792', '-72.443924', '70,90', '1h12min', 'SI', 'Manaure', 'LaGuajira', 11, 14, '2022-06-08 21:01:59', '2022-06-08 21:01:59'),
(15, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d250117.15226977947!2d-72.72205845142128!3d11.617610730775317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.819545%2C-72.363617!3m2!1d11.819545!2d-72.36361699999999!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647410079501!5m2!1ses!2sco', '11.819545', '-72.363617', '84,90', '1h57min', 'NO', 'Manaure', 'LaGuajira', 12, 15, '2022-06-08 21:02:35', '2022-06-08 21:02:35'),
(16, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d250140.62606999843!2d-72.7220584518836!3d11.591426384267054!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.747894%2C-72.402851!3m2!1d11.747893999999999!2d-72.402851!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647410130775!5m2!1ses!2sco', '11.747894', '-72.402851', '76,20', '1h19min', 'SI', 'Manaure', 'LaGuajira', 13, 16, '2022-06-08 21:03:23', '2022-06-08 21:03:23'),
(17, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d250140.62606999843!2d-72.7220584518836!3d11.591426384267054!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.753826%2C-72.364362!3m2!1d11.753826!2d-72.364362!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Diagonal%20al%20colegio%20Elion%20Pinedo%20R%C3%ADos%2C%20KM%201%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e0!3m2!1ses!2sco!4v1647410188963!5m2!1ses!2sco', '11.753826', '-72.364362', '81,00', '1h33min', 'NO', 'Manaure', 'LaGuajira', 13, 17, '2022-06-08 21:04:10', '2022-06-08 21:04:10'),
(18, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226322.9400932028!2d-72.80871562212324!3d11.642278890660004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.774183%2C-72.447564!3m2!1d11.774182999999999!2d-72.447564!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438333802!5m2!1ses-419!2sco', '11.774183', '-72.447564', '70,90', '1h13min', 'SI', 'Manaure', 'LaGuajira', 14, 18, '2022-06-08 21:04:48', '2022-06-08 21:04:48'),
(19, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d113187.52569936668!2d-72.9076585988301!3d11.578075508470851!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.645891%2C-72.785329!3m2!1d11.645890999999999!2d-72.78532899999999!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438390821!5m2!1ses-419!2sco', '11.645891', '-72.785329', '23,90', '30min', 'SI', 'Manaure', 'LaGuajira', 15, 19, '2022-06-08 21:05:27', '2022-06-08 21:05:27'),
(20, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d56599.489140456884!2d-72.88820663325833!3d11.549743995179055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.589514%2C-72.815814!3m2!1d11.589514!2d-72.815814!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438443702!5m2!1ses-419!2sco', '11.589514', '-72.815814', '18,90', '27min', 'SI', 'Manaure', 'LaGuajira', 15, 20, '2022-06-08 21:06:15', '2022-06-08 21:06:15'),
(21, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226407.33141408785!2d-72.86916477540194!3d11.538128402237584!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.500995%2C-72.72731!3m2!1d11.500995!2d-72.72731!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438494714!5m2!1ses-419!2sco', '11.500995', '-72.72731', '19,70', '20min', 'SI', 'Manaure', 'LaGuajira', 16, 21, '2022-06-08 21:08:54', '2022-06-08 21:08:54'),
(22, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d134628.2484406037!2d-72.80562223399302!3d11.526356397292272!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.456995%2C-72.593854!3m2!1d11.456995!2d-72.593854!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438554803!5m2!1ses-419!2sco', '11.456995', '-72.593854', '36,10', '30min', 'NO', 'Manaure', 'LaGuajira', 16, 22, '2022-06-08 21:11:02', '2022-06-08 21:11:02'),
(23, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d100780.76041450801!2d-72.63768217063013!3d11.737462251268678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.727780399361727%2C%20-72.54535969501318!3m2!1d11.7277804!2d-72.54535969999999!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438899693!5m2!1ses-419!2sco', '11.69489-', '72.593494', '60,10', '1h6min', 'NO', 'Manaure', 'LaGuajira', 17, 23, '2022-06-08 21:11:42', '2022-06-08 21:11:42'),
(24, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226503.79593759868!2d-73.0817059291327!3d11.417930276400913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.406357%2C-72.893086!3m2!1d11.406357!2d-72.893086!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438952486!5m2!1ses-419!2sco', '11.406357', '-72.893086', '17,20', '22min', 'NO', 'Riohacha', 'LaGuajira', 18, 26, '2022-06-08 21:12:19', '2022-06-08 21:12:19'),
(25, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d14150.056889581347!2d-72.90380577778105!3d11.546085592401614!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.549558%2C-72.886662!3m2!1d11.549558!2d-72.886662!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438993544!5m2!1ses-419!2sco', '11.549558', '-72.886662', '6,10', '17min', 'SI', 'Riohacha', 'LaGuajira', 19, 24, '2022-06-08 21:13:38', '2022-06-08 21:13:38'),
(26, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226532.86121415882!2d-72.98689938025315!3d11.38146842006052!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.244123%2C-72.788764!3m2!1d11.244123!2d-72.788764!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647439045934!5m2!1ses-419!2sco', '11.244123', '-72.788764', '49,90', '58min', 'NO', 'Riohacha', 'LaGuajira', 20, 25, '2022-06-08 21:14:22', '2022-06-08 21:14:22'),
(27, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226547.64570870326!2d-72.98429203082237!3d11.362877243277888!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.185394%2C-72.695154!3m2!1d11.185393999999999!2d-72.695154!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647439083135!5m2!1ses-419!2sco', '11.185394', '-72.695154', '59,2', '1h4min', 'SI', 'Riohacha', 'LaGuajira', 21, 27, '2022-06-08 21:14:54', '2022-06-08 21:14:54');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_establishments_id_foreign` (`establishments_id`);

--
-- Indexes for table `area_plans`
--
ALTER TABLE `area_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `headquarters`
--
ALTER TABLE `headquarters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `headquarters_establishment_id_foreign` (`establishment_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_email_unique` (`email`),
  ADD KEY `people_establishment_id_foreign` (`establishment_id`),
  ADD KEY `people_headquarter_id_foreign` (`headquarter_id`),
  ADD KEY `people_attended_by_foreign` (`attended_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qr_codes_consecutive_unique` (`consecutive`),
  ADD KEY `qr_codes_establishment_id_foreign` (`establishment_id`),
  ADD KEY `qr_codes_headquarters_id_foreign` (`headquarters_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `study_plans`
--
ALTER TABLE `study_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_plans_establishments_id_foreign` (`establishments_id`),
  ADD KEY `study_plans_year_id_foreign` (`year_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_establishments_id_foreign` (`establishments_id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `tracings`
--
ALTER TABLE `tracings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracings_work_id_foreign` (`work_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `works_establishments_id_foreign` (`establishments_id`),
  ADD KEY `works_headquarters_id_foreign` (`headquarters_id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `years_establishments_id_foreign` (`establishments_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_plans`
--
ALTER TABLE `area_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `headquarters`
--
ALTER TABLE `headquarters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2529;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `study_plans`
--
ALTER TABLE `study_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracings`
--
ALTER TABLE `tracings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`);

--
-- Constraints for table `headquarters`
--
ALTER TABLE `headquarters`
  ADD CONSTRAINT `headquarters_establishment_id_foreign` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_attended_by_foreign` FOREIGN KEY (`attended_by`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `people_establishment_id_foreign` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `people_headquarter_id_foreign` FOREIGN KEY (`headquarter_id`) REFERENCES `headquarters` (`id`);

--
-- Constraints for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD CONSTRAINT `qr_codes_establishment_id_foreign` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `qr_codes_headquarters_id_foreign` FOREIGN KEY (`headquarters_id`) REFERENCES `headquarters` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `study_plans`
--
ALTER TABLE `study_plans`
  ADD CONSTRAINT `study_plans_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `study_plans_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`);

--
-- Constraints for table `tracings`
--
ALTER TABLE `tracings`
  ADD CONSTRAINT `tracings_work_id_foreign` FOREIGN KEY (`work_id`) REFERENCES `works` (`id`);

--
-- Constraints for table `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `works_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `works_headquarters_id_foreign` FOREIGN KEY (`headquarters_id`) REFERENCES `headquarters` (`id`);

--
-- Constraints for table `years`
--
ALTER TABLE `years`
  ADD CONSTRAINT `years_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
