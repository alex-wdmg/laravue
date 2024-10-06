-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: db_laravue:3306
-- Время создания: Окт 05 2024 г., 13:13
-- Версия сервера: 8.1.0
-- Версия PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `laravue`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
                               `id` bigint UNSIGNED NOT NULL,
                               `uuid` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
    (1, '2014_10_12_000000_create_users_table', 1),
    (2, '2014_10_12_100000_create_password_resets_table', 1),
    (3, '2019_08_19_000000_create_failed_jobs_table', 1),
    (4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
    (5, '2022_04_16_141332_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
    `permission_id` bigint UNSIGNED NOT NULL,
    `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_roles`
--

CREATE TABLE `model_has_roles` (
    `role_id` bigint UNSIGNED NOT NULL,
    `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
    (2, 'App\\Models\\User', 1),
    (1, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
   `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
   `token` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
   `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
    ('user@example.com', '$2y$10$6ab92VVX7hp0yCdwNfcpd.bwTUWCDaBxi1HDE0IENa26ynokVw3z6', '2024-10-05 13:10:42');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
    `id` bigint UNSIGNED NOT NULL,
    `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
    (1, 'view users', 'web', '2024-10-05 13:08:49', '2024-10-05 13:08:49'),
    (2, 'edit users', 'web', '2024-10-05 13:08:49', '2024-10-05 13:08:49'),
    (3, 'delete users', 'web', '2024-10-05 13:08:49', '2024-10-05 13:08:49'),
    (4, 'create users', 'web', '2024-10-05 13:08:50', '2024-10-05 13:08:50'),
    (5, 'assign roles', 'web', '2024-10-05 13:08:50', '2024-10-05 13:08:50'),
    (6, 'assign permissions', 'web', '2024-10-05 13:08:50', '2024-10-05 13:08:50');

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
    `id` bigint UNSIGNED NOT NULL,
    `tokenable_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `tokenable_id` bigint UNSIGNED NOT NULL,
    `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
    `abilities` text COLLATE utf8mb4_unicode_ci,
    `last_used_at` timestamp NULL DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
    `id` bigint UNSIGNED NOT NULL,
    `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
    (1, 'admin', 'web', '2024-10-05 13:08:50', '2024-10-05 13:08:50'),
    (2, 'user', 'web', '2024-10-05 13:08:50', '2024-10-05 13:08:50');

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
    `permission_id` bigint UNSIGNED NOT NULL,
    `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
    `id` bigint UNSIGNED NOT NULL,
    `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    `password` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
   (1, 'User', 'user@example.com', '2024-10-05 13:08:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3IvOUED3Pe', '2024-10-05 13:08:50', '2024-10-05 13:08:50'),
   (2, 'Admin User', 'admin@example.com', '2024-10-05 13:08:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KfOaWOzfHX', '2024-10-05 13:08:50', '2024-10-05 13:08:50');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
    ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
    ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
    ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Индексы таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
    ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
    ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
    ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
    ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;
