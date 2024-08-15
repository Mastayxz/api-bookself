-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table api-bookself.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_isbn_unique` (`isbn`),
  KEY `books_user_id_foreign` (`user_id`),
  CONSTRAINT `books_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api-bookself.books: ~3 rows (approximately)
INSERT INTO `books` (`id`, `user_id`, `isbn`, `title`, `subtitle`, `author`, `published`, `publisher`, `pages`, `description`, `website`, `created_at`, `updated_at`) VALUES
	(2, 2, '9781491943534', 'Practical Modern PHP', 'Dive into ES6 and the Future of PHP', 'Nicolás Bevacqua', '2017-07-16 00:00:00', 'O\'Reilly Media', 334, 'To get the most out of modern PHP, you need learn the latest features of its parent specification, ECMAScript 6 (ES6). Thisbook provides a highly practical look at ES6, without getting lost in the specification or its implementation details.', 'https://github.com/mphp/practical-modern-php', '2024-08-14 23:53:02', '2024-08-14 23:53:02'),
	(3, 2, '9781491943535', 'Practical Modern API', 'Dive into ES6 and the Future of PHP', 'Nicolás Bevacqua', '2017-07-16 00:00:00', 'O\'Reilly Moneri', 335, 'To get the most out of modern API, you need learn the latest features of its parent specification, ECMAScript 6 (ES6). Thisbook provides a highly practical look at ES6, without getting lost in the specification or its implementation details.', 'https://github.com/mphp/practical-modern-php', '2024-08-15 00:01:53', '2024-08-15 00:01:53'),
	(4, 1, '9781491943536', 'Updated Book Title', 'Updated Subtitle', 'Updated Author', '2024-08-01', 'Updated Publisher', 300, 'Updated description', 'https://updated-example.com', '2024-08-15 00:02:40', '2024-08-15 00:10:25'),
	(5, 3, '9781986416498', 'Molestias sit dolores nemo at ut dolorem tempore.', 'Officia porro sint ipsum aspernatur officiis.', 'Prof. Waldo Walsh II', '1985-01-09', 'Walsh, Crist and Weimann', 661, 'Velit fugit harum ea animi id quaerat nobis corporis. A soluta officiis sunt in. Ut accusamus earum et voluptate omnis distinctio blanditiis consequuntur. Doloribus fuga alias nam nemo.', 'http://www.mccullough.com/quasi-architecto-quasi-accusantium-sunt', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(6, 4, '9791657589833', 'Officia blanditiis ut aut consequatur molestiae molestiae veniam et.', 'Aperiam perspiciatis et maxime quibusdam eveniet suscipit itaque.', 'Prof. Charlotte Douglas I', '2017-02-07', 'Runte, Yost and Douglas', 232, 'Doloremque eligendi perspiciatis dolor cumque sunt sit dolor. Non aliquam aliquid dolor. Praesentium voluptas voluptatem libero. Veniam sint molestias et in excepturi facilis laboriosam. Ut voluptas fuga ducimus commodi natus omnis ullam.', 'http://reilly.net/provident-sapiente-adipisci-ut-et-dolorum', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(7, 5, '9799999185867', 'Ipsum voluptatem cupiditate nostrum laboriosam.', 'Voluptatem et in et hic.', 'Rocky Leuschke Jr.', '2023-07-28', 'Beer Ltd', 798, 'Fuga qui sit nihil. Aperiam qui vel esse aperiam ipsum et temporibus et. Recusandae rerum fugit sapiente totam ut excepturi. Qui optio sit aspernatur id qui eaque.', 'https://www.jast.com/repudiandae-deleniti-voluptas-veniam-fugiat-minus-qui', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(8, 6, '9784269111011', 'Dolores laborum quis quia ut animi.', 'Quisquam beatae expedita sequi omnis.', 'Franz Halvorson', '1993-02-15', 'Kassulke-Little', 291, 'Ea ut ipsa facere rerum. Placeat adipisci ducimus qui perspiciatis molestiae doloribus. Voluptatum voluptatem qui quia voluptatum sit debitis sed.', 'http://bins.com/minima-autem-et-et-deleniti-culpa', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(9, 7, '9785286818648', 'Animi et aut ea sit corporis minima.', 'Eaque libero quia cumque cupiditate quia quae excepturi.', 'Aglae Baumbach', '1990-12-11', 'Schaden, Murphy and Witting', 509, 'Est voluptatibus dolores aut velit magnam. Iusto tempore qui alias est. Eveniet et harum iste quo cupiditate distinctio quod. Aliquam veritatis et exercitationem.', 'http://hoeger.com/facilis-dolorem-sunt-autem-ratione-fugiat-est', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(10, 8, '9782550063582', 'In qui sed itaque rerum consequatur non pariatur.', 'Et quo atque voluptatem aut et qui sequi odit.', 'Lois Goodwin', '1978-01-30', 'Casper, Beatty and Gleason', 264, 'Possimus et magni ducimus sint consectetur. Delectus eos occaecati vitae sit necessitatibus. Qui repudiandae mollitia ea aut.', 'http://cremin.com/mollitia-recusandae-perferendis-ut.html', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(11, 9, '9783278227942', 'Explicabo non aspernatur aliquid at dolorem non atque est.', 'Voluptatem facere tenetur aut repellendus eum nesciunt.', 'Dr. Lamar Waelchi', '2013-02-04', 'Wintheiser, Shanahan and Gerhold', 552, 'Repudiandae ut ut eum qui inventore. Eligendi nostrum et sint. Ex quaerat autem maxime dolor.', 'http://www.fisher.com/sit-ut-est-qui-rerum-odio-et-quia', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(12, 10, '9793271325095', 'Voluptas facilis et recusandae soluta.', 'Praesentium consequatur quas deleniti omnis quia iure et aperiam.', 'Prof. Rosalyn Veum', '2006-01-04', 'McKenzie, Gerhold and Kling', 227, 'Optio sit in tenetur in architecto sint alias. Facere cupiditate et et molestiae molestiae officia molestiae. Fugit dicta qui vitae et qui alias.', 'http://lebsack.org/qui-praesentium-debitis-voluptatem-blanditiis-veritatis-rerum-reprehenderit-quibusdam', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(13, 11, '9780668624565', 'Assumenda sed quis maxime praesentium a quaerat ullam aspernatur.', 'Est earum placeat blanditiis laudantium suscipit aut qui.', 'Georgianna Heathcote IV', '2023-07-17', 'Block-DuBuque', 205, 'Sunt eos exercitationem et velit. Eos aliquid autem qui ut dolorem. Harum quo nam blanditiis consequatur provident molestiae. Occaecati soluta et nihil et modi accusantium. Ipsam sed inventore distinctio consequatur ratione impedit distinctio.', 'http://www.bosco.com/voluptas-unde-voluptatum-excepturi-aliquam-reprehenderit', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(14, 12, '9781642616392', 'Dolor omnis aut quidem quaerat nostrum perspiciatis ut.', 'Rerum quod ex ut non itaque enim qui.', 'Dr. Era McLaughlin DDS', '1987-03-04', 'Franecki-Konopelski', 502, 'Quas rerum ipsum tenetur debitis et amet. Quia quam distinctio consectetur dolor.', 'http://www.miller.org/fuga-ut-est-sint-consequatur-eius-culpa', '2024-08-15 00:49:16', '2024-08-15 00:49:16');

-- Dumping structure for table api-bookself.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api-bookself.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table api-bookself.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api-bookself.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_08_15_052223_create_books_table', 1),
	(6, '2024_08_15_071739_add_user_id_to_books_table', 1);

-- Dumping structure for table api-bookself.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api-bookself.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table api-bookself.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api-bookself.personal_access_tokens: ~3 rows (approximately)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 2, 'api-token', '50f7ace5f5dad3580082e10457406539a08fe9e91e1fe1f4303863657dcba911', '["*"]', '2024-08-15 00:10:37', NULL, '2024-08-14 23:47:56', '2024-08-15 00:10:37'),
	(2, 'App\\Models\\User', 1, 'api-token', '65854df959b01c570813f9a34051b45a6d33c07ccbaaaa4f4506b476d07fa500', '["*"]', '2024-08-15 00:51:15', NULL, '2024-08-14 23:55:51', '2024-08-15 00:51:15'),
	(3, 'App\\Models\\User', 2, 'api-token', '715ead67cceb9b799f84948ef60450a4ba7e0f2ba3799eccc2ec35a1808fc2be', '["*"]', '2024-08-15 00:38:51', NULL, '2024-08-15 00:38:18', '2024-08-15 00:38:51'),
	(4, 'App\\Models\\User', 7, 'api-token', '76babac4d0f901bbad00cb1d047b956e5bdf8a83b2938f444f06d4f1d366dbdc', '["*"]', '2024-08-15 01:16:43', NULL, '2024-08-15 00:50:31', '2024-08-15 01:16:43');

-- Dumping structure for table api-bookself.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table api-bookself.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'Dominal', 'dominal@example.com', '$2y$12$zf.D8ZNcjEtdI5DReQt/lOQMkW0IygO7NrNNYWLqRVumC7Ibn0qPG', '2024-08-14 23:47:31', '2024-08-14 23:47:31'),
	(2, 'masta', 'masta@example.com', '$2y$12$IeU1mnM2kALNiGlLT83hROqx55N42CbCGH1GH6FTwDrPFxWa5tTLG', '2024-08-14 23:47:46', '2024-08-14 23:47:46'),
	(3, 'Ms. Allie Hoeger I', 'jacinto.smitham@example.org', '$2y$12$yGVsR4VDEutz48ZTSWNJie2RhD7Je3t.XVEu9uhimyGyfKjECXx92', '2024-08-15 00:49:12', '2024-08-15 00:49:12'),
	(4, 'Brionna Crist', 'gulgowski.vena@example.net', '$2y$12$/GYs1W4yk7zfCHSsVV9gmuMwu7yhMQxBaudUSjzOzxttccR5COZP6', '2024-08-15 00:49:13', '2024-08-15 00:49:13'),
	(5, 'Alexzander Thiel', 'jason73@example.org', '$2y$12$//I087/VQxRC1nVbN0cL8uoiXUfdQZau07j/UjSEfRu.vSD9SVe3e', '2024-08-15 00:49:13', '2024-08-15 00:49:13'),
	(6, 'Mrs. Kaelyn Ondricka', 'nlebsack@example.org', '$2y$12$43xwprwYseq.//66mrQoMe9/P.5i04sidMc.1X9Q6/u.wTEnks/U2', '2024-08-15 00:49:13', '2024-08-15 00:49:13'),
	(7, 'Amara Brekke', 'xbrekke@example.com', '$2y$12$OSJTHBOrMkR1J3TyjZuIje20ixGntChzhDVOuQwju3zaStefHS/7u', '2024-08-15 00:49:14', '2024-08-15 00:49:14'),
	(8, 'Izabella Kshlerin', 'duane06@example.net', '$2y$12$ivv1TqyiUBSDkPBcCzMUs.m.NcHo0fuREsMC/ELFLgAcekSbT0kcK', '2024-08-15 00:49:14', '2024-08-15 00:49:14'),
	(9, 'Hadley Kub', 'melisa.price@example.com', '$2y$12$19KhAdxuL5Bp8JRZS6oB4uxH7Gfm0t7cjDUJkw23P3edWxPd0j.Xm', '2024-08-15 00:49:15', '2024-08-15 00:49:15'),
	(10, 'Georgette Hodkiewicz', 'lstiedemann@example.org', '$2y$12$tHnAYSaYjTSfCSS5lPPa6e34hwKHjd2mWnd9G4e3xagtBxnbfyBnq', '2024-08-15 00:49:15', '2024-08-15 00:49:15'),
	(11, 'Dr. Kamille Weber V', 'okon.cristina@example.net', '$2y$12$N2s4Y36zmLZ69CTMdpv98.yEL.iigwTMqv64No/au31uGNxZYAhPO', '2024-08-15 00:49:16', '2024-08-15 00:49:16'),
	(12, 'Mr. Geovanni Green I', 'grady.alessandra@example.net', '$2y$12$bWk5dEBVIg7lkzW94NhOh.YcJy791cPM260S9qbgvxcbMiPCvrpkC', '2024-08-15 00:49:16', '2024-08-15 00:49:16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
