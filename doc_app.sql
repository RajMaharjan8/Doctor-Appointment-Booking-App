-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2023 at 04:19 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doc_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `doc_id` int(10) UNSIGNED NOT NULL,
  `date` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `doc_id`, `date`, `day`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 5, '6/13/2023', 'Monday', '10:00 AM', 'cancel', '2023-06-09 22:41:21', '2023-06-09 22:41:21'),
(2, 11, 16, '6/29/2023', 'Wednesday', '15:00 PM', 'complete', '2023-06-10 01:51:04', '2023-06-10 01:51:04'),
(3, 12, 5, '6/12/2023', 'Sunday', '11:00 AM', 'cancel', '2023-06-10 02:13:42', '2023-08-25 02:13:18'),
(4, 12, 5, '6/29/2023', 'Wednesday', '10:00 AM', 'cancel', '2023-06-10 02:16:14', '2023-08-25 02:13:23'),
(5, 12, 5, '6/11/2023', 'Saturday', '9:00 AM', 'cancel', '2023-06-10 03:16:36', '2023-08-25 02:13:21'),
(7, 11, 17, '6/11/2023', 'Sunday', '14:00 PM', 'cancel', '2023-06-10 03:28:38', '2023-08-03 10:45:05'),
(8, 12, 17, '6/11/2023', 'Sunday', '11:00 AM', 'cancel', '2023-06-10 03:33:44', '2023-08-25 02:13:24'),
(9, 11, 5, '6/20/2023', 'Tuesday', '10:00 AM', 'cancel', '2023-06-10 04:34:14', '2023-08-24 19:40:39'),
(10, 11, 5, '6/20/2023', 'Tuesday', '10:00 AM', 'cancel', '2023-06-10 04:36:04', '2023-08-24 19:40:44'),
(11, 11, 5, '6/20/2023', 'Tuesday', '10:00 AM', 'cancel', '2023-06-10 04:36:29', '2023-08-24 19:40:46'),
(12, 12, 17, '6/12/2023', 'Monday', '12:00 PM', 'cancel', '2023-06-10 20:32:27', '2023-08-25 02:13:27'),
(13, 12, 16, '6/12/2023', 'Monday', '10:00 AM', 'cancel', '2023-06-10 20:34:09', '2023-08-25 02:13:29'),
(14, 12, 16, '6/12/2023', 'Monday', '10:00 AM', 'cancel', '2023-06-10 20:34:31', '2023-08-25 02:13:31'),
(15, 12, 5, '6/11/2023', 'Sunday', '11:00 AM', 'cancel', '2023-06-11 03:48:05', '2023-08-25 02:13:33'),
(16, 11, 5, '6/20/2023', 'Tuesday', '11:00 AM', 'cancel', '2023-06-11 04:36:11', '2023-08-24 19:40:49'),
(17, 11, 17, '6/11/2023', 'Sunday', '15:00 PM', 'cancel', '2023-06-11 05:37:16', '2023-08-24 19:40:51'),
(18, 19, 5, '6/20/2023', 'Tuesday', '12:00 PM', 'upcoming', '2023-06-11 05:55:59', '2023-06-11 05:55:59'),
(19, 11, 5, '7/7/2023', 'Friday', '10:00 AM', 'cancel', '2023-06-30 09:53:39', '2023-08-24 19:40:56'),
(20, 11, 5, '7/3/2023', 'Monday', '10:00 AM', 'cancel', '2023-06-30 10:11:16', '2023-08-24 19:41:00'),
(21, 11, 5, '7/20/2023', 'Thursday', '11:00 AM', 'cancel', '2023-07-16 21:12:14', '2023-08-24 19:41:02'),
(29, 11, 17, '8/25/2023', 'Friday', '12:00 PM', 'complete', '2023-08-24 22:12:25', '2023-08-24 22:12:44'),
(30, 11, 17, '8/25/2023', 'Friday', '13:00 PM', 'complete', '2023-08-24 22:23:56', '2023-08-24 22:41:42'),
(34, 11, 17, '8/25/2023', 'Friday', '15:00 PM', 'complete', '2023-08-25 02:22:55', '2023-08-25 02:23:41'),
(35, 11, 17, '8/25/2023', 'Friday', '15:00 PM', 'complete', '2023-08-25 03:24:23', '2023-08-25 03:27:20'),
(36, 11, 16, '9/21/2023', 'Thursday', '10:00 AM', 'cancel', '2023-09-13 20:19:43', '2023-09-13 20:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(10) UNSIGNED NOT NULL,
  `doc_id` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `patients` int(10) UNSIGNED DEFAULT NULL,
  `experience` int(10) UNSIGNED DEFAULT NULL,
  `bio_data` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `doc_id`, `category`, `patients`, `experience`, `bio_data`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Dental', 10, 10, 'I am a dental specialist', 'active', '2023-05-30 23:56:11', '2023-06-03 06:42:47'),
(4, 16, 'General', 3, 3, 'I completed my MBBS from Nepalese Army Institute of Health Sciences (NAIHS) College', 'active', '2023-06-09 05:57:10', '2023-06-09 06:03:43'),
(5, 17, 'Dental', 4, 4, 'I completed my dental studies from Saveetha Institute of Medical and Technical Sciences and have worked as an intern under Dr Arun Setia in India, Chennai.', 'active', '2023-06-09 06:04:48', '2023-06-09 06:07:08'),
(6, 18, 'Gynecology', 11, 5, 'I completed my Diplomate of Medicine (D.N.B.) in Gynecology from Icahn School of Medicine at Mount Sinai, US, New York.', 'active', '2023-06-09 06:07:41', '2023-06-09 06:10:08'),
(7, 20, NULL, NULL, NULL, NULL, 'active', '2023-08-24 19:36:17', '2023-08-24 19:36:17');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_05_31_042713_create_sessions_table', 1),
(7, '2023_05_31_044127_create_doctors_table', 1),
(8, '2023_05_31_044145_create_user_details_table', 1),
(9, '2023_06_10_022910_create_appointments_table', 2),
(10, '2023_08_25_012924_create_reviews_table', 3),
(11, '2023_08_25_052505_add_new_column', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'rajm48952@gmail.com', '63e6b3d5b1c484b95e4c2b903d00826e7a74f4306486efda3c5c46b1944309a5', '[\"*\"]', NULL, NULL, '2023-06-07 23:44:05', '2023-06-07 23:44:05'),
(2, 'App\\Models\\User', 8, 'rajm48952@gmail.com', '382f69f29a1e7d7d832e324c22a64adf2ac5c9fcea58efebaa7597237ebcbeda', '[\"*\"]', NULL, NULL, '2023-06-07 23:50:24', '2023-06-07 23:50:24'),
(3, 'App\\Models\\User', 8, 'rajm48952@gmail.com', 'f1cee55cb678f3487d0cf68d675d9b9d87a76dc208e31a5cd1d64e6f86c03b46', '[\"*\"]', NULL, NULL, '2023-06-07 23:52:54', '2023-06-07 23:52:54'),
(4, 'App\\Models\\User', 8, 'rajm48952@gmail.com', '5f6e59154bac623e579d85946bc4db2debba187c5db21eb9456ad7e50f9a59a7', '[\"*\"]', '2023-06-07 23:56:00', NULL, '2023-06-07 23:55:59', '2023-06-07 23:56:00'),
(5, 'App\\Models\\User', 8, 'rajm48952@gmail.com', '1ee6961a75a433cca874cd71c1aa0a2d1bb0ee822b842a5f67fb843371fb5621', '[\"*\"]', NULL, NULL, '2023-06-08 00:22:04', '2023-06-08 00:22:04'),
(6, 'App\\Models\\User', 8, 'rajm48952@gmail.com', 'd7f1d219b9aa48029711ad7bb137abd2deff83e0b2c162b3e7fb5343c8b15117', '[\"*\"]', '2023-06-08 00:24:43', NULL, '2023-06-08 00:24:42', '2023-06-08 00:24:43'),
(7, 'App\\Models\\User', 8, 'rajm48952@gmail.com', '36497da455152495478dfaf7178f321ffb14b74baaba76fb066dcaf3f02e4e0f', '[\"*\"]', '2023-06-08 00:28:36', NULL, '2023-06-08 00:28:35', '2023-06-08 00:28:36'),
(8, 'App\\Models\\User', 10, 'pramish@gmail.com', 'ca3346338816400957df13c4873ab5f0dcf63547f040793369bfb2d0ce76c83d', '[\"*\"]', '2023-06-08 01:18:03', NULL, '2023-06-08 01:18:02', '2023-06-08 01:18:03'),
(9, 'App\\Models\\User', 11, 'ashit@gmail.com', '4b2513e97e2ecf22a00d44d4ef71e2b2835e367fe6af5b6aa6b1dc252f74ebd3', '[\"*\"]', '2023-06-08 01:21:16', NULL, '2023-06-08 01:21:15', '2023-06-08 01:21:16'),
(10, 'App\\Models\\User', 12, 'sujal@gmail.com', '64a681f5b806e9b549af294d81d4e6b775825961be19684f3e41aba579b3b19e', '[\"*\"]', '2023-06-08 20:42:25', NULL, '2023-06-08 20:42:24', '2023-06-08 20:42:25'),
(11, 'App\\Models\\User', 12, 'sujal@gmail.com', 'af8c61a00525e644d0d8d1f97c79549712f2a4cdca55da63924e6bb8f7f41e82', '[\"*\"]', '2023-06-09 05:54:05', NULL, '2023-06-09 05:54:04', '2023-06-09 05:54:05'),
(12, 'App\\Models\\User', 12, 'sujal@gmail.com', '35c3590027c402404b4567fe88089b02b471664df3ae1d4173d8181a76a605e9', '[\"*\"]', '2023-06-09 06:14:05', NULL, '2023-06-09 06:14:04', '2023-06-09 06:14:05'),
(13, 'App\\Models\\User', 12, 'sujal@gmail.com', 'edeac2db2f0a6e22f7264bf168bac7035c6f3703add3504e62d18b353f25f3f1', '[\"*\"]', '2023-06-09 06:27:08', NULL, '2023-06-09 06:27:07', '2023-06-09 06:27:08'),
(14, 'App\\Models\\User', 12, 'sujal@gmail.com', 'd495956a986dae775a81fe43a86d5f4f37844145e583b9a12e560ced14f7ff28', '[\"*\"]', '2023-06-09 06:34:31', NULL, '2023-06-09 06:34:30', '2023-06-09 06:34:31'),
(15, 'App\\Models\\User', 12, 'sujal@gmail.com', '766562d6b63c2e08e00d8847e4d1e94f80542c54c461f3c533e5122c94a87268', '[\"*\"]', '2023-06-09 06:35:25', NULL, '2023-06-09 06:35:25', '2023-06-09 06:35:25'),
(16, 'App\\Models\\User', 12, 'sujal@gmail.com', 'd970b494e4d9fb28221f97cded3717bf956c9ef6c0d67e4a1ba9f69aa4661577', '[\"*\"]', '2023-06-09 06:39:14', NULL, '2023-06-09 06:39:13', '2023-06-09 06:39:14'),
(17, 'App\\Models\\User', 12, 'sujal@gmail.com', '642d41a7436fb74d6f1fe8282f2010dffbe887e814677368332636b7832ce301', '[\"*\"]', '2023-06-09 06:45:54', NULL, '2023-06-09 06:45:53', '2023-06-09 06:45:54'),
(18, 'App\\Models\\User', 12, 'sujal@gmail.com', '5f6a352c65433771e75741529c6585c14e63c73aa17373b16f4e66249e0399f1', '[\"*\"]', '2023-06-09 06:52:28', NULL, '2023-06-09 06:52:27', '2023-06-09 06:52:28'),
(19, 'App\\Models\\User', 12, 'sujal@gmail.com', '97152f231854cbb9d0f6099542048047acb398d72aea4df762240ebc6e46e1de', '[\"*\"]', '2023-06-09 06:58:00', NULL, '2023-06-09 06:57:59', '2023-06-09 06:58:00'),
(20, 'App\\Models\\User', 11, 'ashit@gmail.com', 'f9534bd8deadb987f0270d95fc9aff9343dacee11a07588677e43acf0a1e1561', '[\"*\"]', '2023-06-09 07:02:08', NULL, '2023-06-09 06:59:47', '2023-06-09 07:02:08'),
(21, 'App\\Models\\User', 12, 'sujal@gmail.com', '01aeb569c43e74d59de34f2c5beb8f8443c5f019226838d354d215e84174fdff', '[\"*\"]', '2023-06-09 07:03:00', NULL, '2023-06-09 07:03:00', '2023-06-09 07:03:00'),
(22, 'App\\Models\\User', 12, 'sujal@gmail.com', '894342b13e7ab1d40dbd1d8155237cae7676f7fea8f9c6d0ebde6bf6ec9d176a', '[\"*\"]', '2023-06-09 07:04:36', NULL, '2023-06-09 07:04:35', '2023-06-09 07:04:36'),
(23, 'App\\Models\\User', 11, 'ashit@gmail.com', '4ff86c4b3ab40d93d65f0bdd7d7e254e147210efe8eabd8b513aaf6dcd3958f6', '[\"*\"]', '2023-06-09 07:22:05', NULL, '2023-06-09 07:22:04', '2023-06-09 07:22:05'),
(24, 'App\\Models\\User', 11, 'ashit@gmail.com', '4367d3f2815ecc0cde85f2612c603c01b26e85cb8764710313a55217760fbb11', '[\"*\"]', '2023-06-09 07:24:13', NULL, '2023-06-09 07:24:13', '2023-06-09 07:24:13'),
(25, 'App\\Models\\User', 12, 'sujal@gmail.com', '98f9f19f17fa918696f7de68297d07de18fb1f5b2e95237c8105681a9246047f', '[\"*\"]', '2023-06-09 22:34:07', NULL, '2023-06-09 22:34:07', '2023-06-09 22:34:07'),
(26, 'App\\Models\\User', 12, 'sujal@gmail.com', '34f8fe6f88ddee5f60f63b3686c7cf23ca0971d3c50f0a291a8ce93f812c6494', '[\"*\"]', '2023-06-09 22:34:08', NULL, '2023-06-09 22:34:07', '2023-06-09 22:34:08'),
(27, 'App\\Models\\User', 11, 'ashit@gmail.com', '0269951e5b60ccc1d26a3cc5c466421e6b9f80c46c6c6b312aa5e7b334e03548', '[\"*\"]', '2023-06-09 22:35:50', NULL, '2023-06-09 22:35:49', '2023-06-09 22:35:50'),
(28, 'App\\Models\\User', 12, 'sujal@gmail.com', '09a73a92cc92bef5d49341c8f3d77f768898b3a6f67927052dfa4eb66c5a4469', '[\"*\"]', '2023-06-09 22:37:06', NULL, '2023-06-09 22:36:59', '2023-06-09 22:37:06'),
(29, 'App\\Models\\User', 11, 'ashit@gmail.com', '62916f25da1cc45cf9f42408b545256e56d67ecdd9165eb15e63e2c3e1baf7b1', '[\"*\"]', '2023-06-09 23:08:12', NULL, '2023-06-09 22:41:02', '2023-06-09 23:08:12'),
(30, 'App\\Models\\User', 11, 'ashit@gmail.com', 'e79dc16c64d728d9d6a2b353c061020bb720e496d6fec825793f830780d6b935', '[\"*\"]', '2023-06-09 23:11:46', NULL, '2023-06-09 23:11:43', '2023-06-09 23:11:46'),
(31, 'App\\Models\\User', 11, 'ashit@gmail.com', '1258100155b68a4c8ac351cdbc9cde35d9723fd3a5cfb7c6059cf2d89e5affb7', '[\"*\"]', '2023-06-09 23:24:14', NULL, '2023-06-09 23:11:45', '2023-06-09 23:24:14'),
(32, 'App\\Models\\User', 11, 'ashit@gmail.com', '6992ad91f793bb303742db3ecc0f722774db597009dd5c1fc081d7fabec10d6d', '[\"*\"]', '2023-06-10 01:52:19', NULL, '2023-06-10 01:48:30', '2023-06-10 01:52:19'),
(33, 'App\\Models\\User', 11, 'ashit@gmail.com', '251a16adf9d5e9e830e42780d212976b9fa89fc7135feff976a4cb2d9d71bb93', '[\"*\"]', '2023-06-10 01:53:06', NULL, '2023-06-10 01:52:52', '2023-06-10 01:53:06'),
(34, 'App\\Models\\User', 11, 'ashit@gmail.com', '5b69713f32904bed562c67c47f9aa9f34f020943ed65d5f392d139c1ac691e04', '[\"*\"]', '2023-06-10 02:12:33', NULL, '2023-06-10 02:11:32', '2023-06-10 02:12:33'),
(35, 'App\\Models\\User', 12, 'sujal@gmail.com', '0f374d02bcaa2512a6a2a4de5556883ec90f58b41ea7d37f69b9cf70a9e7347f', '[\"*\"]', '2023-06-10 02:13:45', NULL, '2023-06-10 02:13:29', '2023-06-10 02:13:45'),
(36, 'App\\Models\\User', 12, 'sujal@gmail.com', '27c24f89f165c748a3a84200fbcb0fc19d4277022543d08b1b83e03dba95a16c', '[\"*\"]', '2023-06-10 02:16:16', NULL, '2023-06-10 02:16:00', '2023-06-10 02:16:16'),
(37, 'App\\Models\\User', 12, 'sujal@gmail.com', '2e89540ad307f8f78856429a9a36f78d768482bcf23d7dface2bda809a0926de', '[\"*\"]', '2023-06-10 02:20:29', NULL, '2023-06-10 02:20:28', '2023-06-10 02:20:29'),
(38, 'App\\Models\\User', 11, 'ashit@gmail.com', '475a9845dbc1483748dc904181d9d6ee061c08299ea49d2907737bcd81064af7', '[\"*\"]', '2023-06-10 02:29:17', NULL, '2023-06-10 02:29:16', '2023-06-10 02:29:17'),
(39, 'App\\Models\\User', 11, 'ashit@gmail.com', '98f82ec97b706912c3905d4c640b98ca651518439f153eb5e8f33a248ac73b21', '[\"*\"]', '2023-06-10 02:37:21', NULL, '2023-06-10 02:37:18', '2023-06-10 02:37:21'),
(40, 'App\\Models\\User', 11, 'ashit@gmail.com', '369545227b764dc8757b640948e517032b39662fee62774bae5dc9aaea3cdb49', '[\"*\"]', '2023-06-10 02:45:25', NULL, '2023-06-10 02:45:22', '2023-06-10 02:45:25'),
(41, 'App\\Models\\User', 11, 'ashit@gmail.com', '20805602cd10109341e5564df2a3223538b6b5abec3720e465da8ec813c75b94', '[\"*\"]', '2023-06-10 02:47:42', NULL, '2023-06-10 02:47:38', '2023-06-10 02:47:42'),
(42, 'App\\Models\\User', 12, 'sujal@gmail.com', 'ba4ad343cc9be15434896ceebe3fdb1acb9cd59f4a82b1183abdefad4ba571fb', '[\"*\"]', '2023-06-10 03:14:54', NULL, '2023-06-10 03:14:53', '2023-06-10 03:14:54'),
(43, 'App\\Models\\User', 12, 'sujal@gmail.com', '3fc5b4ec89907af2b0dbed78565d08ae4e44e299952ceaf307c11af6dea56044', '[\"*\"]', '2023-06-10 03:17:44', NULL, '2023-06-10 03:16:08', '2023-06-10 03:17:44'),
(44, 'App\\Models\\User', 11, 'ashit@gmail.com', '952289a3677bd41fc16ab00995f92d3798e985f69f3812710b9b0a006d5eec46', '[\"*\"]', '2023-06-10 03:21:14', NULL, '2023-06-10 03:20:12', '2023-06-10 03:21:14'),
(45, 'App\\Models\\User', 11, 'ashit@gmail.com', 'e8df5ce059a85c418b0aef57345a06062684c11819357000b3ff00bf96d76435', '[\"*\"]', '2023-06-10 03:22:04', NULL, '2023-06-10 03:21:45', '2023-06-10 03:22:04'),
(46, 'App\\Models\\User', 11, 'ashit@gmail.com', 'f15de26d312f24eadf3b85b45acc49be4edec8aa763ffa88c2d7c49f221392e7', '[\"*\"]', '2023-06-10 03:25:29', NULL, '2023-06-10 03:25:09', '2023-06-10 03:25:29'),
(47, 'App\\Models\\User', 11, 'ashit@gmail.com', '4eaa2dadfc89bb74ea98ff08a5570302c17ae14882e35181db34ebfb49c6ac2a', '[\"*\"]', '2023-06-10 03:29:09', NULL, '2023-06-10 03:28:05', '2023-06-10 03:29:09'),
(48, 'App\\Models\\User', 12, 'sujal@gmail.com', 'a57a5125e07f15e7e05b63ffac79b9c6db5cf84c0aaadd8931e93f7822133f88', '[\"*\"]', '2023-06-10 03:34:41', NULL, '2023-06-10 03:32:43', '2023-06-10 03:34:41'),
(49, 'App\\Models\\User', 11, 'ashit@gmail.com', '041634f63c4a10847c29319ac1ab1e5af37ecf7bd55387048c31fd201580ede9', '[\"*\"]', '2023-06-10 04:34:17', NULL, '2023-06-10 04:33:54', '2023-06-10 04:34:17'),
(50, 'App\\Models\\User', 11, 'ashit@gmail.com', 'f13624c308d30e4f0644b2c7216a0488ec5f3c8ceabd06f1ae36e76f55eb5436', '[\"*\"]', '2023-06-10 04:36:32', NULL, '2023-06-10 04:35:45', '2023-06-10 04:36:32'),
(51, 'App\\Models\\User', 12, 'sujal@gmail.com', '484fcda01fb6dc686702857fd08cf139903fd3ab2c3ee3ea6ce6ba5821c35283', '[\"*\"]', '2023-06-10 20:31:52', NULL, '2023-06-10 20:31:50', '2023-06-10 20:31:52'),
(52, 'App\\Models\\User', 12, 'sujal@gmail.com', 'f42ac5873560f008eca0b5e2699779a2ceeb8d158ccfa2889becb5951379de02', '[\"*\"]', '2023-06-10 20:34:41', NULL, '2023-06-10 20:31:50', '2023-06-10 20:34:41'),
(53, 'App\\Models\\User', 12, 'sujal@gmail.com', 'b294ccbac7b19164b2a71a94b5fd1e83a8ffd0f0006c9160075ec43134449b74', '[\"*\"]', '2023-06-11 04:11:36', NULL, '2023-06-11 03:47:35', '2023-06-11 04:11:36'),
(54, 'App\\Models\\User', 11, 'ashit@gmail.com', '9d776357c7dc3b4959ae5af6c3adb977f41442e3ccf908dde787537c4a81fbb7', '[\"*\"]', '2023-06-11 04:37:02', NULL, '2023-06-11 04:35:33', '2023-06-11 04:37:02'),
(55, 'App\\Models\\User', 12, 'sujal@gmail.com', '08f441472a73b8c117b10ca55cba656102ab59aaf12ab0fbac555a2477311ff4', '[\"*\"]', '2023-06-11 04:46:36', NULL, '2023-06-11 04:46:35', '2023-06-11 04:46:36'),
(56, 'App\\Models\\User', 12, 'sujal@gmail.com', '0a3670566096e653e7cd4f149cc160dd34178471e4adf82be763f8a9f01bda85', '[\"*\"]', '2023-06-11 04:56:53', NULL, '2023-06-11 04:55:43', '2023-06-11 04:56:53'),
(57, 'App\\Models\\User', 12, 'sujal@gmail.com', 'b7faef57b4abf6e4035556410a2fbe358bfb18db7e32a38dd028ae0be33372a3', '[\"*\"]', '2023-06-11 05:09:01', NULL, '2023-06-11 05:09:00', '2023-06-11 05:09:01'),
(58, 'App\\Models\\User', 11, 'ashit@gmail.com', '9765b9a2971629fffb26ff29ef7c9e26b02b2b0da012a64b13a3447ddbeab21f', '[\"*\"]', '2023-06-11 05:16:38', NULL, '2023-06-11 05:12:55', '2023-06-11 05:16:38'),
(59, 'App\\Models\\User', 11, 'ashit@gmail.com', 'a030e9d78d91d106ecaf26c3f6a2623c7a6cfe3b1547628f1e2a33bbd8d18a2d', '[\"*\"]', '2023-06-11 05:28:36', NULL, '2023-06-11 05:28:35', '2023-06-11 05:28:36'),
(60, 'App\\Models\\User', 11, 'ashit@gmail.com', '3b55fa261b4b3ee949b0211809934d3bde3fe000d1f7ec4f0f952790aed9b26b', '[\"*\"]', '2023-06-11 05:35:16', NULL, '2023-06-11 05:35:15', '2023-06-11 05:35:16'),
(61, 'App\\Models\\User', 11, 'ashit@gmail.com', '9d9a86ba950c503b081867b4f890dd101b7db3e3ca9f031a94ab7c04ec7817e8', '[\"*\"]', '2023-06-11 05:38:11', NULL, '2023-06-11 05:35:16', '2023-06-11 05:38:11'),
(62, 'App\\Models\\User', 19, 'pranav@gmail.com', 'a37a24b9f221bfe8adc51940cba47498f1c1e5268600b6f95bfb9d24dedfa4cf', '[\"*\"]', '2023-06-11 05:56:04', NULL, '2023-06-11 05:55:20', '2023-06-11 05:56:04'),
(63, 'App\\Models\\User', 11, 'ashit@gmail.com', '3972311cbb096d348bc677afe0af4b26443cf941d7451b326c910f76cd3fc1b5', '[\"*\"]', '2023-06-30 10:11:29', NULL, '2023-06-30 09:52:36', '2023-06-30 10:11:29'),
(64, 'App\\Models\\User', 11, 'ashit@gmail.com', '9523f3b84222b8938ace7f1b26a38d38fd18033668a3d8eff7ca8547c6ffb70b', '[\"*\"]', '2023-07-16 20:55:49', NULL, '2023-07-16 20:55:24', '2023-07-16 20:55:49'),
(65, 'App\\Models\\User', 11, 'ashit@gmail.com', '845313d43ac31142eb2afd87a8c7103cce5b13609bd1e16d761b884de1dd00e3', '[\"*\"]', '2023-07-16 21:12:22', NULL, '2023-07-16 21:11:42', '2023-07-16 21:12:22'),
(66, 'App\\Models\\User', 11, 'ashit@gmail.com', 'e21aaa6763665ab0c87ea71b0e2e979209a5f316e304d9f8481ae7abd697a995', '[\"*\"]', '2023-07-16 21:16:10', NULL, '2023-07-16 21:14:28', '2023-07-16 21:16:10'),
(67, 'App\\Models\\User', 11, 'ashit@gmail.com', 'dae16fa60dc0c7c69fdccfc19ad6693a7243165ab27d7a16f88a856cb4b53d55', '[\"*\"]', '2023-08-03 10:05:10', NULL, '2023-08-03 10:04:59', '2023-08-03 10:05:10'),
(68, 'App\\Models\\User', 11, 'ashit@gmail.com', '87f3f7c4e105220a11ff33936f233bc90ea42b46b0ed94384fe428719198053a', '[\"*\"]', '2023-08-03 10:09:00', NULL, '2023-08-03 10:08:06', '2023-08-03 10:09:00'),
(69, 'App\\Models\\User', 11, 'ashit@gmail.com', 'cb621b98ec58a786528aecba63381adb680684de78a23661182621684e58b6e0', '[\"*\"]', '2023-08-03 10:19:19', NULL, '2023-08-03 10:19:10', '2023-08-03 10:19:19'),
(70, 'App\\Models\\User', 11, 'ashit@gmail.com', '745f3e3806cff867e89278ab7d90791eeaf33c8d311bd4afb3c7f950d39aa598', '[\"*\"]', '2023-08-03 10:45:06', NULL, '2023-08-03 10:44:56', '2023-08-03 10:45:06'),
(71, 'App\\Models\\User', 11, 'ashit@gmail.com', 'b303c4579a5439d3ab2da513cdaea2507031bd1d8b972db19235c00cd0278c19', '[\"*\"]', '2023-08-03 10:52:10', NULL, '2023-08-03 10:51:53', '2023-08-03 10:52:10'),
(72, 'App\\Models\\User', 11, 'ashit@gmail.com', 'bccb56bebec1d20ed7f8bec7c0fe36e7da21f68f27404a261c69bf55faffea37', '[\"*\"]', '2023-08-03 11:00:44', NULL, '2023-08-03 10:59:39', '2023-08-03 11:00:44'),
(73, 'App\\Models\\User', 11, 'ashit@gmail.com', '06754a5c9bb2dd4641779f8c272f0045b5521293acd26732ff49f9fd8bcc0baf', '[\"*\"]', '2023-08-13 09:53:07', NULL, '2023-08-13 09:52:57', '2023-08-13 09:53:07'),
(74, 'App\\Models\\User', 11, 'ashit@gmail.com', '86cb6877c9cc050baaa76b204e43ea5180ddcacae97a49d0b73f937325d2ada7', '[\"*\"]', '2023-08-13 10:03:50', NULL, '2023-08-13 10:02:36', '2023-08-13 10:03:50'),
(75, 'App\\Models\\User', 11, 'ashit@gmail.com', '2145db01ba5a6b121f99b580aea00399b4578a6b0d4cd2dd56b465d84a322494', '[\"*\"]', '2023-08-13 10:07:21', NULL, '2023-08-13 10:07:20', '2023-08-13 10:07:21'),
(76, 'App\\Models\\User', 11, 'ashit@gmail.com', '90346699347e8e9ed9fc12d4eabc20f00cde4fd8a423925e535cb7508676af7d', '[\"*\"]', '2023-08-24 21:05:38', NULL, '2023-08-24 19:40:05', '2023-08-24 21:05:38'),
(77, 'App\\Models\\User', 11, 'ashit@gmail.com', '8d3cdca858a439f6131825b2e832603eee97ef2be2afefd9f4ed8784c1fa2e55', '[\"*\"]', '2023-08-24 21:50:47', NULL, '2023-08-24 21:50:46', '2023-08-24 21:50:47'),
(78, 'App\\Models\\User', 11, 'ashit@gmail.com', '63a89c0f53f295d46790196545a6f05b004476e6882c9a8522191e9a6b20e216', '[\"*\"]', '2023-08-24 22:03:05', NULL, '2023-08-24 21:50:46', '2023-08-24 22:03:05'),
(79, 'App\\Models\\User', 11, 'ashit@gmail.com', '2d624e741c7605d00f97ec6e2fd8844a81e95191d5bd99baa74446416f734716', '[\"*\"]', '2023-08-24 22:04:00', NULL, '2023-08-24 22:03:25', '2023-08-24 22:04:00'),
(80, 'App\\Models\\User', 11, 'ashit@gmail.com', '612a837db8e1a42778dedc7db69d15867d29657f96ac21e03b5ef7ca308fad03', '[\"*\"]', '2023-08-24 22:11:13', NULL, '2023-08-24 22:06:25', '2023-08-24 22:11:13'),
(81, 'App\\Models\\User', 11, 'ashit@gmail.com', 'e9b4dbaecd499d072c2fbbdddf93cb50a9f33e005721effcb453971d3c215fc8', '[\"*\"]', '2023-08-24 22:12:45', NULL, '2023-08-24 22:12:06', '2023-08-24 22:12:45'),
(82, 'App\\Models\\User', 11, 'ashit@gmail.com', 'bf33ab291e86b0b234e82971cafb960c7b28b60ec1f5863c21b91a1cff192447', '[\"*\"]', '2023-08-24 22:24:18', NULL, '2023-08-24 22:23:38', '2023-08-24 22:24:18'),
(83, 'App\\Models\\User', 11, 'ashit@gmail.com', 'dc83f342c2eb284d8e41f77c0dc51439055181637b4aec756d38773343d5eedb', '[\"*\"]', '2023-08-24 22:27:03', NULL, '2023-08-24 22:27:02', '2023-08-24 22:27:03'),
(84, 'App\\Models\\User', 11, 'ashit@gmail.com', 'c6ac55c082c61a8b175a5f245555e429d4d68797e7025806d3e1a5b58d1fffac', '[\"*\"]', '2023-08-24 22:28:13', NULL, '2023-08-24 22:28:13', '2023-08-24 22:28:13'),
(85, 'App\\Models\\User', 11, 'ashit@gmail.com', '4d95239eee6396f62db0de4e9444f9b103071f9cb3350e997790e3141716b960', '[\"*\"]', '2023-08-24 22:29:17', NULL, '2023-08-24 22:29:17', '2023-08-24 22:29:17'),
(86, 'App\\Models\\User', 11, 'ashit@gmail.com', 'a54c5518af843c763127202364a5e508673b4d8efc25594f5936975dc7e87d85', '[\"*\"]', '2023-08-24 22:33:19', NULL, '2023-08-24 22:30:47', '2023-08-24 22:33:19'),
(87, 'App\\Models\\User', 11, 'ashit@gmail.com', '1450e5b49a158220c8fa2bb31e4d1db5cfc6de227b6a871d6c2d9872d1c39d71', '[\"*\"]', '2023-08-24 22:33:58', NULL, '2023-08-24 22:33:57', '2023-08-24 22:33:58'),
(88, 'App\\Models\\User', 11, 'ashit@gmail.com', 'd140a58faae36d69b7b2410cb37606ba5c84342c5bfcb8590de596501267eef6', '[\"*\"]', '2023-08-24 22:37:31', NULL, '2023-08-24 22:34:46', '2023-08-24 22:37:31'),
(89, 'App\\Models\\User', 11, 'ashit@gmail.com', '1df91538c0a935031caafa796a70538c290f04ba18ba168ae015b10733bc7095', '[\"*\"]', '2023-08-24 23:37:56', NULL, '2023-08-24 22:41:29', '2023-08-24 23:37:56'),
(90, 'App\\Models\\User', 11, 'ashit@gmail.com', 'c5ab7ea18dbd63ac2fd4fbe421999e0c06e83a6564f2e922b49385f7a7a4f0fa', '[\"*\"]', '2023-08-25 00:43:52', NULL, '2023-08-25 00:43:51', '2023-08-25 00:43:52'),
(91, 'App\\Models\\User', 11, 'ashit@gmail.com', 'b46ce91e4c69a5521a8ddf9f42eb25361a74cc35efbb043747f9401a656d280b', '[\"*\"]', '2023-08-25 00:44:01', NULL, '2023-08-25 00:44:01', '2023-08-25 00:44:01'),
(92, 'App\\Models\\User', 11, 'ashit@gmail.com', '2a81547806d210e3985f2dca1f6ce8d26804fd28d0286c950b2c80ea0973bfae', '[\"*\"]', '2023-08-25 00:44:20', NULL, '2023-08-25 00:44:20', '2023-08-25 00:44:20'),
(93, 'App\\Models\\User', 11, 'ashit@gmail.com', 'e4e540875439cf2888a1e986e3103f271d54dadc6c4d8f49319991a63a897332', '[\"*\"]', '2023-08-25 00:46:49', NULL, '2023-08-25 00:46:48', '2023-08-25 00:46:49'),
(94, 'App\\Models\\User', 21, 'chirs@gmail.com', 'c3c2f6c226fc555388d94d4cd9553df0fa0b1fd1dd55a4c6116a60cee1bfb337', '[\"*\"]', NULL, NULL, '2023-08-25 00:48:39', '2023-08-25 00:48:39'),
(95, 'App\\Models\\User', 21, 'chirs@gmail.com', '4950b48f070a83c80e98e1d648e85991160fe270c017033a30cf79410483d028', '[\"*\"]', NULL, NULL, '2023-08-25 00:48:49', '2023-08-25 00:48:49'),
(96, 'App\\Models\\User', 21, 'chirs@gmail.com', '222e905133ee00f9b704a9bbbecbed77607b09031fb69059a30e39f8e2787d28', '[\"*\"]', NULL, NULL, '2023-08-25 00:48:49', '2023-08-25 00:48:49'),
(97, 'App\\Models\\User', 21, 'chirs@gmail.com', '98752aa315ae278c890bb14cebd77ad2fdc36f46d8f4ad56253da70141d00e00', '[\"*\"]', NULL, NULL, '2023-08-25 00:48:50', '2023-08-25 00:48:50'),
(98, 'App\\Models\\User', 21, 'chirs@gmail.com', 'b15a59820f5c1be652a758cc2ed077ba1f684f1a01d4e6a3b08f70364a001caf', '[\"*\"]', NULL, NULL, '2023-08-25 00:48:50', '2023-08-25 00:48:50'),
(99, 'App\\Models\\User', 11, 'ashit@gmail.com', '31b49b48122bd6a0cfc86e84c1b2dd1c08dc8e278444cbeed7386651456db688', '[\"*\"]', '2023-08-25 01:22:12', NULL, '2023-08-25 01:22:06', '2023-08-25 01:22:12'),
(100, 'App\\Models\\User', 11, 'ashit@gmail.com', '99d3e6beaec0f9c21e4c59ae4a70febcdede78b68f1315f1454676eecd7ed74e', '[\"*\"]', '2023-08-25 01:56:49', NULL, '2023-08-25 01:26:00', '2023-08-25 01:56:49'),
(104, 'App\\Models\\User', 26, 'rahul1@gmail.com', 'b875169515eaaaf925cc45a90dc50c1f28b6e665d4d9c70ff29ae2c2c7fe2935', '[\"*\"]', NULL, NULL, '2023-08-25 02:17:36', '2023-08-25 02:17:36'),
(105, 'App\\Models\\User', 27, 'mira12@gmail.com', '54ee27591459bed4fa8f4f70be12b3741eb3ef4b6064a82695e6a90bfb97f652', '[\"*\"]', NULL, NULL, '2023-08-25 02:18:28', '2023-08-25 02:18:28'),
(110, 'App\\Models\\User', 11, 'ashit@gmail.com', 'f2d9954aeaffd8b32b343ddf49805002d87a381bc0040a13fd176c352a66f9d1', '[\"*\"]', '2023-08-25 02:24:09', NULL, '2023-08-25 02:24:03', '2023-08-25 02:24:09'),
(113, 'App\\Models\\User', 11, 'ashit@gmail.com', 'dcd0f7cba12b18b1034815f25f40d42288321eda2875fe2b5b59275dbf67295c', '[\"*\"]', '2023-08-25 03:28:08', NULL, '2023-08-25 03:27:45', '2023-08-25 03:28:08'),
(115, 'App\\Models\\User', 11, 'ashit@gmail.com', 'ac39ed896f8f93de094dc770eebd315a89e221ac3e68915f5ba52ffa6bc623bf', '[\"*\"]', '2023-09-13 20:06:51', NULL, '2023-09-13 20:06:50', '2023-09-13 20:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `doc_id` int(10) UNSIGNED NOT NULL,
  `ratings` int(10) UNSIGNED DEFAULT NULL,
  `reviews` longtext DEFAULT NULL,
  `reviewed_by` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `doc_id`, `ratings`, `reviews`, `reviewed_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 17, 4, 'Very Friendly and caring', 'Ashit Shakya', 'active', '2023-08-25 01:42:21', '2023-08-25 01:42:21'),
(2, 12, 17, 3, 'Very much friendly', 'Sujal Shakya', 'active', '2023-08-17 01:42:21', '2023-08-17 01:42:21'),
(3, 11, 17, 5, 'Kind and very very helpful doctor', 'Ashit', 'active', '2023-08-24 21:51:46', '2023-08-24 21:51:46'),
(5, 11, 17, 5, 'good', 'Ashit', 'active', '2023-08-24 22:06:41', '2023-08-24 22:06:41'),
(7, 11, 17, 5, 'op', 'Ashit', 'active', '2023-08-24 22:11:13', '2023-08-24 22:11:13'),
(8, 11, 17, 5, 'very good', 'Ashit', 'active', '2023-08-24 22:12:44', '2023-08-24 22:12:44'),
(11, 11, 17, 1, 'very very good', 'Ashit', 'active', '2023-08-24 22:41:42', '2023-08-24 22:41:42'),
(12, 11, 17, 5, 'nice', 'Ashit', 'active', '2023-08-24 22:41:51', '2023-08-24 22:41:51'),
(14, 12, 5, 4, 'good doctor', 'sujal', 'active', '2023-08-25 02:20:47', '2023-08-25 02:20:47'),
(15, 12, 5, 1, NULL, 'sujal', 'active', '2023-08-25 02:20:59', '2023-08-25 02:20:59'),
(16, 12, 5, 1, NULL, 'sujal', 'active', '2023-08-25 02:21:18', '2023-08-25 02:21:18'),
(17, 11, 17, 5, 'best doctor', 'Ashit', 'active', '2023-08-25 02:23:41', '2023-08-25 02:23:41'),
(18, 11, 17, 2, 'satisfied', 'Ashit', 'active', '2023-08-25 03:27:20', '2023-08-25 03:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2T2yAPhRYiEkD8jxZQuQ3cwWHG97FpNmA7vrGP0n', NULL, '192.168.100.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWtKVW44Wk9DV3puOFVEMHhPc3pPQXBtU0xEaW90TlE5c3pKakxDWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xOTIuMTY4LjEwMC43NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1692934764),
('AjFYD48VPw1TCN4VSc4sUTh4NJ2KBhC7tqzp7sRX', NULL, '192.168.100.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicER3c3gwSmZ5VklmcXNVREpRY0U3UjB4WjNkbFhRRUFkYjBPQU5wbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjEwMC43Ni9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1692926164),
('Au50TjVZuNOGrsvATTz5pyAstGZ209Z90Ud4p4Gb', 17, '192.168.100.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia2x3REZsVzhEVkpFajMxN2s3Tkx1QWNTandjZURaTmg3R0FOd0NtcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjEwMC43Ni9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCR1Z1BHdVNXVXFEb2FmbmFpSjZUbmdlSktSSmtyaWR1cXZiVlc2QzMwR3VhNERVT3RLRERaQyI7fQ==', 1692937671);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(4, 'chintu', 'user', 'chintu1122@gmail.com', NULL, '$2y$10$t5.sZdsuPs5SPjUT.15rWuPxZe2qKBU5PVD8.Xwaj0uReUrq8BrlW', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 23:55:09', '2023-05-30 23:55:09'),
(5, 'Raj Maharjan', 'doctor', 'raj1122@gmail.com', NULL, '$2y$10$6f6Jef0LDA/FrWoovTvn4.T5btUgbj593FMCRwhnLK.n1R/84yxY6', NULL, NULL, NULL, NULL, NULL, 'profile-photos/yZFm2lSyg1OMFsnRGSHug7niob8XsNryOxpHeAl3.jpg', '2023-05-30 23:56:11', '2023-06-03 06:40:43'),
(6, 'Chintu Maharjan', 'doctor', 'chintu1@gmail.com', NULL, '$2y$10$0JtJmWhvK8R0mmZrxsaMgOqtNeauBFpEsw3ImqwT5nenCMoo4/Lhi', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 00:08:57', '2023-05-31 00:08:57'),
(7, 'raj', 'user', 'rajm@gmail.com', NULL, 'raj123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Raj Maharjan', 'doctor', 'rajm48952@gmail.com', NULL, '$2y$10$i6iLZhdCiq/q0XiYHBZMqOzZ4K6cO64AMVsjA3NeqmrxDvaXUhs9K', NULL, NULL, NULL, 'hVo5GP08lq9UosW2MwGr65sI5nR74ZucXCdcx3rBIH2bGaLmUOvhWdUMmqbl', NULL, NULL, '2023-06-07 20:05:13', '2023-06-07 20:05:13'),
(9, 'Avinna', 'user', 'avinna@gmail.com', NULL, '$2y$10$/G6Deoo0EZeEoMH.5mD1q.uRfU.eQP.VZafHUiaU0tI.0laMHj3Nm', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 01:12:27', '2023-06-08 01:12:27'),
(10, 'pramish', 'user', 'pramish@gmail.com', NULL, '$2y$10$Mh8TPh1HAzli9DLp8Vz/4ujD4.SV1S0YXx9pFvf1peDKVeSKkAJkS', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 01:17:39', '2023-06-08 01:17:39'),
(11, 'Ashit', 'user', 'ashit@gmail.com', NULL, '$2y$10$mKqTPOxw1Rf7.NEDFV.iV.dBJt/kaqWsTAeirq8Hjtw1SxYmd0nsa', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 01:21:15', '2023-06-08 01:21:15'),
(12, 'sujal', 'user', 'sujal@gmail.com', NULL, '$2y$10$vDuVYB3P1/6Ymb6o08B9N.W6mQMaJt/352Mj8Cwt.Q84HT8c0YVKm', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 01:24:17', '2023-06-08 01:24:17'),
(14, 'hinata', 'user', 'hinata@gmail.com', NULL, '$2y$10$/32ckvUqDlece667CHRVDOKtkLWwjLyZ.rtSnA7/ShVqhLyL/E3Ai', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 20:41:01', '2023-06-08 20:41:01'),
(16, 'Pramish Thapa', 'doctor', 'pramish123@gmail.com', NULL, '$2y$10$mAAD6CWIBV4/MfF/X1Xd9.hggqnpAlig9W40bBXSeqWDzKba8/89S', NULL, NULL, NULL, NULL, NULL, 'profile-photos/3qwR3JU4fqUsanBTi2m7fDRqRcLYYmlWqPgUJwIn.jpg', '2023-06-09 05:57:10', '2023-06-09 06:03:43'),
(17, 'Rasmika Mandana', 'doctor', 'rasmika123@gmail.com', NULL, '$2y$10$ugPGuSWUqDoafnaiJ6TngeJKRJkriduqvbVW6C30Gua4DUOtKDDZC', NULL, NULL, NULL, NULL, NULL, 'profile-photos/qtLyMsSPgpC4I3bh7ENOgYkKYebjXgnfcsetkPdx.jpg', '2023-06-09 06:04:48', '2023-06-09 06:07:08'),
(18, 'Prabhash Maharjan', 'doctor', 'prabhash123@gmail.com', NULL, '$2y$10$vsyqsKrdHANc68QJuncPa.V6CZIzN0F/aN.zM7t0kIbFTmYnNiAKG', NULL, NULL, NULL, NULL, NULL, 'profile-photos/jSKe5avUnBFMlg5bLqZQRguuqAgXHeFLPlDDJZXz.jpg', '2023-06-09 06:07:41', '2023-06-09 06:10:08'),
(19, 'Pranav', 'user', 'pranav@gmail.com', NULL, '$2y$10$ROOHvY4/EhK0783pYOp7qu2TiMJ/uNJBlegfCP74JPdjcqKEgJti6', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 05:55:20', '2023-06-11 05:55:20'),
(20, 'Avinna Maharjan', 'doctor', 'avinnamaharjan@gmail.com', NULL, '$2y$10$AUxg6c0piUvQt2plmdZ2xuPy9wBuZkHOCbwAEHD36QaJFJLR.Gu6a', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-24 19:36:17', '2023-08-24 19:36:17'),
(21, 'Chris Dangol', 'user', 'chirs@gmail.com', NULL, '$2y$10$EpvtnwLbIgy35zobgqEfTumn4QAoBKhzBKbxDOKikEG8EY40/oAaG', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-25 00:48:39', '2023-08-25 00:48:39'),
(26, 'rahul', 'user', 'rahul1@gmail.com', NULL, '$2y$10$dFg/I2U6YAXKnj8a7qOlseposvPyMyn7opZWNFSnHXtUrFtb.IAv2', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-25 02:17:34', '2023-08-25 02:17:34'),
(27, 'Mira Thapa', 'user', 'mira12@gmail.com', NULL, '$2y$10$eKjI.22gdlzMOgJWPAOgAeI2UAIiBS5iP4gtTHy28qKuFqnyEFuGm', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-25 02:18:27', '2023-08-25 02:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `bio_data` longtext DEFAULT NULL,
  `fav` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fav`)),
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `bio_data`, `fav`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, NULL, NULL, 'active', '2023-05-30 23:55:09', '2023-05-30 23:55:09'),
(2, 9, NULL, NULL, 'active', '2023-06-08 01:12:27', '2023-06-08 01:12:27'),
(3, 10, NULL, NULL, 'active', '2023-06-08 01:17:39', '2023-06-08 01:17:39'),
(4, 11, NULL, '[17]', 'active', '2023-06-08 01:21:15', '2023-09-13 20:20:02'),
(5, 12, NULL, NULL, 'active', '2023-06-08 01:24:17', '2023-06-08 01:24:17'),
(6, 14, NULL, NULL, 'active', '2023-06-08 20:41:02', '2023-06-08 20:41:02'),
(7, 19, NULL, NULL, 'active', '2023-06-11 05:55:20', '2023-06-11 05:55:20'),
(8, 21, NULL, NULL, 'active', '2023-08-25 00:48:39', '2023-08-25 00:48:39'),
(9, 26, NULL, NULL, 'active', '2023-08-25 02:17:34', '2023-08-25 02:17:34'),
(10, 27, NULL, NULL, 'active', '2023-08-25 02:18:27', '2023-08-25 02:18:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_user_id_foreign` (`user_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_doc_id_unique` (`doc_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_details_user_id_unique` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_doc_id_foreign` FOREIGN KEY (`doc_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
