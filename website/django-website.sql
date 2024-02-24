-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2024 at 02:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django-website`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_tools_stats_cachedvalue`
--

CREATE TABLE `admin_tools_stats_cachedvalue` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `time_scale` varchar(90) NOT NULL,
  `operation` varchar(90) DEFAULT NULL,
  `operation_field_name` varchar(90) DEFAULT NULL,
  `filtered_value` varchar(512) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `dynamic_choices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`dynamic_choices`)),
  `multiple_series_choice_id` bigint(20) DEFAULT NULL,
  `stats_id` bigint(20) NOT NULL,
  `is_final` tinyint(1) NOT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_tools_stats_criteriatostatsm2m`
--

CREATE TABLE `admin_tools_stats_criteriatostatsm2m` (
  `id` bigint(20) NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL CHECK (`order` >= 0),
  `prefix` varchar(255) NOT NULL,
  `use_as` varchar(90) NOT NULL,
  `criteria_id` bigint(20) NOT NULL,
  `stats_id` bigint(20) NOT NULL,
  `default_option` varchar(255) NOT NULL,
  `choices_based_on_time_range` tinyint(1) NOT NULL,
  `count_limit` int(10) UNSIGNED DEFAULT NULL CHECK (`count_limit` >= 0),
  `recalculate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add cart', 9, 'add_cart'),
(34, 'Can change cart', 9, 'change_cart'),
(35, 'Can delete cart', 9, 'delete_cart'),
(36, 'Can view cart', 9, 'view_cart'),
(37, 'Can add wishlist', 10, 'add_wishlist'),
(38, 'Can change wishlist', 10, 'change_wishlist'),
(39, 'Can delete wishlist', 10, 'delete_wishlist'),
(40, 'Can view wishlist', 10, 'view_wishlist'),
(41, 'Can add order item', 11, 'add_orderitem'),
(42, 'Can change order item', 11, 'change_orderitem'),
(43, 'Can delete order item', 11, 'delete_orderitem'),
(44, 'Can view order item', 11, 'view_orderitem'),
(45, 'Can add order', 12, 'add_order'),
(46, 'Can change order', 12, 'change_order'),
(47, 'Can delete order', 12, 'delete_order'),
(48, 'Can view order', 12, 'view_order'),
(49, 'Can add profile', 13, 'add_profile'),
(50, 'Can change profile', 13, 'change_profile'),
(51, 'Can delete profile', 13, 'delete_profile'),
(52, 'Can view profile', 13, 'view_profile'),
(53, 'Can add news', 14, 'add_news'),
(54, 'Can change news', 14, 'change_news'),
(55, 'Can delete news', 14, 'delete_news'),
(56, 'Can view news', 14, 'view_news'),
(57, 'Can add dashboard stats', 15, 'add_dashboardstats'),
(58, 'Can change dashboard stats', 15, 'change_dashboardstats'),
(59, 'Can delete dashboard stats', 15, 'delete_dashboardstats'),
(60, 'Can view dashboard stats', 15, 'view_dashboardstats'),
(61, 'Can add dashboard stats criteria', 16, 'add_dashboardstatscriteria'),
(62, 'Can change dashboard stats criteria', 16, 'change_dashboardstatscriteria'),
(63, 'Can delete dashboard stats criteria', 16, 'delete_dashboardstatscriteria'),
(64, 'Can view dashboard stats criteria', 16, 'view_dashboardstatscriteria'),
(65, 'Can add criteria to stats m2m', 17, 'add_criteriatostatsm2m'),
(66, 'Can change criteria to stats m2m', 17, 'change_criteriatostatsm2m'),
(67, 'Can delete criteria to stats m2m', 17, 'delete_criteriatostatsm2m'),
(68, 'Can view criteria to stats m2m', 17, 'view_criteriatostatsm2m'),
(69, 'Can add cached value', 18, 'add_cachedvalue'),
(70, 'Can change cached value', 18, 'change_cachedvalue'),
(71, 'Can delete cached value', 18, 'delete_cachedvalue'),
(72, 'Can view cached value', 18, 'view_cachedvalue');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$SBTygHhGO6fVfUggi3Ouoy$PLTd8371X95sdf0EPCoNiuTu4bzEIr1+vS3fOnLL3ZM=', '2024-02-23 14:47:49.878897', 1, 'admin', 'Phan', 'Thanh', 'thanh@gmail.com', 1, 1, '2024-01-16 08:39:03.000000'),
(2, 'pbkdf2_sha256$720000$9W8cdeBQf8s0uYOHOwbplC$+gNiDvVuFFBIuLlxgcyKut5yvkj6vkW9DkgbqvRldL4=', '2024-01-19 07:18:29.318282', 0, 'thanh1', '', '', 'thanh1@gmail.com', 0, 1, '2024-01-18 18:14:06.232293'),
(3, 'pbkdf2_sha256$720000$qw3KjtHBiqqbc65H2fD3iQ$1WR0Ex1RAYphSn+WISF3itgBIqJGc6RtqKf34fUMFlY=', '2024-02-21 07:23:36.060774', 0, 'thanhsaker', 'phan', 'thanh', 'thanh2@gmail.com', 0, 1, '2024-01-19 12:57:14.524942'),
(5, 'pbkdf2_sha256$720000$GZtnk7ea4Bd4vUstoyPOnZ$OGa4Zt6vhZy+7DMT4bHdJ4GHH0SxzBdFchrh3HJNLxU=', '2024-01-26 13:36:00.647561', 0, 'chivi', '', '', 'chivi@gmail.com', 0, 1, '2024-01-26 13:35:50.648202'),
(8, 'pbkdf2_sha256$720000$BdxU21uMTBY6ZpLEu2Z7XB$BN/PaZ69HtcYGfuntCk5TkDXN7iwZ+5QYl6ohBcw+ME=', NULL, 0, 'thanh11', '', '', 'thanh11@gmail.com', 0, 1, '2024-02-02 17:30:45.487929'),
(9, 'pbkdf2_sha256$720000$581Cs2y4mcpNwZjgcYbYoh$gxymPtMTOSYevb2NPvcfXuYh7n5rDe95mWjdLkk/sKU=', '2024-02-02 17:32:15.700069', 0, 'thanh12', '', '', 'thanh12@gmail.com', 0, 1, '2024-02-02 17:32:01.644817'),
(10, 'pbkdf2_sha256$720000$Ffpdp11OeVaNb6EHTKlnBH$Ks5ApZLDd9VxJz6cmFhPSgdIqjc2fgvDJ0+JEuDVMdI=', NULL, 1, 'admin1', '', '', 'admin@gmail.com', 1, 1, '2024-02-20 08:57:28.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_stats`
--

CREATE TABLE `dashboard_stats` (
  `id` bigint(20) NOT NULL,
  `graph_key` varchar(90) NOT NULL,
  `graph_title` varchar(90) NOT NULL,
  `model_app_name` varchar(90) NOT NULL,
  `model_name` varchar(90) NOT NULL,
  `date_field_name` varchar(90) NOT NULL,
  `operation_field_name` varchar(90) DEFAULT NULL,
  `type_operation_field_name` varchar(90) DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `user_field_name` varchar(90) DEFAULT NULL,
  `default_chart_type` varchar(90) NOT NULL,
  `default_time_period` int(10) UNSIGNED NOT NULL CHECK (`default_time_period` >= 0),
  `default_time_scale` varchar(90) NOT NULL,
  `y_axis_format` varchar(90) DEFAULT NULL,
  `distinct` tinyint(1) NOT NULL,
  `default_multiseries_criteria_id` bigint(20) DEFAULT NULL,
  `show_to_users` tinyint(1) NOT NULL,
  `allowed_chart_types` varchar(1000) DEFAULT NULL,
  `allowed_time_scales` varchar(1000) NOT NULL,
  `allowed_type_operation_field_name` varchar(1000) DEFAULT NULL,
  `cache_values` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dash_stats_criteria`
--

CREATE TABLE `dash_stats_criteria` (
  `id` bigint(20) NOT NULL,
  `criteria_name` varchar(90) NOT NULL,
  `criteria_fix_mapping` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`criteria_fix_mapping`)),
  `dynamic_criteria_field_name` varchar(90) DEFAULT NULL,
  `criteria_dynamic_mapping` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`criteria_dynamic_mapping`)),
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-01-16 08:46:13.201741', '1', 'Laptops', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-01-16 08:49:46.899572', '1', 'Lenovo Thinkpad X1 extreme gen 3', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-01-16 15:52:58.095154', '1', 'Laptops', 3, '', 7, 1),
(4, '2024-01-16 15:56:22.350019', '2', 'Laptops', 1, '[{\"added\": {}}]', 7, 1),
(5, '2024-01-16 15:59:16.852214', '2', 'Laptops', 2, '[]', 7, 1),
(6, '2024-01-16 15:59:24.971312', '2', 'Laptops', 3, '', 7, 1),
(7, '2024-01-16 16:00:01.687003', '3', 'Laptops', 1, '[{\"added\": {}}]', 7, 1),
(8, '2024-01-16 16:01:12.706740', '4', 'Mobiles', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-01-16 16:04:16.195156', '5', 'PC', 1, '[{\"added\": {}}]', 7, 1),
(10, '2024-01-16 16:17:54.886487', '5', 'PC', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(11, '2024-01-16 16:18:28.700699', '4', 'Mobiles', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(12, '2024-01-16 16:18:34.578399', '3', 'Laptops', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(13, '2024-01-16 16:23:38.528690', '5', 'PC', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(14, '2024-01-16 16:25:52.855932', '3', 'Laptops', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(15, '2024-01-16 16:26:26.992917', '3', 'Laptops', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(16, '2024-01-16 16:26:33.700413', '5', 'PC', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(17, '2024-01-16 16:34:59.078093', '6', 'Apple Watch', 1, '[{\"added\": {}}]', 7, 1),
(18, '2024-01-16 17:56:04.574536', '2', 'Laptop HP 15s', 1, '[{\"added\": {}}]', 8, 1),
(19, '2024-01-16 17:59:26.109853', '3', 'iPhone 15 Pro Max', 1, '[{\"added\": {}}]', 8, 1),
(20, '2024-01-17 12:39:11.425078', '3', 'iPhone 15 Pro Max', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(21, '2024-01-17 12:39:20.003142', '2', 'Laptop HP 15s', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(22, '2024-01-17 12:47:17.565377', '2', 'Laptop HP 15s', 2, '[{\"changed\": {\"fields\": [\"Original price\"]}}]', 8, 1),
(23, '2024-01-17 12:47:45.642569', '3', 'iPhone 15 Pro Max', 2, '[{\"changed\": {\"fields\": [\"Original price\", \"Selling price\"]}}]', 8, 1),
(24, '2024-01-17 12:48:09.460525', '2', 'Laptop HP 15s', 2, '[{\"changed\": {\"fields\": [\"Original price\", \"Selling price\"]}}]', 8, 1),
(25, '2024-01-17 13:49:48.503415', '3', 'iPhone 15 Pro Max', 2, '[{\"changed\": {\"fields\": [\"Original price\", \"Selling price\"]}}]', 8, 1),
(26, '2024-01-17 13:50:03.653374', '2', 'Laptop HP 15s', 2, '[{\"changed\": {\"fields\": [\"Original price\", \"Selling price\"]}}]', 8, 1),
(27, '2024-01-19 15:12:23.450353', '2', 'Laptop HP 15s', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(28, '2024-01-26 07:40:28.770266', '8', '8-sharma230049', 3, '', 12, 1),
(29, '2024-01-26 07:40:41.034455', '1', '1-sharma618062', 3, '', 12, 1),
(30, '2024-01-26 07:40:44.792048', '2', '2-sharma324549', 3, '', 12, 1),
(31, '2024-01-26 07:40:47.095980', '4', '4-sharma194422', 3, '', 12, 1),
(32, '2024-01-26 07:40:49.582009', '3', '3-sharma601574', 3, '', 12, 1),
(33, '2024-01-26 07:40:52.286708', '6', '6-sharma632325', 3, '', 12, 1),
(34, '2024-01-26 07:40:55.204853', '7', '7-sharma664475', 3, '', 12, 1),
(35, '2024-02-03 03:27:55.682375', '6', 'Spring', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Name\", \"Image\", \"Meta title\", \"Meta keywords\", \"Meta description\"]}}]', 7, 1),
(36, '2024-02-03 03:28:49.252654', '5', 'Summer', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Name\", \"Meta title\", \"Meta keywords\", \"Meta description\"]}}]', 7, 1),
(37, '2024-02-03 03:29:55.445979', '5', 'Summer', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(38, '2024-02-03 03:30:42.883019', '4', 'Autumn', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Name\", \"Image\", \"Meta title\", \"Meta keywords\", \"Meta description\"]}}]', 7, 1),
(39, '2024-02-03 07:14:13.497458', '7', 'Winter', 1, '[{\"added\": {}}]', 7, 1),
(40, '2024-02-03 07:16:26.344288', '3', 'Laptops', 3, '', 7, 1),
(41, '2024-02-03 07:16:48.947737', '7', 'Winter', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Trending\"]}}]', 7, 1),
(42, '2024-02-03 07:18:21.060333', '7', 'Winter', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(43, '2024-02-03 07:25:05.193470', '4', 'Spring', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Name\", \"Image\", \"Meta title\", \"Meta keywords\", \"Meta description\"]}}]', 7, 1),
(44, '2024-02-03 07:32:01.825877', '5', 'Summer', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(45, '2024-02-03 07:36:36.367129', '6', 'Autumn', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Name\", \"Image\", \"Meta title\", \"Meta keywords\", \"Meta description\"]}}]', 7, 1),
(46, '2024-02-08 15:08:33.961907', '3', 'iPhone 15 Pro Max', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(47, '2024-02-10 19:18:57.835508', '6', 'Autumn', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(48, '2024-02-10 19:21:34.609937', '7', 'Winter', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(49, '2024-02-10 19:26:02.170319', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Slug\", \"Name\", \"Product image\", \"Small description\", \"Quantity\", \"Original price\", \"Selling price\", \"Tag\", \"Meta title\", \"Meta keywords\", \"Meta description\"]}}]', 8, 1),
(50, '2024-02-10 19:29:11.410398', '4', 'Watermelon', 1, '[{\"added\": {}}]', 8, 1),
(51, '2024-02-10 19:29:26.299358', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 8, 1),
(52, '2024-02-10 19:29:52.116069', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Original price\", \"Selling price\"]}}]', 8, 1),
(53, '2024-02-10 19:32:08.319256', '5', 'Cherry', 1, '[{\"added\": {}}]', 8, 1),
(54, '2024-02-10 19:33:33.801505', '6', 'Mango', 1, '[{\"added\": {}}]', 8, 1),
(55, '2024-02-10 19:33:49.154457', '6', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(56, '2024-02-10 19:33:52.736774', '5', 'Cherry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(57, '2024-02-10 19:33:56.645417', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(58, '2024-02-10 19:34:11.734416', '6', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 8, 1),
(59, '2024-02-10 19:37:21.196836', '7', 'Cantaloupe', 1, '[{\"added\": {}}]', 8, 1),
(60, '2024-02-10 19:39:04.400875', '8', 'Pear', 1, '[{\"added\": {}}]', 8, 1),
(61, '2024-02-10 19:40:33.067819', '9', 'Apple', 1, '[{\"added\": {}}]', 8, 1),
(62, '2024-02-10 19:43:20.002990', '10', 'Grape', 1, '[{\"added\": {}}]', 8, 1),
(63, '2024-02-10 19:44:25.220709', '11', 'Orange', 1, '[{\"added\": {}}]', 8, 1),
(64, '2024-02-10 19:45:47.983299', '12', 'Pomegranate', 1, '[{\"added\": {}}]', 8, 1),
(65, '2024-02-11 04:57:02.353837', '4', 'Watermelon', 2, '[]', 8, 1),
(66, '2024-02-11 04:57:58.845918', '13', 'Watermelon', 1, '[{\"added\": {}}]', 8, 1),
(67, '2024-02-11 05:20:50.585284', '14', 'Papaya', 1, '[{\"added\": {}}]', 8, 1),
(68, '2024-02-11 05:24:22.347055', '15', 'Guava', 1, '[{\"added\": {}}]', 8, 1),
(69, '2024-02-11 05:25:41.604780', '16', 'Plum', 1, '[{\"added\": {}}]', 8, 1),
(70, '2024-02-11 05:27:13.318555', '17', 'Pineapple', 1, '[{\"added\": {}}]', 8, 1),
(71, '2024-02-11 05:29:31.430980', '18', 'Litchi', 1, '[{\"added\": {}}]', 8, 1),
(72, '2024-02-11 05:31:08.909857', '19', 'Kiwi', 1, '[{\"added\": {}}]', 8, 1),
(73, '2024-02-11 05:33:06.258663', '20', 'Passion', 1, '[{\"added\": {}}]', 8, 1),
(74, '2024-02-11 05:35:15.844940', '21', 'Rambutan', 1, '[{\"added\": {}}]', 8, 1),
(75, '2024-02-11 05:36:28.761726', '22', 'Durian', 1, '[{\"added\": {}}]', 8, 1),
(76, '2024-02-11 05:36:52.213557', '22', 'Durian', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 8, 1),
(77, '2024-02-11 05:37:30.806268', '22', 'Durian', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 8, 1),
(78, '2024-02-11 05:41:52.271510', '23', 'Pomelo', 1, '[{\"added\": {}}]', 8, 1),
(79, '2024-02-11 05:43:34.712380', '24', 'Blueberry', 1, '[{\"added\": {}}]', 8, 1),
(80, '2024-02-11 05:44:58.456661', '25', 'Banana', 1, '[{\"added\": {}}]', 8, 1),
(81, '2024-02-11 05:46:35.068482', '26', 'Pear', 1, '[{\"added\": {}}]', 8, 1),
(82, '2024-02-11 05:46:49.568830', '8', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 8, 1),
(83, '2024-02-11 05:48:19.422047', '27', 'Mango', 1, '[{\"added\": {}}]', 8, 1),
(84, '2024-02-11 05:49:19.807197', '28', 'Orange', 1, '[{\"added\": {}}]', 8, 1),
(85, '2024-02-11 05:50:21.920568', '29', 'Passion', 1, '[{\"added\": {}}]', 8, 1),
(86, '2024-02-11 05:52:24.874695', '30', 'Custard Apple', 1, '[{\"added\": {}}]', 8, 1),
(87, '2024-02-11 05:52:47.238780', '6', 'Mango', 2, '[]', 8, 1),
(88, '2024-02-11 05:53:18.748855', '31', 'Grape', 1, '[{\"added\": {}}]', 8, 1),
(89, '2024-02-11 05:55:27.596468', '32', 'Dragon Fruit', 1, '[{\"added\": {}}]', 8, 1),
(90, '2024-02-11 05:57:48.235927', '33', 'Persimmon', 1, '[{\"added\": {}}]', 8, 1),
(91, '2024-02-11 05:58:32.153641', '34', 'Orange', 1, '[{\"added\": {}}]', 8, 1),
(92, '2024-02-11 05:58:59.213596', '35', 'Pear', 1, '[{\"added\": {}}]', 8, 1),
(93, '2024-02-11 05:59:29.667712', '36', 'Apple', 1, '[{\"added\": {}}]', 8, 1),
(94, '2024-02-11 06:00:04.959580', '37', 'Kiwi', 1, '[{\"added\": {}}]', 8, 1),
(95, '2024-02-11 06:01:16.105670', '33', 'Persimmon', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 8, 1),
(96, '2024-02-11 06:02:37.694516', '38', 'Pomegranate', 1, '[{\"added\": {}}]', 8, 1),
(97, '2024-02-11 06:03:16.651568', '39', 'Banana', 1, '[{\"added\": {}}]', 8, 1),
(98, '2024-02-11 06:04:07.825968', '40', 'Pomelo', 1, '[{\"added\": {}}]', 8, 1),
(99, '2024-02-11 06:05:46.490213', '41', 'Carrot', 1, '[{\"added\": {}}]', 8, 1),
(100, '2024-02-12 07:33:02.516383', '14', 'Papaya', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(101, '2024-02-12 07:35:22.588187', '40', 'Pomelo', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(102, '2024-02-12 07:35:37.607525', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(103, '2024-02-12 07:35:57.526262', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(104, '2024-02-12 07:36:14.588597', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(105, '2024-02-12 07:36:33.288171', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(106, '2024-02-12 07:36:39.768806', '5', 'Cherry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(107, '2024-02-12 07:36:53.226400', '5', 'Cherry', 2, '[]', 8, 1),
(108, '2024-02-12 07:37:17.992955', '6', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(109, '2024-02-12 07:41:27.750297', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(110, '2024-02-12 07:41:35.569447', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(111, '2024-02-12 07:42:00.157227', '5', 'Cherry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(112, '2024-02-12 07:42:22.753513', '5', 'Cherry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(113, '2024-02-12 07:42:29.320444', '6', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(114, '2024-02-12 07:44:57.796838', '7', 'Cantaloupe', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(115, '2024-02-12 07:45:17.485000', '8', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(116, '2024-02-12 07:45:24.484791', '9', 'Apple', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(117, '2024-02-12 07:45:31.300806', '10', 'Grape', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(118, '2024-02-12 07:45:40.341848', '11', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(119, '2024-02-12 07:45:56.883081', '12', 'Pomegranate', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(120, '2024-02-12 07:46:32.781859', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(121, '2024-02-12 07:46:39.746849', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(122, '2024-02-12 07:46:47.097174', '5', 'Cherry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(123, '2024-02-12 07:46:55.035566', '6', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(124, '2024-02-12 07:47:02.040696', '7', 'Cantaloupe', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(125, '2024-02-12 07:47:11.489550', '8', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(126, '2024-02-12 07:47:19.631010', '9', 'Apple', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(127, '2024-02-12 07:47:25.504499', '9', 'Apple', 2, '[]', 8, 1),
(128, '2024-02-12 07:47:34.450671', '10', 'Grape', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(129, '2024-02-12 07:47:43.057465', '11', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(130, '2024-02-12 07:47:53.788998', '12', 'Pomegranate', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(131, '2024-02-12 07:48:01.938095', '13', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(132, '2024-02-12 07:48:14.665446', '14', 'Papaya', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(133, '2024-02-12 07:48:39.875975', '15', 'Guava', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(134, '2024-02-12 07:48:49.151786', '16', 'Plum', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(135, '2024-02-12 07:48:58.088338', '17', 'Pineapple', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(136, '2024-02-12 07:49:07.585465', '18', 'Litchi', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(137, '2024-02-12 07:49:15.548567', '19', 'Kiwi', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(138, '2024-02-12 07:49:22.281898', '20', 'Passion', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(139, '2024-02-12 07:49:43.574717', '30', 'Custard Apple', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(140, '2024-02-12 07:49:51.746603', '20', 'Passion', 2, '[]', 8, 1),
(141, '2024-02-12 07:50:00.648221', '21', 'Rambutan', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(142, '2024-02-12 07:50:12.887546', '22', 'Durian', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(143, '2024-02-12 07:50:22.664521', '23', 'Pomelo', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(144, '2024-02-12 07:50:32.111373', '24', 'Blueberry', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(145, '2024-02-12 07:50:46.049596', '25', 'Banana', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(146, '2024-02-12 07:50:53.075842', '26', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(147, '2024-02-12 07:51:02.437514', '27', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(148, '2024-02-12 07:51:09.338577', '28', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(149, '2024-02-12 07:51:16.118536', '29', 'Passion', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(150, '2024-02-12 07:51:19.967752', '30', 'Custard Apple', 2, '[]', 8, 1),
(151, '2024-02-12 07:51:26.949515', '31', 'Grape', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(152, '2024-02-12 07:51:36.405827', '32', 'Dragon Fruit', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(153, '2024-02-12 07:51:42.989662', '33', 'Persimmon', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(154, '2024-02-12 07:51:49.802533', '34', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(155, '2024-02-12 07:51:57.661595', '35', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(156, '2024-02-12 07:52:04.130075', '36', 'Apple', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(157, '2024-02-12 07:52:10.258810', '37', 'Kiwi', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(158, '2024-02-12 07:52:15.449546', '38', 'Pomegranate', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(159, '2024-02-12 07:52:20.914613', '39', 'Banana', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(160, '2024-02-12 07:52:26.575539', '40', 'Pomelo', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(161, '2024-02-12 07:52:32.071645', '41', 'Carrot', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 8, 1),
(162, '2024-02-18 08:43:46.693473', '3', 'Strawberry', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(163, '2024-02-18 08:45:00.471222', '4', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(164, '2024-02-18 08:45:05.092424', '13', 'Watermelon', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(165, '2024-02-18 08:45:37.009939', '5', 'Cherry', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(166, '2024-02-18 08:46:01.157597', '6', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(167, '2024-02-18 08:46:08.273633', '27', 'Mango', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(168, '2024-02-18 08:46:38.010656', '7', 'Cantaloupe', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(169, '2024-02-18 08:46:57.958773', '8', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(170, '2024-02-18 08:47:18.083521', '9', 'Apple', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(171, '2024-02-18 08:47:44.777971', '10', 'Grape', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(172, '2024-02-18 08:48:06.329735', '11', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(173, '2024-02-18 08:48:12.273991', '28', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(174, '2024-02-18 08:48:39.518074', '12', 'Pomegranate', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(175, '2024-02-18 08:48:47.651539', '38', 'Pomegranate', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(176, '2024-02-18 08:48:54.145697', '13', 'Watermelon', 2, '[]', 8, 1),
(177, '2024-02-18 08:49:15.564938', '14', 'Papaya', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(178, '2024-02-18 08:49:41.302881', '15', 'Guava', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(179, '2024-02-18 08:49:57.908402', '16', 'Plum', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(180, '2024-02-18 08:50:18.269931', '17', 'Pineapple', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(181, '2024-02-18 08:50:42.561869', '18', 'Litchi', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(182, '2024-02-18 08:51:00.210685', '19', 'Kiwi', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(183, '2024-02-18 08:51:32.772555', '20', 'Passion', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(184, '2024-02-18 08:51:55.090630', '30', 'Custard Apple', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(185, '2024-02-18 08:52:04.064528', '10', 'Grape', 2, '[]', 8, 1),
(186, '2024-02-18 08:52:08.366500', '31', 'Grape', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(187, '2024-02-18 08:52:33.208780', '32', 'Dragon Fruit', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(188, '2024-02-18 08:53:22.604817', '33', 'Persimmon', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(189, '2024-02-18 08:53:34.312817', '11', 'Orange', 2, '[]', 8, 1),
(190, '2024-02-18 08:53:38.753975', '34', 'Orange', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(191, '2024-02-18 08:53:43.161597', '8', 'Pear', 2, '[]', 8, 1),
(192, '2024-02-18 08:53:46.959220', '35', 'Pear', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(193, '2024-02-18 08:53:50.852697', '9', 'Apple', 2, '[]', 8, 1),
(194, '2024-02-18 08:53:54.815369', '36', 'Apple', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(195, '2024-02-18 08:53:58.389172', '19', 'Kiwi', 2, '[]', 8, 1),
(196, '2024-02-18 08:54:01.705608', '37', 'Kiwi', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(197, '2024-02-18 08:54:09.444103', '12', 'Pomegranate', 2, '[]', 8, 1),
(198, '2024-02-18 08:54:13.337674', '38', 'Pomegranate', 2, '[]', 8, 1),
(199, '2024-02-18 08:54:29.226117', '39', 'Banana', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(200, '2024-02-18 08:54:48.732838', '40', 'Pomelo', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(201, '2024-02-18 08:55:07.439969', '41', 'Carrot', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(202, '2024-02-18 14:34:42.985110', '14', '14-ID678215', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(203, '2024-02-19 03:00:36.540143', '1', 'You will vainly look for fruit on it in autumn.', 1, '[{\"added\": {}}]', 14, 1),
(204, '2024-02-19 04:08:19.052400', '1', 'You will vainly look for fruit on it in autumn.', 3, '', 14, 1),
(205, '2024-02-19 04:10:46.701206', '2', 'You will vainly look for fruit on it in autumn.', 1, '[{\"added\": {}}]', 14, 1),
(206, '2024-02-19 04:12:44.489055', '3', 'A man\'s worth has its season, like tomato.', 1, '[{\"added\": {}}]', 14, 1),
(207, '2024-02-19 04:13:07.664522', '4', 'Good thoughts bear good fresh juicy fruit.', 1, '[{\"added\": {}}]', 14, 1),
(208, '2024-02-19 05:57:03.705694', '5', 'Fall in love with the fresh orange', 1, '[{\"added\": {}}]', 14, 1),
(209, '2024-02-19 05:57:27.007924', '6', 'Why the berries always look delecious', 1, '[{\"added\": {}}]', 14, 1),
(210, '2024-02-19 05:58:41.422399', '5', 'Fall in love with the fresh orange', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 1),
(211, '2024-02-19 05:58:48.991488', '6', 'Why the berries always look delecious', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 1),
(212, '2024-02-19 05:59:22.051383', '7', 'Love for fruits are genuine of John Doe', 1, '[{\"added\": {}}]', 14, 1),
(213, '2024-02-19 06:07:19.404582', '5', 'Fall in love with the fresh orange', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 14, 1),
(214, '2024-02-19 06:49:13.396387', '6', 'Why the berries always look delecious', 2, '[]', 14, 1),
(215, '2024-02-19 06:49:16.985368', '5', 'Fall in love with the fresh orange delecious', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 14, 1),
(216, '2024-02-21 04:40:31.595066', '1', 'thanh', 2, '[]', 4, 1),
(217, '2024-02-21 04:40:45.105445', '10', 'admin1', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1),
(218, '2024-02-21 04:40:52.097210', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1),
(219, '2024-02-21 08:03:10.852731', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Specific address\"]}}]', 13, 1),
(220, '2024-02-21 08:03:25.517685', '2', 'thanhsaker', 2, '[{\"changed\": {\"fields\": [\"Specific address\"]}}]', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(18, 'admin_tools_stats', 'cachedvalue'),
(17, 'admin_tools_stats', 'criteriatostatsm2m'),
(15, 'admin_tools_stats', 'dashboardstats'),
(16, 'admin_tools_stats', 'dashboardstatscriteria'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'store', 'cart'),
(7, 'store', 'category'),
(14, 'store', 'news'),
(12, 'store', 'order'),
(11, 'store', 'orderitem'),
(8, 'store', 'product'),
(13, 'store', 'profile'),
(10, 'store', 'wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-16 08:37:13.230059'),
(2, 'auth', '0001_initial', '2024-01-16 08:37:13.812416'),
(3, 'admin', '0001_initial', '2024-01-16 08:37:13.945350'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-16 08:37:13.955709'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-16 08:37:13.964691'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-01-16 08:37:14.036425'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-01-16 08:37:14.098026'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-01-16 08:37:14.109994'),
(9, 'auth', '0004_alter_user_username_opts', '2024-01-16 08:37:14.118005'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-01-16 08:37:14.168593'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-01-16 08:37:14.170960'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-01-16 08:37:14.180937'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-01-16 08:37:14.195897'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-01-16 08:37:14.208947'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-01-16 08:37:14.224784'),
(16, 'auth', '0011_update_proxy_permissions', '2024-01-16 08:37:14.232793'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-01-16 08:37:14.245467'),
(18, 'sessions', '0001_initial', '2024-01-16 08:37:14.278501'),
(19, 'store', '0001_initial', '2024-01-16 08:37:14.349772'),
(20, 'store', '0002_cart', '2024-01-19 13:02:44.256489'),
(21, 'store', '0003_wishlist', '2024-01-22 13:50:58.205545'),
(22, 'store', '0004_order_orderitem', '2024-01-23 13:15:12.042072'),
(23, 'store', '0005_profile', '2024-01-24 15:39:13.725661'),
(24, 'store', '0006_rename_address_order_specific_address_and_more', '2024-01-26 07:26:14.389475'),
(25, 'store', '0007_remove_order_message_remove_order_payment_id_news', '2024-02-19 02:46:39.449434'),
(26, 'store', '0008_alter_news_options_news_title_content', '2024-02-19 04:09:10.854631'),
(27, 'store', '0009_remove_product_meta_description_and_more', '2024-02-20 08:59:25.969192'),
(28, 'store', '0010_remove_category_meta_description_and_more', '2024-02-21 04:43:27.553500'),
(29, 'admin_tools_stats', '0001_initial', '2024-02-23 19:29:47.876310'),
(30, 'admin_tools_stats', '0002_auto_20190920_1058', '2024-02-23 19:29:47.903249'),
(31, 'admin_tools_stats', '0003_auto_20191007_0950', '2024-02-23 19:29:47.952822'),
(32, 'admin_tools_stats', '0004_dashboardstats_y_tick_format', '2024-02-23 19:29:47.961773'),
(33, 'admin_tools_stats', '0005_auto_20200203_1537', '2024-02-23 19:29:47.994709'),
(34, 'admin_tools_stats', '0006_auto_20200205_0944', '2024-02-23 19:29:48.194560'),
(35, 'admin_tools_stats', '0007_auto_20200205_1054', '2024-02-23 19:29:48.235934'),
(36, 'admin_tools_stats', '0008_auto_20200911_1400', '2024-02-23 19:29:48.304833'),
(37, 'admin_tools_stats', '0009_auto_20200928_1003', '2024-02-23 19:29:48.326774'),
(38, 'admin_tools_stats', '0010_dashboardstats_show_to_users', '2024-02-23 19:29:48.341735'),
(39, 'admin_tools_stats', '0011_auto_20210204_1206', '2024-02-23 19:29:48.375480'),
(40, 'admin_tools_stats', '0012_auto_20210207_0859', '2024-02-23 19:29:48.401410'),
(41, 'admin_tools_stats', '0013_auto_20210221_1247', '2024-02-23 19:29:48.410464'),
(42, 'admin_tools_stats', '0014_auto_20211122_1511', '2024-02-23 19:29:48.583090'),
(43, 'admin_tools_stats', '0015_auto_20211209_0822', '2024-02-23 19:29:48.605029'),
(44, 'admin_tools_stats', '0016_dashboardstats_cache_values', '2024-02-23 19:29:48.620630'),
(45, 'admin_tools_stats', '0017_alter_dashboardstats_options_and_more', '2024-02-23 19:29:48.635938'),
(46, 'admin_tools_stats', '0018_alter_dashboardstats_options', '2024-02-23 19:29:48.643898'),
(47, 'admin_tools_stats', '0019_criteriatostatsm2m_recalculate', '2024-02-23 19:29:48.693765'),
(48, 'admin_tools_stats', '0020_alter_dashboardstats_graph_key', '2024-02-23 19:29:48.706729'),
(49, 'admin_tools_stats', '0021_auto_20230210_1102', '2024-02-23 19:29:50.218466');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5zgnzg10u778c3asx2b43w4nkfuc83a6', '.eJxVjDsOwjAQBe_iGlnr7xJK-pzBWttrHECOFCcV4u4QKQW0b2beSwTa1hq2zkuYsrgII06_W6T04LaDfKd2m2Wa27pMUe6KPGiX45z5eT3cv4NKvX5rWwYD7FNURoMpCtE40mcsCZBtZuZkEdArdhAzMTgsWtshe4y-gBHvD9fkN6A:1rW6KJ:avhQ0VJ44ID3KAFOvtjBFNn4bima2Z2j4840L1-vMTk', '2024-02-17 03:04:19.899342'),
('9zm4abog9ft52in4238c0jm2xp5bfcss', '.eJxVjE0OgyAYBe_C2hAVEOyye89Avh8otg0koqumd68mLup2Zt77CA_bmvxWw-JnFjfRieafIdAr5EPwE_KjSCp5XWaURyJPW-VUOLzvZ3s5SFDTvlYIsWfWismRQYuEFBWbVsPOBqYu9ia4yDQQso1mtM5ZbVrAkdCR-P4AKKM5iA:1rci04:kY7NgUHGqWUA79rSVDk8QbxTKMoRpPEtxUMQW9puNv4', '2024-03-06 08:30:44.856179'),
('doigc2oi4lxpsbxzey8whekmmxwhaofg', '.eJxVjDsOwjAQBe_iGlnr7xJK-pzBWttrHECOFCcV4u4QKQW0b2beSwTa1hq2zkuYsrgII06_W6T04LaDfKd2m2Wa27pMUe6KPGiX45z5eT3cv4NKvX5rWwYD7FNURoMpCtE40mcsCZBtZuZkEdArdhAzMTgsWtshe4y-gBHvD9fkN6A:1rTMSD:qBZrsKW_Pfx3Bf6RvHRYzoUk3a1IxgsBAmBi0ZOh10g', '2024-02-09 13:41:09.656102'),
('v1z7v12mr1tgntim8il79rty87jt7po5', '.eJxVjE0OgyAYBe_C2hAVEOyye89Avh8otg0koqumd68mLup2Zt77CA_bmvxWw-JnFjfRieafIdAr5EPwE_KjSCp5XWaURyJPW-VUOLzvZ3s5SFDTvlYIsWfWismRQYuEFBWbVsPOBqYu9ia4yDQQso1mtM5ZbVrAkdCR-P4AKKM5iA:1rdWq5:LyD9Bou1NqXEFRArFsC-hrfPEFbqzvCIj9t9QkPdQgE', '2024-03-08 14:47:49.884882'),
('wztnwnzl3mvm7c2rv54duc2g6kjjqayl', '.eJxVjE0OgyAYBe_C2hAVEOyye89Avh8otg0koqumd68mLup2Zt77CA_bmvxWw-JnFjfRieafIdAr5EPwE_KjSCp5XWaURyJPW-VUOLzvZ3s5SFDTvlYIsWfWismRQYuEFBWbVsPOBqYu9ia4yDQQso1mtM5ZbVrAkdCR-P4AKKM5iA:1rbi9y:TFKBgghrMsPDwsOvSbVcVYcuLiLuzxEXnJhdgPuD5tg', '2024-03-03 14:28:50.963927');

-- --------------------------------------------------------

--
-- Table structure for table `store_cart`
--

CREATE TABLE `store_cart` (
  `id` bigint(20) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_cart`
--

INSERT INTO `store_cart` (`id`, `product_qty`, `created_at`, `product_id`, `user_id`) VALUES
(81, 1, '2024-02-24 00:29:09.956949', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trending` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_category`
--

INSERT INTO `store_category` (`id`, `slug`, `name`, `image`, `description`, `status`, `trending`, `created_at`) VALUES
(4, 'spring', 'Spring', 'uploads/20240203142505Spring.jpg', 'Where innovation meets elegance. Our exceptional range of mobile devices is crafted to seamlessly integrate into your lifestyle, providing cutting-edge technology wrapped in a sleek design. Elevate your mobile experience with a device that redefines connectivity, performance, and style.', 0, 1, '2024-01-16 16:01:12.706740'),
(5, 'summer', 'Summer', 'uploads/20240203143201Summer.jpg', 'The epitome of computing excellence. Our range of desktop computers combines cutting-edge technology, powerful performance, and sleek design to elevate your computing experience to new heights. Whether you\'re a professional seeking optimal productivity, a gamer craving unparalleled performance, or a creative individual pushing the boundaries of innovation, our PCs are crafted to meet and exceed your expectations.', 0, 1, '2024-01-16 16:04:16.195156'),
(6, 'autumn', 'Autumn', 'uploads/20240211021857Frame_49.png', 'The Apple Watch, where innovation and style converge seamlessly. Elevate your daily life with a device that goes beyond telling time; it\'s a companion that empowers you to stay connected, motivated, and in control. Discover the unparalleled features and sophistication that define the Apple Watch, designed to enhance every facet of your lifestyle.', 0, 1, '2024-01-16 16:34:59.077026'),
(7, 'winter', 'Winter', 'uploads/20240211022134Frame_48.png', 'Winter', 0, 1, '2024-02-03 07:14:13.496463');

-- --------------------------------------------------------

--
-- Table structure for table `store_news`
--

CREATE TABLE `store_news` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `title_content` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_news`
--

INSERT INTO `store_news` (`id`, `title`, `content`, `date_posted`, `image`, `author_id`, `title_content`) VALUES
(2, 'You will vainly look for fruit on it in autumn.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint soluta, similique quidem fuga vel voluptates amet doloremque corrupti. Perferendis totam voluptates eius error fuga cupiditate dolorum? Adipisci mollitia quod labore aut natus nobis. Rerum perferendis, nobis hic adipisci vel inventore facilis rem illo, tenetur ipsa voluptate dolorem, cupiditate temporibus laudantium quidem recusandae expedita dicta cum eum. Quae laborum repellat a ut, voluptatum ipsa eum. Culpa fugiat minus laborum quia nam!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Et, praesentium, dicta. Dolorum inventore molestias velit possimus, dolore labore aliquam aperiam architecto quo reprehenderit excepturi ipsum ipsam accusantium nobis ducimus laudantium.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum est aperiam voluptatum id cupiditate quae corporis ex. Molestias modi mollitia neque magni voluptatum, omnis repudiandae aliquam quae veniam error! Eligendi distinctio, ab eius iure atque ducimus id deleniti, vel alias sint similique perspiciatis saepe necessitatibus non eveniet, quo nisi soluta.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt beatae nemo quaerat, doloribus obcaecati odio!', '2024-02-19 04:10:46.699208', 'uploads/20240219111046news-bg-1.jpg', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.'),
(3, 'A man\'s worth has its season, like tomato.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint soluta, similique quidem fuga vel voluptates amet doloremque corrupti. Perferendis totam voluptates eius error fuga cupiditate dolorum? Adipisci mollitia quod labore aut natus nobis. Rerum perferendis, nobis hic adipisci vel inventore facilis rem illo, tenetur ipsa voluptate dolorem, cupiditate temporibus laudantium quidem recusandae expedita dicta cum eum. Quae laborum repellat a ut, voluptatum ipsa eum. Culpa fugiat minus laborum quia nam!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Et, praesentium, dicta. Dolorum inventore molestias velit possimus, dolore labore aliquam aperiam architecto quo reprehenderit excepturi ipsum ipsam accusantium nobis ducimus laudantium.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum est aperiam voluptatum id cupiditate quae corporis ex. Molestias modi mollitia neque magni voluptatum, omnis repudiandae aliquam quae veniam error! Eligendi distinctio, ab eius iure atque ducimus id deleniti, vel alias sint similique perspiciatis saepe necessitatibus non eveniet, quo nisi soluta.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt beatae nemo quaerat, doloribus obcaecati odio!', '2024-02-19 04:12:44.487063', 'uploads/20240219111244news-bg-2.jpg', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.'),
(4, 'Good thoughts bear good fresh juicy fruit.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint soluta, similique quidem fuga vel voluptates amet doloremque corrupti. Perferendis totam voluptates eius error fuga cupiditate dolorum? Adipisci mollitia quod labore aut natus nobis. Rerum perferendis, nobis hic adipisci vel inventore facilis rem illo, tenetur ipsa voluptate dolorem, cupiditate temporibus laudantium quidem recusandae expedita dicta cum eum. Quae laborum repellat a ut, voluptatum ipsa eum. Culpa fugiat minus laborum quia nam!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Et, praesentium, dicta. Dolorum inventore molestias velit possimus, dolore labore aliquam aperiam architecto quo reprehenderit excepturi ipsum ipsam accusantium nobis ducimus laudantium.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum est aperiam voluptatum id cupiditate quae corporis ex. Molestias modi mollitia neque magni voluptatum, omnis repudiandae aliquam quae veniam error! Eligendi distinctio, ab eius iure atque ducimus id deleniti, vel alias sint similique perspiciatis saepe necessitatibus non eveniet, quo nisi soluta.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt beatae nemo quaerat, doloribus obcaecati odio!', '2024-02-19 04:13:07.663519', 'uploads/20240219111307news-bg-3.jpg', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.'),
(5, 'Fall in love with the fresh orange delecious', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint soluta, similique quidem fuga vel voluptates amet doloremque corrupti. Perferendis totam voluptates eius error fuga cupiditate dolorum? Adipisci mollitia quod labore aut natus nobis. Rerum perferendis, nobis hic adipisci vel inventore facilis rem illo, tenetur ipsa voluptate dolorem, cupiditate temporibus laudantium quidem recusandae expedita dicta cum eum. Quae laborum repellat a ut, voluptatum ipsa eum. Culpa fugiat minus laborum quia nam!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Et, praesentium, dicta. Dolorum inventore molestias velit possimus, dolore labore aliquam aperiam architecto quo reprehenderit excepturi ipsum ipsam accusantium nobis ducimus laudantium.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum est aperiam voluptatum id cupiditate quae corporis ex. Molestias modi mollitia neque magni voluptatum, omnis repudiandae aliquam quae veniam error! Eligendi distinctio, ab eius iure atque ducimus id deleniti, vel alias sint similique perspiciatis saepe necessitatibus non eveniet, quo nisi soluta.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt beatae nemo quaerat, doloribus obcaecati odio!', '2024-02-19 05:57:03.703692', 'uploads/20240219130719news-bg-1.jpg', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.'),
(6, 'Why the berries always look delecious', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint soluta, similique quidem fuga vel voluptates amet doloremque corrupti. Perferendis totam voluptates eius error fuga cupiditate dolorum? Adipisci mollitia quod labore aut natus nobis. Rerum perferendis, nobis hic adipisci vel inventore facilis rem illo, tenetur ipsa voluptate dolorem, cupiditate temporibus laudantium quidem recusandae expedita dicta cum eum. Quae laborum repellat a ut, voluptatum ipsa eum. Culpa fugiat minus laborum quia nam!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Et, praesentium, dicta. Dolorum inventore molestias velit possimus, dolore labore aliquam aperiam architecto quo reprehenderit excepturi ipsum ipsam accusantium nobis ducimus laudantium.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum est aperiam voluptatum id cupiditate quae corporis ex. Molestias modi mollitia neque magni voluptatum, omnis repudiandae aliquam quae veniam error! Eligendi distinctio, ab eius iure atque ducimus id deleniti, vel alias sint similique perspiciatis saepe necessitatibus non eveniet, quo nisi soluta.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt beatae nemo quaerat, doloribus obcaecati odio!', '2024-02-19 05:57:27.005953', 'uploads/20240219125848news-bg-6.jpg', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.'),
(7, 'Love for fruits are genuine of John Doe', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint soluta, similique quidem fuga vel voluptates amet doloremque corrupti. Perferendis totam voluptates eius error fuga cupiditate dolorum? Adipisci mollitia quod labore aut natus nobis. Rerum perferendis, nobis hic adipisci vel inventore facilis rem illo, tenetur ipsa voluptate dolorem, cupiditate temporibus laudantium quidem recusandae expedita dicta cum eum. Quae laborum repellat a ut, voluptatum ipsa eum. Culpa fugiat minus laborum quia nam!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Et, praesentium, dicta. Dolorum inventore molestias velit possimus, dolore labore aliquam aperiam architecto quo reprehenderit excepturi ipsum ipsam accusantium nobis ducimus laudantium.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum est aperiam voluptatum id cupiditate quae corporis ex. Molestias modi mollitia neque magni voluptatum, omnis repudiandae aliquam quae veniam error! Eligendi distinctio, ab eius iure atque ducimus id deleniti, vel alias sint similique perspiciatis saepe necessitatibus non eveniet, quo nisi soluta.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt beatae nemo quaerat, doloribus obcaecati odio!', '2024-02-19 05:59:22.049406', 'uploads/20240219125922news-bg-4.jpg', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus laborum autem, dolores inventore, beatae nam.');

-- --------------------------------------------------------

--
-- Table structure for table `store_order`
--

CREATE TABLE `store_order` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `specific_address` longtext NOT NULL,
  `total_price` double NOT NULL,
  `payment_mode` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `tracking_no` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_order`
--

INSERT INTO `store_order` (`id`, `fname`, `lname`, `email`, `phone`, `city`, `district`, `specific_address`, `total_price`, `payment_mode`, `status`, `tracking_no`, `created_at`, `updated_at`, `user_id`) VALUES
(9, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do vinh quynh thanh tri ha noi', 800, 'COD', 'Pending', 'ID999502', '2024-01-26 07:41:19.511282', '2024-01-26 07:41:19.511282', 1),
(10, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'đâscác12e12e1', 1600, 'COD', 'Pending', 'ID771314', '2024-01-26 13:27:12.078661', '2024-01-26 13:27:12.078661', 1),
(11, 'phan', 'thanh', 'thanh2@gmail.com', '312312', 'Hà Nội', 'Thanh Trì', 'adasdasdasdasdasdasdasda', 800, 'COD', 'Pending', 'ID409122', '2024-02-03 06:35:05.087383', '2024-02-03 06:35:05.087383', 3),
(12, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'đâsadá', 45, 'COD', 'Pending', 'ID864028', '2024-02-16 19:07:00.456664', '2024-02-16 19:07:00.456664', 1),
(13, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'fesafasfasdas', 42, 'COD', 'Pending', 'ID189131', '2024-02-18 14:13:59.938436', '2024-02-18 14:13:59.938436', 1),
(14, 'Phan', 'Thanh', 'thanh@gmail.com', '0344134844', 'Hà Nội', 'Thanh Trì', 'xom 2222222', 51, 'COD', 'Shipping', 'ID678215', '2024-02-18 14:15:16.649328', '2024-02-18 14:34:42.983117', 1),
(15, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'đasađâs48287478480249024-12', 36, 'COD', 'Pending', 'ID664629', '2024-02-21 04:36:13.407320', '2024-02-21 04:36:13.407320', 1),
(16, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', '', 63, 'Paid by Paypal', 'Pending', 'ID912660', '2024-02-21 07:41:21.310337', '2024-02-21 07:41:21.310337', 1),
(17, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', '3423423dsadasađấ', 5, 'Paid by Paypal', 'Pending', 'ID216401', '2024-02-21 07:46:38.822088', '2024-02-21 07:46:38.822088', 1),
(18, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 6, 'COD', 'Pending', 'ID408157', '2024-02-21 08:21:47.922908', '2024-02-21 08:21:47.922908', 1),
(19, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 6, 'COD', 'Pending', 'ID338484', '2024-02-21 08:26:48.956002', '2024-02-21 08:26:48.956002', 1),
(20, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 7, 'Paid by Paypal', 'Pending', 'ID920776', '2024-02-21 08:43:44.528939', '2024-02-21 08:43:44.528939', 1),
(21, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 6, 'Paid by Paypal', 'Pending', 'ID727511', '2024-02-21 08:51:09.453427', '2024-02-21 08:51:09.453427', 1),
(22, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 5, 'Paid by Paypal', 'Pending', 'ID288071', '2024-02-21 14:21:22.439054', '2024-02-21 14:21:22.439054', 1),
(23, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 24, 'COD', 'Pending', 'ID416871', '2024-02-23 03:07:45.851909', '2024-02-23 03:07:45.851909', 1),
(24, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 13, 'Paid by Paypal', 'Pending', 'ID218099', '2024-02-23 16:39:11.753773', '2024-02-23 16:39:11.753773', 1),
(25, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 6, 'COD', 'Pending', 'ID282282', '2024-02-23 16:40:56.082807', '2024-02-23 16:40:56.082807', 1),
(26, 'Phan', 'Thanh', 'thanh@gmail.com', '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', 95, 'COD', 'Pending', 'ID489605', '2024-02-23 18:59:39.175366', '2024-02-23 18:59:39.175366', 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_orderitem`
--

CREATE TABLE `store_orderitem` (
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_orderitem`
--

INSERT INTO `store_orderitem` (`id`, `price`, `quantity`, `order_id`, `product_id`) VALUES
(13, 13, 1, 12, 3),
(14, 3, 1, 12, 11),
(15, 6, 1, 12, 20),
(16, 5, 1, 12, 33),
(17, 6, 1, 12, 12),
(18, 6, 1, 12, 41),
(19, 6, 1, 12, 14),
(20, 7, 6, 13, 4),
(21, 6, 3, 14, 14),
(22, 5, 3, 14, 15),
(23, 6, 3, 14, 16),
(24, 6, 6, 15, 14),
(25, 7, 9, 16, 4),
(26, 5, 1, 17, 15),
(27, 6, 1, 18, 18),
(28, 6, 1, 19, 8),
(29, 7, 1, 20, 4),
(30, 6, 1, 21, 25),
(31, 5, 1, 22, 15),
(32, 6, 2, 23, 14),
(33, 6, 1, 23, 20),
(34, 6, 1, 23, 32),
(35, 7, 1, 24, 4),
(36, 6, 1, 24, 14),
(37, 6, 1, 25, 14),
(38, 7, 4, 26, 4),
(39, 3, 5, 26, 11),
(40, 13, 4, 26, 5);

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

CREATE TABLE `store_product` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `small_description` varchar(500) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `original_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trending` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_product`
--

INSERT INTO `store_product` (`id`, `slug`, `name`, `product_image`, `small_description`, `quantity`, `description`, `original_price`, `selling_price`, `status`, `trending`, `created_at`, `category_id`) VALUES
(3, 'strawberry', 'Strawberry', 'uploads/20240211022602strawberry.png', 'Per Kg', 99, 'Strawberries are a popular fruit known for their vibrant red color, juicy texture, and sweet flavor. They belong to the genus Fragaria within the rose family (Rosaceae) and are cultivated worldwide for their delicious taste and nutritional value.', 15, 13, 0, 1, '2024-01-16 17:59:26.108834', 4),
(4, 'watermelon', 'Watermelon', 'uploads/20240211022926Watermelon.png', 'Per Kg', 79, 'Watermelon, with its vibrant green rind and succulent red flesh, is a quintessential fruit of summer. Bursting with refreshing sweetness and high water content, watermelon is a favorite choice for cooling down on hot days. This iconic fruit is not only delicious but also packed with essential nutrients like vitamins A and C, potassium, and antioxidants. Whether enjoyed fresh as a juicy snack, blended into thirst-quenching smoothies, or added to colorful fruit salads, watermelon is a beloved trea', 10, 7, 0, 1, '2024-02-10 19:29:11.409396', 4),
(5, 'cherry', 'Cherry', 'uploads/20240211023208Cherry.png', 'Per Kg', 96, 'Cherries, with their vibrant hues and irresistible flavors, are nature\'s delightful gems. Whether sweet or tart, these succulent fruits capture the essence of summer in every juicy bite. Cherries not only tantalize the taste buds with their sweetness but also offer a burst of nutrition, packed with vitamins, minerals, and antioxidants. From their delicate blossoms in spring to their plump, ripe fruits in summer, cherry trees evoke a sense of seasonal abundance and joy. Cherries find their way in', 15, 13, 0, 1, '2024-02-10 19:32:08.317258', 4),
(6, 'mango', 'Mango', 'uploads/20240211023411Mango.png', 'Mango', 100, 'Mangoes, with their golden-yellow skin and succulent flesh, embody the essence of tropical indulgence. Renowned for their sweet, aromatic flavor and velvety texture, mangoes are a beloved fruit cherished worldwide. Originating from regions like South Asia and Southeast Asia, mangoes have become a symbol of summer abundance and exotic allure. Bursting with vitamins, minerals, and antioxidants, mangoes offer a nutritious treat that satisfies both the palate and the body. Whether enjoyed fresh, ble', 8, 6, 0, 1, '2024-02-10 19:33:33.799784', 4),
(7, 'cantaloupe', 'Cantaloupe', 'uploads/20240211023721cantaloupe.png', 'Cantaloupe', 100, 'Cantaloupe, with its distinctive webbed rind and sweet, juicy flesh, is a summer delight cherished for its refreshing taste and vibrant aroma. Originating from the muskmelon family, Cantaloupe is characterized by its orange-colored flesh and greenish-gray skin with ribbed patterns. Bursting with flavor and loaded with hydration, Cantaloupe serves as a quintessential fruit during the warmer months, offering a cool and revitalizing treat. Rich in vitamins A and C, as well as antioxidants, Cantalou', 8, 5, 0, 1, '2024-02-10 19:37:21.194839', 4),
(8, 'pear', 'Pear', 'uploads/20240211124649Pear.png', 'Per Kg', 99, 'Pears, with their smooth, rounded shapes and delicate skin, offer a sweet and subtly juicy taste that epitomizes the essence of autumn. Belonging to the Rosaceae family, pears come in a variety of colors, from golden yellow to vibrant reds and greens, each with its own unique flavor profile and texture. With a rich history spanning centuries, pears have become a symbol of longevity, wisdom, and grace in various cultures worldwide. Packed with fiber, vitamins, and antioxidants, pears not only del', 8, 6, 0, 1, '2024-02-10 19:39:04.399877', 4),
(9, 'apple', 'Apple', 'uploads/20240211024033Apple.png', 'Per Kg', 100, 'Apples, with their crisp texture and sweet-tart flavor, stand as one of the most iconic fruits, beloved for their versatility and nutritional value. Originating from the Rosaceae family, apples come in a wide array of varieties, each offering its own distinct taste, color, and texture. From the classic sweetness of Fuji to the tangy bite of Granny Smith, apples cater to diverse preferences and culinary uses. Rich in fiber, vitamins, and antioxidants, apples not only promote digestive health but', 8, 6, 0, 1, '2024-02-10 19:40:33.066822', 4),
(10, 'grape', 'Grape', 'uploads/20240211024320Grape.png', 'Per Kg', 100, 'Grapes, with their luscious clusters and juicy orbs, embody the essence of natural sweetness and elegance. Belonging to the Vitaceae family, grapes are revered for their diverse flavors, ranging from the rich sweetness of red grapes to the subtle tartness of green varieties. With origins tracing back thousands of years, grapes hold a significant place in human history and culture, symbolizing fertility, abundance, and celebration. Bursting with vitamins, minerals, and antioxidants, grapes offer', 15, 11, 0, 1, '2024-02-10 19:43:20.001966', 4),
(11, 'orange', 'Orange', 'uploads/20240211024425Orange.png', 'Per Kg', 94, 'Oranges, with their bright citrus hues and tangy-sweet flavor, are nature\'s refreshing gems, cherished for their vibrant taste and abundant health benefits. As members of the Rutaceae family, oranges come in various types, including navel, Valencia, and blood oranges, each offering its own unique taste and characteristics. Originating from tropical and subtropical regions, oranges have become synonymous with sunshine and vitality, symbolizing freshness and rejuvenation. Packed with vitamin C, fi', 5, 3, 0, 1, '2024-02-10 19:44:25.219713', 4),
(12, 'pomegranate', 'Pomegranate', 'uploads/20240211024547Pomegranate.png', 'Per Kg', 99, 'Pomegranates, with their crimson hues and jewel-like seeds, are celebrated for their unique flavor and abundance of health benefits. Belonging to the family Lythraceae, pomegranates have a rich history dating back centuries and are revered in many cultures for their symbolic significance and medicinal properties. Bursting with antioxidants, vitamins, and minerals, pomegranates offer a powerful boost to heart health, immunity, and overall well-being. Their tart yet sweet taste adds depth to both', 8, 6, 0, 1, '2024-02-10 19:45:47.982029', 4),
(13, 'watermelon', 'Watermelon', 'uploads/20240211115758Watermelon.png', 'Per Kg', 100, 'Watermelon, with its vibrant green rind and succulent red flesh, is a quintessential fruit of summer. Bursting with refreshing sweetness and high water content, watermelon is a favorite choice for cooling down on hot days. This iconic fruit is not only delicious but also packed with essential nutrients like vitamins A and C, potassium, and antioxidants. Whether enjoyed fresh as a juicy snack, blended into thirst-quenching smoothies, or added to colorful fruit salads, watermelon is a beloved trea', 10, 7, 0, 1, '2024-02-11 04:57:58.845918', 5),
(14, 'papaya', 'Papaya', 'uploads/20240211122050papaya.png', 'Per Kg', 987, 'Papayas, with their tropical allure and vibrant orange flesh, offer a delightful blend of sweetness and musky undertones. Belonging to the Caricaceae family, papayas are celebrated for their unique flavor, creamy texture, and abundance of health benefits. Originating from tropical regions, papayas are rich in vitamins C and A, as well as enzymes like papain, which aid in digestion and promote gut health. With their versatility, papayas can be enjoyed fresh as a refreshing snack, blended into smo', 8, 6, 0, 1, '2024-02-11 05:20:50.584286', 5),
(15, 'guava', 'Guava', 'uploads/20240211122422guava.png', 'Per Kg', 95, 'Guavas, with their aromatic fragrance and unique flavor, are tropical fruits cherished for their exotic appeal and abundance of nutrients. Belonging to the Myrtaceae family, guavas come in different varieties, ranging from sweet to tart, and are known for their vibrant green or yellow skin and pink or white flesh filled with tiny seeds. Originating from tropical regions, guavas are packed with vitamin C, fiber, and antioxidants, promoting immune health and digestion. Their versatile nature allow', 7, 5, 0, 1, '2024-02-11 05:24:22.345048', 5),
(16, 'plum', 'Plum', 'uploads/20240211122541plum.png', 'Per Kg', 97, 'Plums, with their smooth skins and juicy flesh, are succulent fruits celebrated for their sweet-tart flavor and versatility. Belonging to the Rosaceae family, plums come in a variety of colors, including deep purple, red, yellow, and green, each offering its own distinct taste and texture. Originating from temperate regions, plums are rich in vitamins, minerals, and antioxidants, making them a nutritious addition to any diet. Whether enjoyed fresh as a wholesome snack, baked into pies and tarts,', 8, 6, 0, 1, '2024-02-11 05:25:41.603818', 5),
(17, 'pineapple', 'Pineapple', 'uploads/20240211122713pineapple.png', 'Per Kg', 100, 'Pineapples, with their spiky exteriors and sweet, juicy flesh, are tropical fruits renowned for their refreshing taste and vibrant aroma. Belonging to the Bromeliaceae family, pineapples are characterized by their crown of spiky green leaves and golden-yellow skin. Originating from tropical regions, particularly South America, pineapples are rich in vitamin C, manganese, and bromelain, an enzyme known for its digestive benefits and anti-inflammatory properties. Whether enjoyed fresh, grilled, ju', 9, 7, 0, 1, '2024-02-11 05:27:13.317551', 5),
(18, 'litchi', 'Litchi', 'uploads/20240211122931litchi.png', 'Per Kg', 99, 'Litchis, with their rough red exteriors and translucent white flesh, are exotic fruits prized for their sweet and fragrant taste. Belonging to the Sapindaceae family, litchis are native to tropical and subtropical regions of Asia and are celebrated for their juicy texture and floral aroma. Rich in vitamin C, antioxidants, and essential minerals, litchis offer a refreshing and nutritious indulgence. Whether enjoyed fresh, peeled and eaten whole, or added to fruit salads and desserts, litchis prov', 8, 6, 0, 1, '2024-02-11 05:29:31.429958', 5),
(19, 'kiwi', 'Kiwi', 'uploads/20240211123108Kiwi.png', 'Per Kg', 100, 'Kiwi, with its fuzzy brown exterior and vibrant green flesh speckled with tiny black seeds, is a distinctive fruit renowned for its tangy-sweet flavor and nutritional benefits. Belonging to the Actinidiaceae family, kiwi originates from China but is now cultivated in various temperate climates around the world. Packed with vitamin C, vitamin K, fiber, and antioxidants, kiwi offers a delicious and nutrient-dense addition to any diet. Whether enjoyed sliced and eaten fresh, blended into smoothies,', 13, 10, 0, 1, '2024-02-11 05:31:08.908825', 5),
(20, 'passion', 'Passion', 'uploads/20240211123306passion.png', 'Per Kg', 98, 'Passion fruit, with its wrinkled purple or yellow skin and gelatinous seeds encased in aromatic pulp, is an exotic fruit celebrated for its unique flavor and tropical essence. Belonging to the Passifloraceae family, passion fruit is native to South America but is now cultivated in many tropical and subtropical regions worldwide. Rich in vitamins A and C, fiber, and antioxidants, passion fruit offers a tangy-sweet taste and a burst of nutrients. Whether enjoyed fresh, scooped straight from the sh', 8, 6, 0, 1, '2024-02-11 05:33:06.255670', 5),
(21, 'rambutan', 'Rambutan', 'uploads/20240211123515Rambutan.png', 'Per Kg', 100, 'Rambutan', 10, 8, 0, 1, '2024-02-11 05:35:15.843943', 5),
(22, 'durian', 'Durian', 'uploads/20240211123730durian.png', 'Per Kg', 100, 'Durian', 15, 13, 0, 1, '2024-02-11 05:36:28.760739', 5),
(23, 'pomelo', 'Pomelo', 'uploads/20240211124152pomelo.png', 'Per Kg', 100, 'Pomelo', 8, 6, 0, 1, '2024-02-11 05:41:52.269514', 6),
(24, 'blueberry', 'Blueberry', 'uploads/20240211124334Blueberry.png', 'Per Kg', 100, 'Blueberry', 9, 6, 0, 1, '2024-02-11 05:43:34.710977', 6),
(25, 'banana', 'Banana', 'uploads/20240211124458Banana.png', 'Per Kg', 99, 'Banana', 8, 6, 0, 1, '2024-02-11 05:44:58.455663', 6),
(26, 'pear', 'Pear', 'uploads/20240211124635Pear.png', 'Per Kg', 100, 'Pear', 8, 5, 0, 1, '2024-02-11 05:46:35.067070', 6),
(27, 'mango', 'Mango', 'uploads/20240211124819Mango.png', 'Per Kg', 100, 'Mangoes, with their golden-yellow skin and succulent flesh, embody the essence of tropical indulgence. Renowned for their sweet, aromatic flavor and velvety texture, mangoes are a beloved fruit cherished worldwide. Originating from regions like South Asia and Southeast Asia, mangoes have become a symbol of summer abundance and exotic allure. Bursting with vitamins, minerals, and antioxidants, mangoes offer a nutritious treat that satisfies both the palate and the body. Whether enjoyed fresh, ble', 8, 6, 0, 1, '2024-02-11 05:48:19.421083', 6),
(28, 'orange', 'Orange', 'uploads/20240211124919Orange.png', 'Per Kg', 100, 'Oranges, with their bright citrus hues and tangy-sweet flavor, are nature\'s refreshing gems, cherished for their vibrant taste and abundant health benefits. As members of the Rutaceae family, oranges come in various types, including navel, Valencia, and blood oranges, each offering its own unique taste and characteristics. Originating from tropical and subtropical regions, oranges have become synonymous with sunshine and vitality, symbolizing freshness and rejuvenation. Packed with vitamin C, fi', 8, 6, 0, 1, '2024-02-11 05:49:19.807197', 6),
(29, 'passion', 'Passion', 'uploads/20240211125021passion.png', 'Per Kg', 100, 'Passion', 9, 7, 0, 1, '2024-02-11 05:50:21.919545', 6),
(30, 'custard apple', 'Custard Apple', 'uploads/20240211125224Custard_apple.png', 'Custard Apple', 100, 'Custard apple, with its lumpy green skin and creamy white flesh, is a tropical fruit cherished for its sweet and custard-like flavor. Belonging to the Annonaceae family, custard apples are native to regions like South America, Asia, and Africa, where they thrive in warm climates. Rich in vitamins, minerals, and antioxidants, custard apples offer a nutritious and delicious treat. Their soft and velvety texture, along with their delicate aroma, makes them a delightful addition to desserts, smoothi', 10, 8, 0, 1, '2024-02-11 05:52:24.872718', 6),
(31, 'grape', 'Grape', 'uploads/20240211125318Grape.png', 'Per Kg', 100, 'Grapes, with their luscious clusters and juicy orbs, embody the essence of natural sweetness and elegance. Belonging to the Vitaceae family, grapes are revered for their diverse flavors, ranging from the rich sweetness of red grapes to the subtle tartness of green varieties. With origins tracing back thousands of years, grapes hold a significant place in human history and culture, symbolizing fertility, abundance, and celebration. Bursting with vitamins, minerals, and antioxidants, grapes offer', 13, 11, 0, 1, '2024-02-11 05:53:18.747557', 6),
(32, 'dragonfruit', 'Dragon Fruit', 'uploads/20240211125527Dragon_fruit.png', 'Per Kg', 99, 'Dragon fruit, with its vibrant pink or yellow skin and speckled flesh flecked with tiny black seeds, is an exotic fruit celebrated for its striking appearance and refreshing taste. Belonging to the Cactaceae family, dragon fruit is native to Central and South America but is now cultivated in various tropical regions around the world. Rich in vitamins, antioxidants, and fiber, dragon fruit offers a nutritious and hydrating option. Its mild and subtly sweet flavor, reminiscent of a blend of kiwi a', 9, 6, 0, 1, '2024-02-11 05:55:27.595470', 6),
(33, 'persimmon', 'Persimmon', 'uploads/20240211130116persimmon.png', 'Per Kg', 99, 'Persimmons, with their smooth, orange skin and sweet, honeyed flesh, are delightful fruits cherished for their unique flavor and vibrant color. Belonging to the Ebenaceae family, persimmons are native to East Asia but are now cultivated in various temperate regions around the world. Rich in vitamins A and C, as well as dietary fiber, persimmons offer a nutritious and flavorful addition to any diet. Whether enjoyed fresh as a juicy snack, sliced into salads, or baked into pies and bread, persimmo', 7, 5, 0, 1, '2024-02-11 05:57:48.234931', 7),
(34, 'orange', 'Orange', 'uploads/20240211125832Orange.png', 'Per Kg', 100, 'Oranges, with their bright citrus hues and tangy-sweet flavor, are nature\'s refreshing gems, cherished for their vibrant taste and abundant health benefits. As members of the Rutaceae family, oranges come in various types, including navel, Valencia, and blood oranges, each offering its own unique taste and characteristics. Originating from tropical and subtropical regions, oranges have become synonymous with sunshine and vitality, symbolizing freshness and rejuvenation. Packed with vitamin C, fi', 9, 7, 0, 1, '2024-02-11 05:58:32.152644', 7),
(35, 'pear', 'Pear', 'uploads/20240211125859Pear.png', 'Per Kg', 100, 'Pears, with their smooth, rounded shapes and delicate skin, offer a sweet and subtly juicy taste that epitomizes the essence of autumn. Belonging to the Rosaceae family, pears come in a variety of colors, from golden yellow to vibrant reds and greens, each with its own unique flavor profile and texture. With a rich history spanning centuries, pears have become a symbol of longevity, wisdom, and grace in various cultures worldwide. Packed with fiber, vitamins, and antioxidants, pears not only del', 8, 7, 0, 1, '2024-02-11 05:58:59.212716', 7),
(36, 'apple', 'Apple', 'uploads/20240211125929Apple.png', 'Per Kg', 100, 'Apples, with their crisp texture and sweet-tart flavor, stand as one of the most iconic fruits, beloved for their versatility and nutritional value. Originating from the Rosaceae family, apples come in a wide array of varieties, each offering its own distinct taste, color, and texture. From the classic sweetness of Fuji to the tangy bite of Granny Smith, apples cater to diverse preferences and culinary uses. Rich in fiber, vitamins, and antioxidants, apples not only promote digestive health but', 8, 6, 0, 1, '2024-02-11 05:59:29.666714', 7),
(37, 'kiwi', 'Kiwi', 'uploads/20240211130004Kiwi.png', 'Per Kg', 100, 'Kiwi, with its fuzzy brown exterior and vibrant green flesh speckled with tiny black seeds, is a distinctive fruit renowned for its tangy-sweet flavor and nutritional benefits. Belonging to the Actinidiaceae family, kiwi originates from China but is now cultivated in various temperate climates around the world. Packed with vitamin C, vitamin K, fiber, and antioxidants, kiwi offers a delicious and nutrient-dense addition to any diet. Whether enjoyed sliced and eaten fresh, blended into smoothies,', 7, 6, 0, 1, '2024-02-11 06:00:04.957586', 7),
(38, 'pomegranate', 'Pomegranate', 'uploads/20240211130237Pomegranate.png', 'Per Kg', 100, 'Pomegranates, with their crimson hues and jewel-like seeds, are celebrated for their unique flavor and abundance of health benefits. Belonging to the family Lythraceae, pomegranates have a rich history dating back centuries and are revered in many cultures for their symbolic significance and medicinal properties. Bursting with antioxidants, vitamins, and minerals, pomegranates offer a powerful boost to heart health, immunity, and overall well-being. Their tart yet sweet taste adds depth to both', 8, 6, 0, 1, '2024-02-11 06:02:37.692526', 7),
(39, 'banana', 'Banana', 'uploads/20240211130316Banana.png', 'Per Kg', 100, 'Bananas, with their distinctive curved shape and bright yellow peel, are beloved fruits known for their sweet flavor and creamy texture. Belonging to the Musaceae family, bananas are native to tropical regions but are now cultivated in many parts of the world. Rich in potassium, vitamins B6 and C, and dietary fiber, bananas offer a nutritious and convenient snack option. Whether eaten fresh, sliced onto cereal or yogurt, or blended into smoothies, bananas provide a natural source of energy and e', 9, 7, 0, 1, '2024-02-11 06:03:16.650570', 7),
(40, 'pomelo', 'Pomelo', 'uploads/20240211130407pomelo.png', 'Per Kg', 100, 'Pomelos, with their thick, yellow-green rind and juicy, citrusy flesh, are large and refreshing fruits known for their unique taste and nutritional benefits. Belonging to the Rutaceae family, pomelos are native to Southeast Asia and are now cultivated in various tropical and subtropical regions around the world. Rich in vitamin C, antioxidants, and dietary fiber, pomelos offer a delicious and healthy snack option. Their slightly sweet and tangy flavor makes them a delightful addition to fruit sa', 8, 6, 0, 1, '2024-02-11 06:04:07.823975', 7),
(41, 'carrot', 'Carrot', 'uploads/20240211130546Carrot.png', 'Per Kg', 99, 'Carrots, with their vibrant orange hue and crisp texture, are root vegetables prized for their sweet flavor and nutritional value. Belonging to the Apiaceae family, carrots are native to Eurasia but are now cultivated worldwide in various shapes and colors. Rich in beta-carotene, vitamins, and dietary fiber, carrots offer a multitude of health benefits, including improved vision, immune support, and digestion. Whether enjoyed raw as a crunchy snack, cooked into soups and stews, or grated into sa', 8, 6, 0, 1, '2024-02-11 06:05:46.489216', 7);

-- --------------------------------------------------------

--
-- Table structure for table `store_profile`
--

CREATE TABLE `store_profile` (
  `id` bigint(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `specific_address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_profile`
--

INSERT INTO `store_profile` (`id`, `phone`, `city`, `district`, `specific_address`, `created_at`, `user_id`) VALUES
(1, '312312312', 'Hà Nội', 'Thanh Trì', 'xom 2 quynh do', '2024-01-24 16:22:30.945196', 1),
(2, '312312', 'Hà Nội', 'Thanh Trì', 'xom 3 quynh do', '2024-02-03 06:35:05.083395', 3);

-- --------------------------------------------------------

--
-- Table structure for table `store_wishlist`
--

CREATE TABLE `store_wishlist` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_wishlist`
--

INSERT INTO `store_wishlist` (`id`, `created_at`, `product_id`, `user_id`) VALUES
(6, '2024-02-08 15:07:43.933223', 3, 3),
(19, '2024-02-21 14:59:34.590329', 4, 1),
(20, '2024-02-22 08:08:57.847728', 25, 1),
(21, '2024-02-22 08:09:06.546135', 8, 1),
(22, '2024-02-23 03:06:27.260049', 14, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tools_stats_cachedvalue`
--
ALTER TABLE `admin_tools_stats_cachedvalue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_tools_stats_cachedvalue_stats_id_952da855_fk` (`stats_id`),
  ADD KEY `admin_tools_stats_cachedv_multiple_series_choice_id_f68b8312_fk` (`multiple_series_choice_id`);

--
-- Indexes for table `admin_tools_stats_criteriatostatsm2m`
--
ALTER TABLE `admin_tools_stats_criteriatostatsm2m`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order` (`order`),
  ADD KEY `admin_tools_stats_criteriatostatsm2m_stats_id_10bd79ea_fk` (`stats_id`),
  ADD KEY `admin_tools_stats_criteriatostatsm2m_criteria_id_bfe67f05_fk` (`criteria_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `dashboard_stats`
--
ALTER TABLE `dashboard_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `graph_key` (`graph_key`),
  ADD KEY `dashboard_stats_graph_title_99e6d271` (`graph_title`),
  ADD KEY `dashboard_stats_default_multiseries_criteria_id_1c00740c_fk` (`default_multiseries_criteria_id`);

--
-- Indexes for table `dash_stats_criteria`
--
ALTER TABLE `dash_stats_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dash_stats_criteria_criteria_name_7fe7ae1e` (`criteria_name`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `store_cart`
--
ALTER TABLE `store_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_cart_product_id_b219c080_fk_store_product_id` (`product_id`),
  ADD KEY `store_cart_user_id_99e99107_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_news`
--
ALTER TABLE `store_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_news_author_id_15dfe473_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `store_order`
--
ALTER TABLE `store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_order_user_id_ae5f7a5f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `store_orderitem`
--
ALTER TABLE `store_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_orderitem_order_id_acf8722d_fk_store_order_id` (`order_id`),
  ADD KEY `store_orderitem_product_id_f2b098d4_fk_store_product_id` (`product_id`);

--
-- Indexes for table `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_category_id_574bae65_fk_store_category_id` (`category_id`);

--
-- Indexes for table `store_profile`
--
ALTER TABLE `store_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_profile_user_id_d67604a1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `store_wishlist`
--
ALTER TABLE `store_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_wishlist_product_id_8af1333d_fk_store_product_id` (`product_id`),
  ADD KEY `store_wishlist_user_id_afcc4e88_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tools_stats_cachedvalue`
--
ALTER TABLE `admin_tools_stats_cachedvalue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_tools_stats_criteriatostatsm2m`
--
ALTER TABLE `admin_tools_stats_criteriatostatsm2m`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_stats`
--
ALTER TABLE `dashboard_stats`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dash_stats_criteria`
--
ALTER TABLE `dash_stats_criteria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `store_cart`
--
ALTER TABLE `store_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `store_category`
--
ALTER TABLE `store_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `store_news`
--
ALTER TABLE `store_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `store_order`
--
ALTER TABLE `store_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `store_orderitem`
--
ALTER TABLE `store_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `store_profile`
--
ALTER TABLE `store_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_wishlist`
--
ALTER TABLE `store_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_tools_stats_cachedvalue`
--
ALTER TABLE `admin_tools_stats_cachedvalue`
  ADD CONSTRAINT `admin_tools_stats_cachedv_multiple_series_choice_id_f68b8312_fk` FOREIGN KEY (`multiple_series_choice_id`) REFERENCES `dash_stats_criteria` (`id`),
  ADD CONSTRAINT `admin_tools_stats_cachedvalue_stats_id_952da855_fk` FOREIGN KEY (`stats_id`) REFERENCES `dashboard_stats` (`id`);

--
-- Constraints for table `admin_tools_stats_criteriatostatsm2m`
--
ALTER TABLE `admin_tools_stats_criteriatostatsm2m`
  ADD CONSTRAINT `admin_tools_stats_criteriatostatsm2m_criteria_id_bfe67f05_fk` FOREIGN KEY (`criteria_id`) REFERENCES `dash_stats_criteria` (`id`),
  ADD CONSTRAINT `admin_tools_stats_criteriatostatsm2m_stats_id_10bd79ea_fk` FOREIGN KEY (`stats_id`) REFERENCES `dashboard_stats` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `dashboard_stats`
--
ALTER TABLE `dashboard_stats`
  ADD CONSTRAINT `dashboard_stats_default_multiseries_criteria_id_1c00740c_fk` FOREIGN KEY (`default_multiseries_criteria_id`) REFERENCES `admin_tools_stats_criteriatostatsm2m` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_cart`
--
ALTER TABLE `store_cart`
  ADD CONSTRAINT `store_cart_product_id_b219c080_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_cart_user_id_99e99107_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_news`
--
ALTER TABLE `store_news`
  ADD CONSTRAINT `store_news_author_id_15dfe473_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_order`
--
ALTER TABLE `store_order`
  ADD CONSTRAINT `store_order_user_id_ae5f7a5f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_orderitem`
--
ALTER TABLE `store_orderitem`
  ADD CONSTRAINT `store_orderitem_order_id_acf8722d_fk_store_order_id` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`id`),
  ADD CONSTRAINT `store_orderitem_product_id_f2b098d4_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`);

--
-- Constraints for table `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_category_id_574bae65_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`);

--
-- Constraints for table `store_profile`
--
ALTER TABLE `store_profile`
  ADD CONSTRAINT `store_profile_user_id_d67604a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_wishlist`
--
ALTER TABLE `store_wishlist`
  ADD CONSTRAINT `store_wishlist_product_id_8af1333d_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_wishlist_user_id_afcc4e88_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
