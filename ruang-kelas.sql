-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jadwals`;
CREATE TABLE `jadwals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` bigint(255) unsigned DEFAULT NULL,
  `hari` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jam` double DEFAULT NULL,
  `matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `sifat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jadwals` (`id`, `nama`, `hari`, `jam`, `matakuliah`, `sks`, `sifat`, `dosen`, `ruang`, `deleted_at`, `created_at`, `updated_at`) VALUES
(12,	NULL,	'senin',	8,	NULL,	2,	'praktek',	'farida dwi',	'ruang 1',	NULL,	'2021-08-22 18:19:23',	'2021-08-22 18:19:23');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2020_05_21_100000_create_teams_table',	1),
(7,	'2020_05_21_200000_create_team_user_table',	1),
(8,	'2020_05_21_300000_create_team_invitations_table',	1),
(9,	'2021_08_11_140212_create_sessions_table',	1),
(10,	'2021_08_12_150233_create_ruangs_table',	2),
(11,	'2021_08_12_152850_create_proses_table',	2),
(12,	'2021_08_12_153455_create_jadwals_table',	2);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1,	'App\\Models\\User',	1,	'authToken',	'07f67cd96e2775a6c3ffc1ca89d40e8668d69c877b5098d65f7d345b27ee371b',	'[\"*\"]',	NULL,	'2021-08-15 22:21:21',	'2021-08-15 22:21:21'),
(2,	'App\\Models\\User',	1,	'authToken',	'c3d042a2f17fa9e7e811a34da8fc4c82cec983e2835eb4c8c83be12a0107db57',	'[\"*\"]',	NULL,	'2021-08-15 22:39:14',	'2021-08-15 22:39:14'),
(3,	'App\\Models\\User',	1,	'authToken',	'c4cb97811dc46de475cee4f3aecfae158f9831058eb48bcb6afdbbcf09b15bec',	'[\"*\"]',	NULL,	'2021-08-15 22:40:40',	'2021-08-15 22:40:40'),
(4,	'App\\Models\\User',	1,	'authToken',	'b66ddded2a0f36a360a4a62dd29b2d6dd5b47d19e8c7a951a2e1f246a28d2a7e',	'[\"*\"]',	NULL,	'2021-08-15 22:43:33',	'2021-08-15 22:43:33'),
(5,	'App\\Models\\User',	1,	'authToken',	'5a22e5e2a830d01c1b333421a8cd6223d15b994054ed9ffdec34b5db176692dd',	'[\"*\"]',	NULL,	'2021-08-17 00:00:50',	'2021-08-17 00:00:50'),
(6,	'App\\Models\\User',	1,	'authToken',	'f3cc9257654245e10313cebb9ee2962785ee0cd40b8ed6bd74804f672f34e40a',	'[\"*\"]',	NULL,	'2021-08-19 21:32:59',	'2021-08-19 21:32:59'),
(7,	'App\\Models\\User',	6,	'authToken',	'20178b2f8ecc8232be10baa3e06e76ebdcc95bd20f7349a1c62fbfafd1850f22',	'[\"*\"]',	NULL,	'2021-08-29 13:59:51',	'2021-08-29 13:59:51');

DROP TABLE IF EXISTS `proses`;
CREATE TABLE `proses` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `nomor` int(20) unsigned DEFAULT NULL,
  `hari` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tanggal` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jam` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ruang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ruangs`;
CREATE TABLE `ruangs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fasilitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lantai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ruangs` (`id`, `nama`, `fasilitas`, `lantai`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4,	'ruang 3',	'papan tulis',	'1',	NULL,	'2021-08-22 12:21:06',	'2021-08-22 12:21:06');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0ZBgwfNxSYApB1oC1YLJov1daIwxgIBYjvrwdcJP',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YToyOntzOjY6Il90b2tlbiI7czo0MDoicmxUclhwVzk4QmJHczBjNnJKZXQ4REFrQWVjZFlPdnFmVzR1akthVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1630770803),
('5MzOgGYi2W1g8V7mwWPB1MN0onAL7TiKtC8LIv6n',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGRLYmNFendVb3BjdTBac09BZnl6dG1aMzlvZElLa3lQNmF2TFMyQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1630844903),
('6LSgVVB4KWdBoTHLnHvsho1CRPhnnYD7n4ZNleOR',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNlh1TE9KcjJ4UVZEUURwcEZPbk5jcHgyOHlqRHFBZmU4T0JyU2dHbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9uWjB0Rjc4TVJmREovTE5uT0tycnVNMjBxLmp6Nk5QaXg1NzdTVFlCV2xxNjhoZFQxSUcyIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7fQ==',	1631604096),
('aIFzQWJe3SKByaI4jRTFSW3kZGmOlst528V0f3qq',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUR0ajZuelJpM0RhSHFjOGY0ZDFGdkhPT1NKb25KOHY3ZmJaMkZDeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1631696346),
('D18onp0LfZwblMpHyCSxlGWqGOSWWDRyPEPbaFSO',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36 Edg/93.0.961.38',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSDQwT2VWYWtIVmNiZUpXb0Z3akFNOE0xT2xXd0JZSUpxcVY3VEJXYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9uWjB0Rjc4TVJmREovTE5uT0tycnVNMjBxLmp6Nk5QaXg1NzdTVFlCV2xxNjhoZFQxSUcyIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7fQ==',	1631175474),
('e82C4W83OPdG2jY9ylfazeb4beSJt09LYXBzaARU',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmpkNkt1Q05vcGphdEkxYkl2a0ZOb2JldFJ2cVBzVTBWTVExSXpmOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MzoiaHR0cDovL3Jlc2VydmFzaS1ydWFuZy1rZWxhcy50ZXN0L2Rhc2hib2FyZCI7fX0=',	1630230078),
('EYOBgjMfhh9I1e78TMYCVvd2wvx0gDFWCy7riAXX',	NULL,	'192.168.96.94',	'Mozilla/5.0 (Linux; Android 11; SM-A205F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMUlrRDJoNW14am9kcXJYYUZobDVlNUxNaTc2VE1HRGJEV2t1WjVEdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4Ljk2LjIyOjgwODAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM1OiJodHRwOi8vMTkyLjE2OC45Ni4yMjo4MDgwL2Rhc2hib2FyZCI7fX0=',	1631697280),
('J7SIAiIgdIREK0Jxb6ptzTUKpme6hG2A3C9QRz7r',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36 Edg/93.0.961.38',	'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGFWc3UyUGp4MGlPVWk1VmMyOFY1cmdWTjVqbGFFNE9yZm1aNENCTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1631175410),
('K9cIaodMTXChqNAIlibfJ2sSXfyWJCJ6LdbeTXW1',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36 Edg/93.0.961.38',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaE11bTNoNVhObHZhcnQxRVZXVWdnQW9yZUM0RjZlcURYVjA2RGlWeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9uWjB0Rjc4TVJmREovTE5uT0tycnVNMjBxLmp6Nk5QaXg1NzdTVFlCV2xxNjhoZFQxSUcyIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7fQ==',	1631552093),
('mdBZfFuqoyATAb0ESlbW8kRJ3xGyAxU9xIlSe2sS',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWpleVJPWlVFbXEzR0dyZzdJckN0QW4ya3NKcktqbXhZQ3FTUVd6TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1630227808),
('NuFROLySvksLGcLgY1vjwGLi95OQW0pdLouVahHz',	6,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYzJnemkxZmM5Vko5bTZLTkFYTnc0YzlkRjJrU2pHck9ZcVhPUXlNWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwOi8vcmVzZXJ2YXNpLXJ1YW5nLWtlbGFzLnRlc3QvZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGFpNFU4d1RtaVp3cHQ4VHhOeU8vQ2VXUWRZOUptUjM1aWpFQWNnc0htZnc2Q1hDQUpFSUVDIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRhaTRVOHdUbWlad3B0OFR4TnlPL0NlV1FkWTlKbVIzNWlqRUFjZ3NIbWZ3NkNYQ0FKRUlFQyI7fQ==',	1630221894),
('OHH7SBOkc1Z8YEAO2RaBV7LjrFcOrJjcrfEHcM7v',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36 Edg/93.0.961.38',	'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQURUbUlXM3V2bW9kVEZ2VkNlRk1DN2RzVkxUT1FrbU9LNTJpWEFhRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1631174442),
('pvKFTZMGskcPmPw4xPNOV1U6EGzqf24qA3aUNyqG',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicEVKaWV0SkVhSW5OcDRCdkhPRWlLWEdaU3ZOYWVpcEJVdTdYNVlXQiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwOi8vcmVzZXJ2YXNpLXJ1YW5nLWtlbGFzLnRlc3QvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9uWjB0Rjc4TVJmREovTE5uT0tycnVNMjBxLmp6Nk5QaXg1NzdTVFlCV2xxNjhoZFQxSUcyIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7fQ==',	1631558310),
('RbpiHXJ3AVebGAhnE2JZNUI07syl5KQzMsfFACSD',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1NaMjJ5cHROQlVDQm1MbWR1YzhHaFlzQTNvWHo4ckl0cEY5aHZhRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',	1630242207),
('RYI5QRehBMezMTT1rPNPCP1ZfSNBUIcEdgBzXYUe',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUTRuSUg0R04xdWZ4RTdWTU05YmtqaFFrZVA5MGpJdTRqSTQ0b2F3OCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1630421518),
('vwT3gYMtdGLFFsilaUrxZsDpld9e9xGg7Bw7Xh4T',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiald5T3I5N09MclZWRVQ3MmFhQ2xVdnZKZ0pPWXRIS2EzYjhTRTJkbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdDo4MDgwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0ODoiaHR0cDovL3Jlc2VydmFzaS1ydWFuZy1rZWxhcy50ZXN0OjgwODAvZGFzaGJvYXJkIjt9fQ==',	1631696358),
('yLoBTaoGPfcOZIfQUjeqw2Gf9O5DYto8Jnan5ZA8',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiblNUcWs0ZEhEdWVlRE5Zak1Zang3TWhGQ0cwNEZIT0NKU3NhTVdaaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdC9kYXNoYm9hcmQvcHJvc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkb25aMHRGNzhNUmZESi9MTm5PS3JydU0yMHEuano2TlBpeDU3N1NUWUJXbHE2OGhkVDFJRzIiO30=',	1630421795),
('ZIOhFHO3Ho0funBdU1fSTsXNqcbXpLqFpDvGwxe4',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoid0JUSXBhMTFKQWozUEhhUzJsRkhnaG1Bdmt2eXV6RVBYTFpDUUR4SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdC9kYXNoYm9hcmQvcHJvc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkb25aMHRGNzhNUmZESi9MTm5PS3JydU0yMHEuano2TlBpeDU3N1NUWUJXbHE2OGhkVDFJRzIiO30=',	1630844996),
('zWZL0jddSDxxsUu0VgAi4o6eovjW7hW1dURvkIiE',	4,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36 Edg/92.0.902.84',	'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidHgxeHQ5SmtmclZGb2VKVU00cUk4VnJxWFVWYkpEYkd4VXRqclpWciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9yZXNlcnZhc2ktcnVhbmcta2VsYXMudGVzdC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG9uWjB0Rjc4TVJmREovTE5uT0tycnVNMjBxLmp6Nk5QaXg1NzdTVFlCV2xxNjhoZFQxSUcyIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRvblowdEY3OE1SZkRKL0xObk9LcnJ1TTIwcS5qejZOUGl4NTc3U1RZQldscTY4aGRUMUlHMiI7fQ==',	1630770864);

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1,	1,	'isti\'s Team',	1,	'2021-08-12 22:56:06',	'2021-08-12 22:56:06'),
(2,	2,	'farida\'s Team',	1,	'2021-08-20 22:47:03',	'2021-08-20 22:47:03'),
(3,	4,	'Nurrosyid\'s Team',	1,	'2021-08-21 19:01:44',	'2021-08-21 19:01:44'),
(4,	6,	'Isti\'s Team',	1,	'2021-08-29 13:49:05',	'2021-08-29 13:49:05');

DROP TABLE IF EXISTS `team_invitations`;
CREATE TABLE `team_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `team_user`;
CREATE TABLE `team_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nim` int(50) DEFAULT NULL,
  `kelas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `nim`, `kelas`, `jurusan`, `roles`, `created_at`, `updated_at`) VALUES
(4,	'Nurrosyid Wanandi Putra',	'nurrosyid.wanandi19@gmail.com',	NULL,	'$2y$10$onZ0tF78MRfDJ/LNnOKrruM20q.jz6NPix577STYBWlq68hdT1IG2',	NULL,	NULL,	NULL,	3,	NULL,	NULL,	NULL,	NULL,	'ADMIN',	'2021-08-21 19:01:44',	'2021-08-21 20:18:04'),
(6,	'Isti Safitri',	'istisafitri2017@gmail.com',	NULL,	'$2y$10$ai4U8wTmiZwpt8TxNyO/CeWQdY9JmR35ijEAcgsHmfw6CXCAJEIEC',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USER',	'2021-08-29 13:49:04',	'2021-08-29 13:49:04');

-- 2021-09-15 09:27:07
