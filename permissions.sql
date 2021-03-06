INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES (1, 'view dashboard', 'sanctum', '2022-01-04 13:32:03', '2022-01-04 13:32:03'),
       (2, 'create rol', 'sanctum', '2022-01-04 13:32:12', '2022-01-04 13:32:12'),
       (3, 'edit rol', 'sanctum', '2022-01-04 13:32:21', '2022-01-04 15:03:40'),
       (4, 'view user', 'sanctum', '2022-01-04 13:33:01', '2022-01-04 13:33:01'),
       (5, 'view person', 'sanctum', '2022-01-04 13:33:12', '2022-01-04 13:33:12'),
       (6, 'view rol', 'sanctum', '2022-01-04 13:33:22', '2022-01-04 15:03:47'),
       (7, 'view permission', 'sanctum', '2022-01-04 13:33:33', '2022-01-04 13:33:33'),
       (8, 'edit person', 'sanctum', '2022-01-04 13:33:45', '2022-01-04 13:33:45'),
       (9, 'destroy person', 'sanctum', '2022-01-04 13:33:58', '2022-01-04 13:33:58'),
       (10, 'create person', 'sanctum', '2022-01-04 13:34:07', '2022-01-04 13:34:07'),
       (11, 'assign permissions', 'sanctum', '2022-01-04 15:02:26', '2022-01-04 15:02:26'),
       (12, 'get permissions', 'sanctum', '2022-01-04 15:02:49', '2022-01-04 15:02:49'),
       (13, 'destroy rol', 'sanctum', '2022-01-04 15:04:15', '2022-01-04 15:04:15'),
       (14, 'assign roles', 'sanctum', '2022-01-05 02:25:27', '2022-01-05 02:25:27'),
       (15, 'remove roles', 'sanctum', '2022-01-05 02:25:59', '2022-01-05 02:25:59');


INSERT INTO `roles`(`name`, `guard_name`, `created_at`)
VALUES ('admin', 'sanctum', '2022-01-04 13:32:03'),
       ('directivo', 'sanctum', '2022-01-04 13:32:03'),
       ('administrativo', 'sanctum', '2022-01-04 13:32:03'),
       ('docente', 'sanctum', '2022-01-04 13:32:03'),
       ('estudiante', 'sanctum', '2022-01-04 13:32:03'),
       ('acudiente', 'sanctum', '2022-01-04 13:32:03');
