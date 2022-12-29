-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-08-2022 a las 06:13:01
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ceindetec_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_plans`
--

CREATE TABLE `area_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establishments`
--

CREATE TABLE `establishments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `establishments`
--

INSERT INTO `establishments` (`id`, `name`, `nit`, `municipality`, `department`, `created_at`, `updated_at`) VALUES
(1, 'Centro Educativo Eduardo Pinto Aragón de Porciosa', '0000', 'Albania', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(2, 'Centro Utpurai	', '0000', 'Albania', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
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
(18, 'Centro etnoeducativo #17 (kousachon)', '0000', 'Riohacha-1', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(19, 'Centro etnoeducativo #4', '0000', 'Riohacha-1', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(20, 'Centro etnoeducativo #8 (paraver)', '0000', 'Riohacha-1', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(21, 'Centro etnoeducativo #9 (mañature)', '0000', 'Riohacha-1', 'La Guajira', '2022-08-05 19:19:07', '2022-08-05 19:19:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headquarters`
--

CREATE TABLE `headquarters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dane_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `headquarters`
--

INSERT INTO `headquarters` (`id`, `name`, `dane_code`, `address`, `municipality`, `department`, `email`, `phone`, `establishment_id`, `created_at`, `updated_at`) VALUES
(1, 'Escuela Rural de Santa Fe', '244035003360', 'Resguardo Pitulumani', 'Albania', 'La Guajira', 'mail@mail.com', '3145053111', 1, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(2, 'Escuela Indígena Itaka', '244035003432', 'Km 41 Via Riohacha-1', 'Albania', 'La Guajira', 'mail@mail.com', '3133782458', 2, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
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
(24, 'Sede El pasito', '3004215140', 'Comunidad El Pasito', 'Riohacha-1', 'La Guajira', 'mail@mail.com', '3004215140', 19, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(25, 'Sede Paraver', '244001003514', 'Comunidad Paraver', 'Riohacha-1', 'La Guajira', 'mail@mail.com', '3106120762', 20, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(26, 'Sede Kousachon', '24400001005011', 'Comunidad Kousachon', 'Riohacha-1', 'La Guajira', 'mail@mail.com', '3008052296', 18, '2022-08-05 19:19:07', '2022-08-05 19:19:07'),
(27, 'Sede Mañature', '244001004529', 'Resguardo Mañature', 'Riohacha-1', 'La Guajira', 'mail@mail.com', '0000000000', 21, '2022-08-05 19:19:07', '2022-08-05 19:19:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
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
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(7, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `person_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Ver dashboard', 'sanctum', '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
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
(18, 'Editar qrcode', 'sanctum', '2022-08-06 21:55:53', '2022-08-06 21:55:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consecutive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `headquarters_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `qr_codes`
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
(27, 'CONV005-000915', 'active', '<ul><li> Torre de 21 Metros Autosoportada</li><li>Tipo de  Enlace: Enlace por Fibra óptica</li></ul><p><br></p>', 'null', 8, 9, NULL, '2022-08-07 08:50:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
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
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
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
(18, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('G3wR9ING2RFn1IiLTIFd8H40ZZTBQRm2JzQzYzcO', 2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOEFGMlpkWkp5QTVaeUQwbGtIRG9La1JtU0NKWGZ6dnphd0pCQmU5RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9xcmNvZGUiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1660009293);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `study_plans`
--

CREATE TABLE `study_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tracings`
--

CREATE TABLE `tracings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_route` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Geiler Elias Radillo Sarmiento', 'geilerelias@gmail.com', NULL, '$2y$10$Cs.Dmu3lFNBDtbIZDfIvveiTwSN/g9iknfvFfpepIDwEMk2ZBVx4m', NULL, NULL, 'XHtGoW7enm8K5kZlWK4OeKceyZ5ytbXlikhYJ9xoog2dqRsOAenL82OwqvSN', NULL, NULL, '2022-08-05 19:19:06', '2022-08-05 19:19:06'),
(2, 'Ledis Beatriz Sarmiento', 'ledisbersage@gmail.com', NULL, '$2y$10$bQB0slBFv7OWlzWJWEg97uyN84bkNoDe.LX25M1jKjqcQiGJ7XM8q', NULL, NULL, '2FKzbjtgNuDpl5t1miE1Eup9L2Aj6qUv3VNpmu07Hxs2HH6PGCRbv6p0SdO1', NULL, NULL, '2022-08-05 19:19:07', '2022-08-05 19:19:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `works`
--

CREATE TABLE `works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_electricity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `headquarters_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `works`
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
(24, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226503.79593759868!2d-73.0817059291327!3d11.417930276400913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.406357%2C-72.893086!3m2!1d11.406357!2d-72.893086!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438952486!5m2!1ses-419!2sco', '11.406357', '-72.893086', '17,20', '22min', 'NO', 'Riohacha-1', 'LaGuajira', 18, 26, '2022-06-08 21:12:19', '2022-06-08 21:12:19'),
(25, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d14150.056889581347!2d-72.90380577778105!3d11.546085592401614!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.549558%2C-72.886662!3m2!1d11.549558!2d-72.886662!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647438993544!5m2!1ses-419!2sco', '11.549558', '-72.886662', '6,10', '17min', 'SI', 'Riohacha-1', 'LaGuajira', 19, 24, '2022-06-08 21:13:38', '2022-06-08 21:13:38'),
(26, 'Construcción', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226532.86121415882!2d-72.98689938025315!3d11.38146842006052!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.244123%2C-72.788764!3m2!1d11.244123!2d-72.788764!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647439045934!5m2!1ses-419!2sco', '11.244123', '-72.788764', '49,90', '58min', 'NO', 'Riohacha-1', 'LaGuajira', 20, 25, '2022-06-08 21:14:22', '2022-06-08 21:14:22'),
(27, 'Adecuación', 'https://www.google.com/maps/embed?pb=!1m27!1m12!1m3!1d226547.64570870326!2d-72.98429203082237!3d11.362877243277888!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m12!3e6!4m4!2s11.185394%2C-72.695154!3m2!1d11.185393999999999!2d-72.695154!4m5!1s0x8e8b7df3fe76799f%3A0xcb812d3361e7849a!2sTransportes%20Relaturg%2C%20Maicao-Rioacha%2C%20Riohacha%2C%20La%20Guajira!3m2!1d11.535363!2d-72.88996569999999!5e1!3m2!1ses-419!2sco!4v1647439083135!5m2!1ses-419!2sco', '11.185394', '-72.695154', '59,2', '1h4min', 'SI', 'Riohacha-1', 'LaGuajira', 21, 27, '2022-06-08 21:14:54', '2022-06-08 21:14:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `years`
--

CREATE TABLE `years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `establishments_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_establishments_id_foreign` (`establishments_id`);

--
-- Indices de la tabla `area_plans`
--
ALTER TABLE `area_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `headquarters`
--
ALTER TABLE `headquarters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `headquarters_establishment_id_foreign` (`establishment_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_email_unique` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qr_codes_consecutive_unique` (`consecutive`),
  ADD KEY `qr_codes_establishment_id_foreign` (`establishment_id`),
  ADD KEY `qr_codes_headquarters_id_foreign` (`headquarters_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `study_plans`
--
ALTER TABLE `study_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_plans_establishments_id_foreign` (`establishments_id`),
  ADD KEY `study_plans_year_id_foreign` (`year_id`);

--
-- Indices de la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_establishments_id_foreign` (`establishments_id`);

--
-- Indices de la tabla `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indices de la tabla `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indices de la tabla `tracings`
--
ALTER TABLE `tracings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracings_work_id_foreign` (`work_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `works_establishments_id_foreign` (`establishments_id`),
  ADD KEY `works_headquarters_id_foreign` (`headquarters_id`);

--
-- Indices de la tabla `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `years_establishments_id_foreign` (`establishments_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `area_plans`
--
ALTER TABLE `area_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `establishments`
--
ALTER TABLE `establishments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `headquarters`
--
ALTER TABLE `headquarters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `study_plans`
--
ALTER TABLE `study_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tracings`
--
ALTER TABLE `tracings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `works`
--
ALTER TABLE `works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `years`
--
ALTER TABLE `years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`);

--
-- Filtros para la tabla `headquarters`
--
ALTER TABLE `headquarters`
  ADD CONSTRAINT `headquarters_establishment_id_foreign` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD CONSTRAINT `qr_codes_establishment_id_foreign` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `qr_codes_headquarters_id_foreign` FOREIGN KEY (`headquarters_id`) REFERENCES `headquarters` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `study_plans`
--
ALTER TABLE `study_plans`
  ADD CONSTRAINT `study_plans_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `study_plans_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`);

--
-- Filtros para la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`);

--
-- Filtros para la tabla `tracings`
--
ALTER TABLE `tracings`
  ADD CONSTRAINT `tracings_work_id_foreign` FOREIGN KEY (`work_id`) REFERENCES `works` (`id`);

--
-- Filtros para la tabla `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `works_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`),
  ADD CONSTRAINT `works_headquarters_id_foreign` FOREIGN KEY (`headquarters_id`) REFERENCES `headquarters` (`id`);

--
-- Filtros para la tabla `years`
--
ALTER TABLE `years`
  ADD CONSTRAINT `years_establishments_id_foreign` FOREIGN KEY (`establishments_id`) REFERENCES `establishments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
