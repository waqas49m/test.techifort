-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2024 at 12:52 PM
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
-- Database: `mftp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `account_num` varchar(192) NOT NULL,
  `account_name` varchar(192) NOT NULL,
  `initial_balance` decimal(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `items` double DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_details`
--

CREATE TABLE `adjustment_details` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `quantity` double NOT NULL,
  `type` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `description` varchar(192) DEFAULT NULL,
  `image` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ErthSkin London', 'New Brand', 'image_default.png', '2024-01-15 20:27:33.000000', '2024-01-19 04:51:15.000000', '2024-01-19 04:51:15'),
(2, 'Vegan By Happy Skin', '2nd brand', 'image_default.png', '2024-01-15 20:27:58.000000', '2024-01-19 04:51:18.000000', '2024-01-19 04:51:18'),
(3, 'Eclat Skin London', 'Eclat Skin London Brand', '1705661498.jpg', '2024-01-19 05:51:38.000000', '2024-01-19 05:51:38.000000', NULL),
(4, 'Dr. Eve_Ryouth', 'Dr. Eve_Ryouth Brand', '1705661563.jpg', '2024-01-19 05:52:43.000000', '2024-01-19 05:52:43.000000', NULL),
(5, 'Lodon Botanical Laboratories', 'Lodon Botanical Laboratories Brand', '1705661635.jpg', '2024-01-19 05:53:55.000000', '2024-01-19 05:53:55.000000', NULL),
(6, 'Vegan By Happy Skin', 'Vegan By Happy Skin Brand', '1705661683.jpg', '2024-01-19 05:54:43.000000', '2024-01-19 05:54:43.000000', NULL),
(7, 'Warda Skincare', 'Warda Skincare Brand', '1705661726.png', '2024-01-19 05:55:26.000000', '2024-01-19 05:55:26.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `code` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `code`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '123', 'Skincare Face', '2024-01-16 17:01:24.000000', '2024-01-16 17:01:24.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `code` varchar(192) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(192) DEFAULT NULL,
  `email` varchar(192) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `symbol` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USD', 'US Dollar', '$', NULL, '2024-02-07 17:15:39.000000', '2024-02-07 17:15:39'),
(2, 'GBP', 'British Pound', '£', '2024-01-22 03:14:09.000000', '2024-01-22 03:14:09.000000', NULL),
(3, 'EUR', 'Euro', '€', '2024-01-22 03:15:07.000000', '2024-02-07 17:15:44.000000', '2024-02-07 17:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `deposit_category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `deposit_ref` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_categories`
--

CREATE TABLE `deposit_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_messages`
--

CREATE TABLE `email_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(192) DEFAULT NULL,
  `subject` varchar(192) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_messages`
--

INSERT INTO `email_messages` (`id`, `name`, `subject`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sale', 'Thank you for your purchase!', '<h1><span>Dear  {contact_name},</span></h1><p style=\"color:rgb(17,24,39);font-size:16px;\">Thank you for your purchase! Your invoice number is {invoice_number}.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">If you have any questions or concerns, please don\'t hesitate to reach out to us. We are here to help!</p><p style=\"color:rgb(17,24,39);font-size:16px;\">Best regards,</p><p style=\"color:rgb(17,24,39);font-size:16px;\"><span>{business_name}</span></p>', NULL, NULL, NULL),
(2, 'quotation', 'Thank you for your interest in our products !', '<p style=\"color:rgb(17,24,39);font-size:16px;\"><span>Dear {contact_name},</span></p><p style=\"color:rgb(17,24,39);font-size:16px;\">Thank you for your interest in our products. Your quotation number is {quotation_number}.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">Please let us know if you have any questions or concerns regarding your quotation. We are here to assist you.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">Best regards,</p><p style=\"color:rgb(17,24,39);font-size:16px;\"><span>{business_name}</span></p>', NULL, NULL, NULL),
(3, 'payment_received', 'Payment Received - Thank You', '<p style=\"color:rgb(17,24,39);font-size:16px;\"><span>Dear {contact_name},</span></p><p style=\"color:rgb(17,24,39);font-size:16px;\">Thank you for making your payment. We have received it and it has been processed successfully.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">If you have any further questions or concerns, please don\'t hesitate to reach out to us. We are always here to help.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">Best regards,</p><p style=\"color:rgb(17,24,39);font-size:16px;\"><span>{business_name}</span></p>', NULL, NULL, NULL),
(4, 'purchase', 'Thank You for Your Cooperation and Service', '<p style=\"color:rgb(17,24,39);font-size:16px;\"><span>Dear {contact_name},</span></p><p style=\"color:rgb(17,24,39);font-size:16px;\">I recently made a purchase from your company and I wanted to thank you for your cooperation and service. My invoice number is {invoice_number} .</p><p style=\"color:rgb(17,24,39);font-size:16px;\">If you have any questions or concerns regarding my purchase, please don\'t hesitate to contact me. I am here to make sure I have a positive experience with your company.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">Best regards,</p><p style=\"color:rgb(17,24,39);font-size:16px;\"><span>{business_name}</span></p>', NULL, NULL, NULL),
(5, 'payment_sent', 'Payment Sent - Thank You for Your Service', '<p style=\"color:rgb(17,24,39);font-size:16px;\"><span>Dear {contact_name},</span></p><p style=\"color:rgb(17,24,39);font-size:16px;\">We have just sent the payment . We appreciate your prompt attention to this matter and the high level of service you provide.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">If you need any further information or clarification, please do not hesitate to reach out to us. We are here to help.</p><p style=\"color:rgb(17,24,39);font-size:16px;\">Best regards,</p><p style=\"color:rgb(17,24,39);font-size:16px;\"><span>{business_name}</span></p>', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `expense_ref` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
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
(1, '2023_06_15_231338_create_accounts_table', 1),
(2, '2023_06_15_231338_create_adjustment_details_table', 1),
(3, '2023_06_15_231338_create_adjustments_table', 1),
(4, '2023_06_15_231338_create_brands_table', 1),
(5, '2023_06_15_231338_create_categories_table', 1),
(6, '2023_06_15_231338_create_clients_table', 1),
(7, '2023_06_15_231338_create_currencies_table', 1),
(8, '2023_06_15_231338_create_deposit_categories_table', 1),
(9, '2023_06_15_231338_create_deposits_table', 1),
(10, '2023_06_15_231338_create_email_messages_table', 1),
(11, '2023_06_15_231338_create_expense_categories_table', 1),
(12, '2023_06_15_231338_create_expenses_table', 1),
(13, '2023_06_15_231338_create_model_has_permissions_table', 1),
(14, '2023_06_15_231338_create_model_has_roles_table', 1),
(15, '2023_06_15_231338_create_password_resets_table', 1),
(16, '2023_06_15_231338_create_payment_methods_table', 1),
(17, '2023_06_15_231338_create_payment_purchase_returns_table', 1),
(18, '2023_06_15_231338_create_payment_purchases_table', 1),
(19, '2023_06_15_231338_create_payment_sale_returns_table', 1),
(20, '2023_06_15_231338_create_payment_sales_table', 1),
(21, '2023_06_15_231338_create_permissions_table', 1),
(22, '2023_06_15_231338_create_personal_access_tokens_table', 1),
(23, '2023_06_15_231338_create_pos_settings_table', 1),
(24, '2023_06_15_231338_create_product_variants_table', 1),
(25, '2023_06_15_231338_create_product_warehouse_table', 1),
(26, '2023_06_15_231338_create_products_table', 1),
(27, '2023_06_15_231338_create_providers_table', 1),
(28, '2023_06_15_231338_create_purchase_details_table', 1),
(29, '2023_06_15_231338_create_purchase_return_details_table', 1),
(30, '2023_06_15_231338_create_purchase_returns_table', 1),
(31, '2023_06_15_231338_create_purchases_table', 1),
(32, '2023_06_15_231338_create_quotation_details_table', 1),
(33, '2023_06_15_231338_create_quotations_table', 1),
(34, '2023_06_15_231338_create_role_has_permissions_table', 1),
(35, '2023_06_15_231338_create_roles_table', 1),
(36, '2023_06_15_231338_create_sale_details_table', 1),
(37, '2023_06_15_231338_create_sale_return_details_table', 1),
(38, '2023_06_15_231338_create_sale_returns_table', 1),
(39, '2023_06_15_231338_create_sales_table', 1),
(40, '2023_06_15_231338_create_settings_table', 1),
(41, '2023_06_15_231338_create_sms_messages_table', 1),
(42, '2023_06_15_231338_create_transfer_details_table', 1),
(43, '2023_06_15_231338_create_transfers_table', 1),
(44, '2023_06_15_231338_create_units_table', 1),
(45, '2023_06_15_231338_create_user_warehouse_table', 1),
(46, '2023_06_15_231338_create_users_table', 1),
(47, '2023_06_15_231338_create_warehouses_table', 1),
(48, '2023_06_15_231341_add_foreign_keys_to_adjustment_details_table', 1),
(49, '2023_06_15_231341_add_foreign_keys_to_adjustments_table', 1),
(50, '2023_06_15_231341_add_foreign_keys_to_clients_table', 1),
(51, '2023_06_15_231341_add_foreign_keys_to_deposits_table', 1),
(52, '2023_06_15_231341_add_foreign_keys_to_expenses_table', 1),
(53, '2023_06_15_231341_add_foreign_keys_to_model_has_permissions_table', 1),
(54, '2023_06_15_231341_add_foreign_keys_to_model_has_roles_table', 1),
(55, '2023_06_15_231341_add_foreign_keys_to_payment_purchase_returns_table', 1),
(56, '2023_06_15_231341_add_foreign_keys_to_payment_purchases_table', 1),
(57, '2023_06_15_231341_add_foreign_keys_to_payment_sale_returns_table', 1),
(58, '2023_06_15_231341_add_foreign_keys_to_payment_sales_table', 1),
(59, '2023_06_15_231341_add_foreign_keys_to_product_variants_table', 1),
(60, '2023_06_15_231341_add_foreign_keys_to_product_warehouse_table', 1),
(61, '2023_06_15_231341_add_foreign_keys_to_products_table', 1),
(62, '2023_06_15_231341_add_foreign_keys_to_providers_table', 1),
(63, '2023_06_15_231341_add_foreign_keys_to_purchase_details_table', 1),
(64, '2023_06_15_231341_add_foreign_keys_to_purchase_return_details_table', 1),
(65, '2023_06_15_231341_add_foreign_keys_to_purchase_returns_table', 1),
(66, '2023_06_15_231341_add_foreign_keys_to_purchases_table', 1),
(67, '2023_06_15_231341_add_foreign_keys_to_quotation_details_table', 1),
(68, '2023_06_15_231341_add_foreign_keys_to_quotations_table', 1),
(69, '2023_06_15_231341_add_foreign_keys_to_role_has_permissions_table', 1),
(70, '2023_06_15_231341_add_foreign_keys_to_sale_details_table', 1),
(71, '2023_06_15_231341_add_foreign_keys_to_sale_return_details_table', 1),
(72, '2023_06_15_231341_add_foreign_keys_to_sale_returns_table', 1),
(73, '2023_06_15_231341_add_foreign_keys_to_sales_table', 1),
(74, '2023_06_15_231341_add_foreign_keys_to_settings_table', 1),
(75, '2023_06_15_231341_add_foreign_keys_to_transfer_details_table', 1),
(76, '2023_06_15_231341_add_foreign_keys_to_transfers_table', 1),
(77, '2023_06_15_231341_add_foreign_keys_to_units_table', 1),
(78, '2023_06_15_231341_add_foreign_keys_to_user_warehouse_table', 1),
(79, '2023_06_15_231341_add_foreign_keys_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `title` varchar(192) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `is_default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Other Payment Method', 0, NULL, NULL, NULL),
(2, 'Paypal', 1, NULL, NULL, NULL),
(3, 'Bank transfer', 0, NULL, NULL, NULL),
(4, 'Credit card', 1, NULL, NULL, NULL),
(5, 'Check', 0, NULL, NULL, NULL),
(6, 'Cash', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_purchases`
--

CREATE TABLE `payment_purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_method_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_purchase_returns`
--

CREATE TABLE `payment_purchase_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_method_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_sales`
--

CREATE TABLE `payment_sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `Ref` varchar(192) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_method_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_sale_returns`
--

CREATE TABLE `payment_sale_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `sale_return_id` int(11) NOT NULL,
  `montant` double NOT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_method_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(192) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_view', 'web', NULL, NULL, NULL),
(2, 'user_add', 'web', NULL, NULL, NULL),
(3, 'user_edit', 'web', NULL, NULL, NULL),
(4, 'user_delete', 'web', NULL, NULL, NULL),
(5, 'account_view', 'web', NULL, NULL, NULL),
(6, 'account_add', 'web', NULL, NULL, NULL),
(7, 'account_edit', 'web', NULL, NULL, NULL),
(8, 'account_delete', 'web', NULL, NULL, NULL),
(9, 'deposit_view', 'web', NULL, NULL, NULL),
(10, 'deposit_add', 'web', NULL, NULL, NULL),
(11, 'deposit_edit', 'web', NULL, NULL, NULL),
(12, 'deposit_delete', 'web', NULL, NULL, NULL),
(13, 'expense_view', 'web', NULL, NULL, NULL),
(14, 'expense_add', 'web', NULL, NULL, NULL),
(15, 'expense_edit', 'web', NULL, NULL, NULL),
(16, 'expense_delete', 'web', NULL, NULL, NULL),
(17, 'client_view_all', 'web', NULL, NULL, NULL),
(18, 'client_add', 'web', NULL, NULL, NULL),
(19, 'client_edit', 'web', NULL, NULL, NULL),
(20, 'client_delete', 'web', NULL, NULL, NULL),
(21, 'deposit_category', 'web', NULL, NULL, NULL),
(22, 'payment_method', 'web', NULL, NULL, NULL),
(23, 'expense_category', 'web', NULL, NULL, NULL),
(24, 'settings', 'web', NULL, NULL, NULL),
(25, 'currency', 'web', NULL, NULL, NULL),
(26, 'backup', 'web', NULL, NULL, NULL),
(27, 'group_permission', 'web', NULL, NULL, NULL),
(28, 'products_view', 'web', NULL, NULL, NULL),
(29, 'products_add', 'web', NULL, NULL, NULL),
(30, 'products_edit', 'web', NULL, NULL, NULL),
(31, 'products_delete', 'web', NULL, NULL, NULL),
(32, 'barcode_view', 'web', NULL, NULL, NULL),
(33, 'category', 'web', NULL, NULL, NULL),
(34, 'brand', 'web', NULL, NULL, NULL),
(35, 'unit', 'web', NULL, NULL, NULL),
(36, 'warehouse', 'web', NULL, NULL, NULL),
(37, 'adjustment_view_all', 'web', NULL, NULL, NULL),
(38, 'adjustment_add', 'web', NULL, NULL, NULL),
(39, 'adjustment_edit', 'web', NULL, NULL, NULL),
(40, 'adjustment_delete', 'web', NULL, NULL, NULL),
(41, 'transfer_view_all', 'web', NULL, NULL, NULL),
(42, 'transfer_add', 'web', NULL, NULL, NULL),
(43, 'transfer_edit', 'web', NULL, NULL, NULL),
(44, 'transfer_delete', 'web', NULL, NULL, NULL),
(45, 'sales_view_all', 'web', NULL, NULL, NULL),
(46, 'sales_add', 'web', NULL, NULL, NULL),
(47, 'sales_edit', 'web', NULL, NULL, NULL),
(48, 'sales_delete', 'web', NULL, NULL, NULL),
(49, 'bon_livraison', 'web', NULL, NULL, NULL),
(50, 'purchases_view_all', 'web', NULL, NULL, NULL),
(51, 'purchases_add', 'web', NULL, NULL, NULL),
(52, 'purchases_edit', 'web', NULL, NULL, NULL),
(53, 'purchases_delete', 'web', NULL, NULL, NULL),
(54, 'quotations_view_all', 'web', NULL, NULL, NULL),
(55, 'quotations_add', 'web', NULL, NULL, NULL),
(56, 'quotations_edit', 'web', NULL, NULL, NULL),
(57, 'quotations_delete', 'web', NULL, NULL, NULL),
(58, 'sale_returns_view_all', 'web', NULL, NULL, NULL),
(59, 'sale_returns_add', 'web', NULL, NULL, NULL),
(60, 'sale_returns_edit', 'web', NULL, NULL, NULL),
(61, 'sale_returns_delete', 'web', NULL, NULL, NULL),
(62, 'purchase_returns_view_all', 'web', NULL, NULL, NULL),
(63, 'purchase_returns_add', 'web', NULL, NULL, NULL),
(64, 'purchase_returns_edit', 'web', NULL, NULL, NULL),
(65, 'purchase_returns_delete', 'web', NULL, NULL, NULL),
(66, 'payment_sales_view', 'web', NULL, NULL, NULL),
(67, 'payment_sales_add', 'web', NULL, NULL, NULL),
(68, 'payment_sales_edit', 'web', NULL, NULL, NULL),
(69, 'payment_sales_delete', 'web', NULL, NULL, NULL),
(70, 'payment_purchases_view', 'web', NULL, NULL, NULL),
(71, 'payment_purchases_add', 'web', NULL, NULL, NULL),
(72, 'payment_purchases_edit', 'web', NULL, NULL, NULL),
(73, 'payment_purchases_delete', 'web', NULL, NULL, NULL),
(74, 'payment_sell_returns_view', 'web', NULL, NULL, NULL),
(75, 'payment_sell_returns_add', 'web', NULL, NULL, NULL),
(76, 'payment_sell_returns_edit', 'web', NULL, NULL, NULL),
(77, 'payment_sell_returns_delete', 'web', NULL, NULL, NULL),
(78, 'suppliers_view_all', 'web', NULL, NULL, NULL),
(79, 'suppliers_add', 'web', NULL, NULL, NULL),
(80, 'suppliers_edit', 'web', NULL, NULL, NULL),
(81, 'suppliers_delete', 'web', NULL, NULL, NULL),
(82, 'sale_reports', 'web', NULL, NULL, NULL),
(83, 'purchase_reports', 'web', NULL, NULL, NULL),
(84, 'payment_sale_reports', 'web', NULL, NULL, NULL),
(85, 'payment_purchase_reports', 'web', NULL, NULL, NULL),
(86, 'payment_return_sale_reports', 'web', NULL, NULL, NULL),
(87, 'top_products_report', 'web', NULL, NULL, NULL),
(88, 'report_products', 'web', NULL, NULL, NULL),
(89, 'report_inventaire', 'web', NULL, NULL, NULL),
(90, 'report_clients', 'web', NULL, NULL, NULL),
(91, 'report_fournisseurs', 'web', NULL, NULL, NULL),
(92, 'reports_devis', 'web', NULL, NULL, NULL),
(93, 'reports_alert_qty', 'web', NULL, NULL, NULL),
(94, 'pos', 'web', NULL, NULL, NULL),
(95, 'report_profit', 'web', NULL, NULL, NULL),
(96, 'dashboard', 'web', NULL, NULL, NULL),
(97, 'print_labels', 'web', NULL, NULL, NULL),
(98, 'adjustment_details', 'web', NULL, NULL, NULL),
(99, 'pay_sale_due', 'web', NULL, NULL, NULL),
(100, 'pay_sale_return_due', 'web', NULL, NULL, NULL),
(101, 'client_details', 'web', NULL, NULL, NULL),
(102, 'supplier_details', 'web', NULL, NULL, NULL),
(103, 'pay_purchase_due', 'web', NULL, NULL, NULL),
(104, 'pay_purchase_return_due', 'web', NULL, NULL, NULL),
(105, 'purchases_details', 'web', NULL, NULL, NULL),
(106, 'sales_details', 'web', NULL, NULL, NULL),
(107, 'quotation_details', 'web', NULL, NULL, NULL),
(108, 'sms_settings', 'web', NULL, NULL, NULL),
(109, 'notification_template', 'web', NULL, NULL, NULL),
(110, 'payment_purchase_returns_view', 'web', NULL, NULL, NULL),
(111, 'payment_purchase_returns_add', 'web', NULL, NULL, NULL),
(112, 'payment_purchase_returns_edit', 'web', NULL, NULL, NULL),
(113, 'payment_purchase_returns_delete', 'web', NULL, NULL, NULL),
(114, 'payment_return_purchase_reports', 'web', NULL, NULL, NULL),
(115, 'pos_settings', 'web', NULL, NULL, NULL),
(200, 'adjustment_view_own', 'web', NULL, NULL, NULL),
(201, 'transfer_view_own', 'web', NULL, NULL, NULL),
(202, 'sales_view_own', 'web', NULL, NULL, NULL),
(203, 'purchases_view_own', 'web', NULL, NULL, NULL),
(204, 'quotations_view_own', 'web', NULL, NULL, NULL),
(205, 'sale_returns_view_own', 'web', NULL, NULL, NULL),
(206, 'purchase_returns_view_own', 'web', NULL, NULL, NULL),
(207, 'client_view_own', 'web', NULL, NULL, NULL),
(208, 'suppliers_view_own', 'web', NULL, NULL, NULL),
(209, 'attendance_view_own', 'web', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_settings`
--

CREATE TABLE `pos_settings` (
  `id` int(11) NOT NULL,
  `note_customer` varchar(192) NOT NULL DEFAULT 'Thank You For Shopping With Us . Please Come Again',
  `show_note` tinyint(1) NOT NULL DEFAULT 1,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 1,
  `show_discount` tinyint(1) NOT NULL DEFAULT 1,
  `show_customer` tinyint(1) NOT NULL DEFAULT 1,
  `show_email` tinyint(1) NOT NULL DEFAULT 1,
  `show_phone` tinyint(1) NOT NULL DEFAULT 1,
  `show_address` tinyint(1) NOT NULL DEFAULT 1,
  `show_Warehouse` tinyint(1) NOT NULL DEFAULT 1,
  `is_printable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `note_customer`, `show_note`, `show_barcode`, `show_discount`, `show_customer`, `show_email`, `show_phone`, `show_address`, `show_Warehouse`, `is_printable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Thank You For Shopping With Us . Please Come Again', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `ean_code` varchar(192) NOT NULL,
  `Type_barcode` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `sku_code` varchar(255) DEFAULT NULL,
  `batch_code` varchar(255) DEFAULT NULL,
  `buying_price` double NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_unit` varchar(191) DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `cpnp` varchar(255) DEFAULT NULL,
  `made_in` varchar(191) DEFAULT NULL,
  `ingredients` longtext DEFAULT NULL,
  `product_usage` longtext DEFAULT NULL,
  `composition` varchar(255) DEFAULT NULL,
  `hs_code` varchar(255) DEFAULT NULL,
  `selling_unit_price` double DEFAULT NULL,
  `rrp` double DEFAULT NULL,
  `note` text DEFAULT NULL,
  `stock_alert` double DEFAULT 0,
  `production_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `artwork_file_link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `ean_code`, `Type_barcode`, `name`, `sku_code`, `batch_code`, `buying_price`, `category_id`, `brand_id`, `unit_id`, `image`, `weight`, `weight_unit`, `length`, `width`, `height`, `cpnp`, `made_in`, `ingredients`, `product_usage`, `composition`, `hs_code`, `selling_unit_price`, `rrp`, `note`, `stock_alert`, `production_date`, `expiry_date`, `artwork_file_link`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '637665744071', 'EAN13', 'Anti-Wrinkle Elixir Serum 24k Gold 60ml', 'ECS001', 'AB001', 4, 1, 3, NULL, 'https://res.cloudinary.com/dotitkupe/image/upload/v1630683478/637665744071_box_ggytck.jpg', 60, '60ml', 5, 5, 13.5, '12345', 'Poland', 'Aqua, Panthenol, Propylene Glycol, Glycerin, PEG-12 Dimethicone,  Saccharomyces/Magnesium Ferment, Saccharomyces/Iron Ferment, Saccharomyces/Copper Ferment,Saccharomyces/Silicon Ferment, Saccharomyces/Zinc Ferment, Tocopheryl Acetate, Allantoin, Retinyl Palmitate, Tocopherol, Helianthus Annuus Seed Oil, Olea Europea Leaf Extract, Camellia Sinensis Leaf Extract, Paeonia Officinalis Flower Extract, Daucus Carota Extract, Caviar Extract, Arnica Montana Flower Extract, Squalane, Ubiquinone, Mirystoyl Tripeptide-31, Collagen Amino Acids, Lactose, Gold, Sodium Hyaluronate, PEG-75 Lanolin, Potassium Silicate, Aluminium Silicate, Phenoxyethanol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Parfum, Butylene Glycol, Disodium EDTA, Ethylhexylglycerin, Potassium Sorbate, Synthetic Fluorphlogopite, Triethanolamine, CI 77891, CI 77861, CI 77491.', 'Directions for use: Take one or two pumps of the elixir serum to the tip of your fingers and dap a dot to your both cheeks, forehead, and chin. Massage evenly. Spread any leftovers to your neck and dÃ©colletage. For best results continue with Eclat Skin London Gold 24K Anti-Wrinkle Cream.', '60ml bottle', '330499000', 5, 39, 'NA', 1000, '2023-01-01', '2025-01-15', 'https://drive.google.com/file/d/17g6d0j1sgJ7Mq3JHO2Jj_QyD19JqH-4J/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(2, '637665744040', 'EAN13', 'Anti-Wrinkle Night Moisturiser 24k Gold 50ml', 'ECS002', 'CD002', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/moisturisers/products/anti-wrinkle-cream-24k-gold-50ml', 50, '50ml', 5, 5, 13.5, '123444', 'Poland', 'aajjajaja', 'ajajajajaj', '50ml jar', '330499000', 6, 59, 'NA', 1000, '2023-01-02', '2025-01-16', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(3, '637665744064', 'EAN13', 'Under Eye Cream 24k Gold 15ml', 'ECS003', 'EF08', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 3, 4, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 7, 29.99, 'NA', 1000, '2023-01-03', '2025-01-17', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(4, '637665743623', 'EAN13', 'COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS + PURIFYING BLACK PEEL-OFF MASK 24K GOLD', 'KECS015', 'AB001', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 5, 5, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 8, 33.653333333333, 'NA', 1000, '2023-01-04', '2025-01-18', 'https://drive.google.com/file/d/17g6d0j1sgJ7Mq3JHO2Jj_QyD19JqH-4J/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(5, '637665743647', 'EAN13', 'ANTI-WRINKLE ELIXIR SERUM 24K GOLD + COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS', 'KECS016', 'AB002', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 5, 5, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 9, 29.148333333333, 'NA', 1000, '2023-01-05', '2025-01-19', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(6, '637665743654', 'EAN13', 'UNDER EYE CREAM 24K GOLD + COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS', 'KECS017', 'AB003', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 3, 4, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 10, 24.643333333333, 'NA', 1000, '2023-01-06', '2025-01-20', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(7, '637665743661', 'EAN13', 'UNDER EYE CREAM 24K GOLD + PURIFYING BLACK PEEL-OFF MASK 24K GOLD', 'KECS018', 'AB004', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 5, 5, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 11, 20.138333333333, 'NA', 1000, '2023-01-07', '2025-01-21', 'https://drive.google.com/file/d/17g6d0j1sgJ7Mq3JHO2Jj_QyD19JqH-4J/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(8, '637665743678', 'EAN13', 'UNDER EYE CREAM 24K GOLD + COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS + PURIFYING BLACK PEEL-OFF MASK 24K GOLD', 'KECS019', 'AB005', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 5, 5, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 12, 15.633333333333, 'NA', 1000, '2023-01-08', '2025-01-22', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(9, '637665743685', 'EAN13', 'ANTI-WRINKLE Night MOISTURISER 24K GOLD + UNDER EYE CREAM 24K GOLD + COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS + PURIFYING BLACK PEEL-OFF MASK 24K GOLD', 'KECS020', 'AB006', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 3, 4, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 13, 11.128333333333, 'NA', 1000, '2023-01-09', '2025-01-23', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(10, '637665743692', 'EAN13', 'ANTI-WRINKLE ELIXIR SERUM 24K GOLD + ANTI-WRINKLE Night MOISTURISER 24K GOLD+UNDER EYE CREAM 24K GOLD + COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS', 'KECS021', 'AB007', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 5, 5, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 14, 6.6233333333333, 'NA', 1000, '2023-01-10', '2025-01-24', 'https://drive.google.com/file/d/17g6d0j1sgJ7Mq3JHO2Jj_QyD19JqH-4J/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(11, '637665743708', 'EAN13', 'ANTI-WRINKLE ELIXIR SERUM 24K GOLD + ANTI-WRINKLE Night MOISTURISER 24K GOLD +COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS + PURIFYING BLACK PEEL-OFF MASK 24K GOLD', 'KECS022', 'AB008', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 5, 5, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 15, 2.1183333333333, 'NA', 1000, '2023-01-11', '2025-01-25', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(12, '637665743715', 'EAN13', 'ANTI-WRINKLE ELIXIR SERUM 24K GOLD+ ANTI-WRINKLE Night MOISTURISER 24K GOLD+UNDER EYE CREAM 24K GOLD+COLLAGEN GOLD UNDER EYE PATCH 24K GOLD - 5X2 PADS+PURIFYING BLACK PEEL-OFF MASK 24K GOLD', 'KECS023', 'AB009', 4, 1, 3, NULL, 'https://erthskinlondon.com/collections/eyecare/products/gold-24k-under-eye-cream-15ml', 15, '15ml', 3, 4, 13.5, '12367', 'spain', 'AQUA, CETYL ALCOHOL,UREA, GLYCERYL STEARATE, GLYCERYL STEARATE CITRATE, PROPYLENE GLYCOL, STEARIC ACID, CAPRYLIC/CAPRIC TRIGLYCERIDE, GLYCERIN, ISOPROPYL MYRISTATE, BETAINE, BORAGO OFFICINALIS SEED OIL, SODIUM LACTATE, PHENOXYETHANOL, DIISOPROPYL ADIPATE, PRUNUS AMYGDALUS DULCIS OIL, PARFUM, XANTHAN GUM, PARAFFIN, ALLANTOIN, GLYCERIN PALMITATE/STEARARE, CERA ALBA, BUTYROSPERMUM PARKII BUTTER, ARGANIA SPINOSA KERNEL OIL, PENTYLENE GLYCOL, SACCHAROMYCES CEREVISIAE EXTRACT, RHODIOLA ROSEA ROOT EXTRACT, CAMELLIA SINENSIS LEAF EXTRACT, SODIUM HYALURONATE, SOLUBLE COLLAGEN, HELIANTHUS ANNUSS SEED OIL, TOCOPHERYL ACETATE, RETINYL PALMITATE, ASCORBIC ACID, TOCOPHEROL, LACTOSE, GOLD, POTASSIUM SILICATE, ALUMINIUM SILICATE, ETHYLHEXYLGLYCERIN, DISODIUM EDTA, POTASSIUM SORBATE, TRIETHANOLAMINE\n\n Shipping', 'Squeeze a pea sized amount onto your ring finger and gently dap around the eye area. Continue with  London’s Anti-Wrinkle Elixir Serum 24K Gold and Eclat Skin London Gold 24K Anti-Wrinkle Cream', '15ml tube', '330420000', 16, 4, 'NA', 1000, '2023-01-12', '2025-01-26', 'https://drive.google.com/file/d/1EgtdosUgIJB-2CjAgQv42Qdy-5r7p9S0/view?usp=drive_link', 1, '2024-02-06 20:26:43.000000', '2024-02-06 20:26:43.000000', NULL),
(13, '637665744092', 'EAN13', 'Anti-Wrinkle Elixir Serum 24k Gold 60ml', 'ECS00101', 'AB001', 4, 1, 3, NULL, 'https://res.cloudinary.com/dotitkupe/image/upload/v1630683478/637665744071_box_ggytck.jpg', 60, '60ml', 5, 5, 13.5, '12345', 'Poland', 'Aqua, Panthenol, Propylene Glycol, Glycerin, PEG-12 Dimethicone,  Saccharomyces/Magnesium Ferment, Saccharomyces/Iron Ferment, Saccharomyces/Copper Ferment,Saccharomyces/Silicon Ferment, Saccharomyces/Zinc Ferment, Tocopheryl Acetate, Allantoin, Retinyl Palmitate, Tocopherol, Helianthus Annuus Seed Oil, Olea Europea Leaf Extract, Camellia Sinensis Leaf Extract, Paeonia Officinalis Flower Extract, Daucus Carota Extract, Caviar Extract, Arnica Montana Flower Extract, Squalane, Ubiquinone, Mirystoyl Tripeptide-31, Collagen Amino Acids, Lactose, Gold, Sodium Hyaluronate, PEG-75 Lanolin, Potassium Silicate, Aluminium Silicate, Phenoxyethanol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Parfum, Butylene Glycol, Disodium EDTA, Ethylhexylglycerin, Potassium Sorbate, Synthetic Fluorphlogopite, Triethanolamine, CI 77891, CI 77861, CI 77491.', 'Directions for use: Take one or two pumps of the elixir serum to the tip of your fingers and dap a dot to your both cheeks, forehead, and chin. Massage evenly. Spread any leftovers to your neck and dÃ©colletage. For best results continue with Eclat Skin London Gold 24K Anti-Wrinkle Cream.', '60ml bottle', '330499000', 5, 39, 'NA', 1000, '2023-01-01', '2025-01-15', 'https://drive.google.com/file/d/17g6d0j1sgJ7Mq3JHO2Jj_QyD19JqH-4J/view?usp=drive_link', 1, '2024-02-06 21:09:40.000000', '2024-02-06 21:09:40.000000', NULL),
(14, '637665754092', 'EAN13', 'Anti-Wrinkle Elixir Serum 24k Gold 60ml', 'ECS00201', 'AB001', 4, 1, 3, NULL, 'https://res.cloudinary.com/dotitkupe/image/upload/v1630683478/637665744071_box_ggytck.jpg', 60, '60ml', 5, 5, 13.5, '12345', 'Poland', 'Aqua, Panthenol, Propylene Glycol, Glycerin, PEG-12 Dimethicone,  Saccharomyces/Magnesium Ferment, Saccharomyces/Iron Ferment, Saccharomyces/Copper Ferment,Saccharomyces/Silicon Ferment, Saccharomyces/Zinc Ferment, Tocopheryl Acetate, Allantoin, Retinyl Palmitate, Tocopherol, Helianthus Annuus Seed Oil, Olea Europea Leaf Extract, Camellia Sinensis Leaf Extract, Paeonia Officinalis Flower Extract, Daucus Carota Extract, Caviar Extract, Arnica Montana Flower Extract, Squalane, Ubiquinone, Mirystoyl Tripeptide-31, Collagen Amino Acids, Lactose, Gold, Sodium Hyaluronate, PEG-75 Lanolin, Potassium Silicate, Aluminium Silicate, Phenoxyethanol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Parfum, Butylene Glycol, Disodium EDTA, Ethylhexylglycerin, Potassium Sorbate, Synthetic Fluorphlogopite, Triethanolamine, CI 77891, CI 77861, CI 77491.', 'Directions for use: Take one or two pumps of the elixir serum to the tip of your fingers and dap a dot to your both cheeks, forehead, and chin. Massage evenly. Spread any leftovers to your neck and dÃ©colletage. For best results continue with Eclat Skin London Gold 24K Anti-Wrinkle Cream.', '60ml bottle', '330499000', 5, 39, 'NA', 1000, '2023-01-01', '2025-01-15', 'https://drive.google.com/file/d/17g6d0j1sgJ7Mq3JHO2Jj_QyD19JqH-4J/view?usp=drive_link', 1, '2024-02-06 21:11:22.000000', '2024-02-06 21:11:22.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(192) DEFAULT NULL,
  `cost` double DEFAULT 0,
  `price` double DEFAULT 0,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `qte` double NOT NULL DEFAULT 0,
  `manage_stock` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `warehouse_id`, `product_variant_id`, `qte`, `manage_stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, NULL, 0, 1, NULL, NULL, NULL),
(3, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(4, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(5, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(6, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(7, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(8, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(9, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(10, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(11, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(12, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(13, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(14, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(15, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(16, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(17, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(18, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(19, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(20, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(21, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(22, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(23, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(24, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(25, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(26, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(27, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(28, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(29, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(30, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(31, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(32, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(33, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(34, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(35, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(36, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(37, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(38, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(39, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(40, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(41, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(42, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(43, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(44, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(45, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(46, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(47, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(48, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(49, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(50, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(51, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(52, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(53, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(54, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(55, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(56, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(57, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(58, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(59, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(60, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(61, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(62, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(63, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(64, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(65, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(66, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(67, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(68, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(69, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(70, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(71, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(72, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(73, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(74, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(75, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(76, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(77, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(78, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(79, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(80, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(81, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(82, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(83, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(84, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(85, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(86, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(87, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(88, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(89, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(90, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(91, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(92, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(93, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(94, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(95, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(96, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(97, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(98, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(99, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(100, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(101, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(102, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(103, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(104, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(105, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(106, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(107, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(108, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(109, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(110, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(111, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(112, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(113, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(114, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(115, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(116, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(117, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(118, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(119, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(120, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(121, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(122, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(123, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(124, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(125, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(126, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(127, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(128, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(129, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(130, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(131, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(132, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(133, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(134, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(135, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(136, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(137, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(138, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(139, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(140, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(141, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(142, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(143, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(144, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(145, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(146, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(147, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(148, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(149, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(150, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(151, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(152, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(153, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(154, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(155, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(156, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(157, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(158, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(159, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(160, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(161, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(162, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(163, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(164, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(165, 10, 2, NULL, 0, 0, NULL, NULL, NULL),
(166, 10, 3, NULL, 0, 0, NULL, NULL, NULL),
(167, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(168, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(169, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(170, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(171, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(172, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(173, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(174, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(175, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(176, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(177, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(178, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(179, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(180, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(181, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(182, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(183, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(184, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(185, 10, 2, NULL, 0, 0, NULL, NULL, NULL),
(186, 10, 3, NULL, 0, 0, NULL, NULL, NULL),
(187, 11, 2, NULL, 0, 0, NULL, NULL, NULL),
(188, 11, 3, NULL, 0, 0, NULL, NULL, NULL),
(189, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(190, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(191, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(192, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(193, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(194, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(195, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(196, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(197, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(198, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(199, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(200, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(201, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(202, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(203, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(204, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(205, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(206, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(207, 10, 2, NULL, 0, 0, NULL, NULL, NULL),
(208, 10, 3, NULL, 0, 0, NULL, NULL, NULL),
(209, 11, 2, NULL, 0, 0, NULL, NULL, NULL),
(210, 11, 3, NULL, 0, 0, NULL, NULL, NULL),
(211, 12, 2, NULL, 0, 0, NULL, NULL, NULL),
(212, 12, 3, NULL, 0, 0, NULL, NULL, NULL),
(213, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(214, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(215, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(216, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(217, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(218, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(219, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(220, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(221, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(222, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(223, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(224, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(225, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(226, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(227, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(228, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(229, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(230, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(231, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(232, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(233, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(234, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(235, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(236, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(237, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(238, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(239, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(240, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(241, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(242, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(243, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(244, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(245, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(246, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(247, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(248, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(249, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(250, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(251, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(252, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(253, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(254, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(255, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(256, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(257, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(258, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(259, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(260, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(261, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(262, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(263, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(264, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(265, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(266, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(267, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(268, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(269, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(270, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(271, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(272, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(273, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(274, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(275, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(276, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(277, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(278, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(279, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(280, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(281, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(282, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(283, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(284, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(285, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(286, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(287, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(288, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(289, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(290, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(291, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(292, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(293, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(294, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(295, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(296, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(297, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(298, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(299, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(300, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(301, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(302, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(303, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(304, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(305, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(306, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(307, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(308, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(309, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(310, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(311, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(312, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(313, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(314, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(315, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(316, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(317, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(318, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(319, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(320, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(321, 10, 2, NULL, 0, 0, NULL, NULL, NULL),
(322, 10, 3, NULL, 0, 0, NULL, NULL, NULL),
(323, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(324, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(325, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(326, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(327, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(328, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(329, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(330, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(331, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(332, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(333, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(334, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(335, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(336, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(337, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(338, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(339, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(340, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(341, 10, 2, NULL, 0, 0, NULL, NULL, NULL),
(342, 10, 3, NULL, 0, 0, NULL, NULL, NULL),
(343, 11, 2, NULL, 0, 0, NULL, NULL, NULL),
(344, 11, 3, NULL, 0, 0, NULL, NULL, NULL),
(345, 1, 2, NULL, 0, 0, NULL, NULL, NULL),
(346, 1, 3, NULL, 0, 0, NULL, NULL, NULL),
(347, 2, 2, NULL, 0, 0, NULL, NULL, NULL),
(348, 2, 3, NULL, 0, 0, NULL, NULL, NULL),
(349, 3, 2, NULL, 0, 0, NULL, NULL, NULL),
(350, 3, 3, NULL, 0, 0, NULL, NULL, NULL),
(351, 4, 2, NULL, 0, 0, NULL, NULL, NULL),
(352, 4, 3, NULL, 0, 0, NULL, NULL, NULL),
(353, 5, 2, NULL, 0, 0, NULL, NULL, NULL),
(354, 5, 3, NULL, 0, 0, NULL, NULL, NULL),
(355, 6, 2, NULL, 0, 0, NULL, NULL, NULL),
(356, 6, 3, NULL, 0, 0, NULL, NULL, NULL),
(357, 7, 2, NULL, 0, 0, NULL, NULL, NULL),
(358, 7, 3, NULL, 0, 0, NULL, NULL, NULL),
(359, 8, 2, NULL, 0, 0, NULL, NULL, NULL),
(360, 8, 3, NULL, 0, 0, NULL, NULL, NULL),
(361, 9, 2, NULL, 0, 0, NULL, NULL, NULL),
(362, 9, 3, NULL, 0, 0, NULL, NULL, NULL),
(363, 10, 2, NULL, 0, 0, NULL, NULL, NULL),
(364, 10, 3, NULL, 0, 0, NULL, NULL, NULL),
(365, 11, 2, NULL, 0, 0, NULL, NULL, NULL),
(366, 11, 3, NULL, 0, 0, NULL, NULL, NULL),
(367, 12, 2, NULL, 0, 0, NULL, NULL, NULL),
(368, 12, 3, NULL, 0, 0, NULL, NULL, NULL),
(369, 13, 2, NULL, 0, 0, NULL, NULL, NULL),
(370, 13, 3, NULL, 0, 0, NULL, NULL, NULL),
(371, 14, 2, NULL, 0, 0, NULL, NULL, NULL),
(372, 14, 3, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `email` varchar(192) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `user_id`, `name`, `code`, `email`, `phone`, `country`, `city`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Muhammad Khan', '1', 'awaiskhan9160@gmail.com', '03049350926', 'Pakistan', 'Lahore', 'Lahore', '2024-02-06 20:46:10.000000', '2024-02-06 20:46:10.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `date` datetime NOT NULL,
  `provider_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `discount_percent_total` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `statut` varchar(191) NOT NULL,
  `payment_statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `cost` double NOT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `provider_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `discount_percent_total` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_statut` varchar(192) NOT NULL,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `id` int(11) NOT NULL,
  `cost` decimal(16,3) NOT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `client_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `discount_percent_total` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `quotation_id` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'Super Admin', 'web', NULL, NULL, NULL);

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
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `is_pos` tinyint(1) DEFAULT 0,
  `client_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `discount_percent_total` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_statut` varchar(192) NOT NULL,
  `statut` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `price` double NOT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT NULL,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT NULL,
  `discount_method` varchar(192) DEFAULT '1',
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `discount_percent_total` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_statut` varchar(192) NOT NULL,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_details`
--

CREATE TABLE `sale_return_details` (
  `id` int(11) NOT NULL,
  `sale_return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT 0,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT 0,
  `discount_method` varchar(192) DEFAULT '1',
  `product_variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `app_name` varchar(192) NOT NULL,
  `CompanyName` varchar(191) NOT NULL,
  `CompanyPhone` varchar(191) NOT NULL,
  `CompanyAdress` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `invoice_footer` varchar(192) DEFAULT NULL,
  `footer` varchar(192) NOT NULL,
  `developed_by` varchar(192) DEFAULT NULL,
  `default_language` varchar(192) NOT NULL DEFAULT 'en',
  `default_sms_gateway` varchar(192) DEFAULT NULL,
  `symbol_placement` varchar(192) NOT NULL DEFAULT 'before',
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `currency_id`, `client_id`, `warehouse_id`, `email`, `app_name`, `CompanyName`, `CompanyPhone`, `CompanyAdress`, `logo`, `invoice_footer`, `footer`, `developed_by`, `default_language`, `default_sms_gateway`, `symbol_placement`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, NULL, 2, 'admin@example.com', 'Eclat Inventory', 'Eclat Inventory', '02070787225', 'Pakistan', '1705574055.png', NULL, 'Eclat Inventory Management System', 'Eclat Inventory', 'en', 'twilio', 'before', NULL, '2024-01-31 07:43:57.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_messages`
--

CREATE TABLE `sms_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(192) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_messages`
--

INSERT INTO `sms_messages` (`id`, `name`, `text`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sale', 'Dear {contact_name},\nThank you for your purchase! Your invoice number is {invoice_number}.\nIf you have any questions or concerns, please don\'t hesitate to reach out to us. We are here to help!\nBest regards,\n{business_name}', NULL, NULL, NULL),
(2, 'purchase', 'Dear {contact_name},\nI recently made a purchase from your company and I wanted to thank you for your cooperation and service. My invoice number is {invoice_number} .\nIf you have any questions or concerns regarding my purchase, please don\'t hesitate to contact me. I am here to make sure I have a positive experience with your company.\nBest regards,\n{business_name}', NULL, NULL, NULL),
(3, 'quotation', 'Dear {contact_name},\nThank you for your interest in our products. Your quotation number is {quotation_number}.\nPlease let us know if you have any questions or concerns regarding your quotation. We are here to assist you.\nBest regards,\n{business_name}', NULL, NULL, NULL),
(4, 'payment_received', 'Dear {contact_name},\nThank you for making your payment. We have received it and it has been processed successfully.\nIf you have any further questions or concerns, please don\'t hesitate to reach out to us. We are always here to help.\nBest regards,\n{business_name}', NULL, NULL, NULL),
(5, 'payment_sent', 'Dear {contact_name},\nWe have just sent the payment . We appreciate your prompt attention to this matter and the high level of service you provide.\nIf you need any further information or clarification, please do not hesitate to reach out to us. We are here to help.\nBest regards,\n{business_name}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Ref` varchar(192) NOT NULL,
  `date` datetime NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `items` double NOT NULL,
  `tax_rate` double DEFAULT 0,
  `TaxNet` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `discount_percent_total` double DEFAULT 0,
  `shipping` double DEFAULT 0,
  `GrandTotal` double NOT NULL DEFAULT 0,
  `statut` varchar(192) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_details`
--

CREATE TABLE `transfer_details` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `cost` double NOT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `TaxNet` double DEFAULT NULL,
  `tax_method` varchar(192) DEFAULT '1',
  `discount` double DEFAULT NULL,
  `discount_method` varchar(192) DEFAULT '1',
  `quantity` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `ShortName` varchar(192) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` char(192) DEFAULT '*',
  `operator_value` double DEFAULT 1,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `avatar` varchar(192) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `role_users_id` bigint(20) UNSIGNED NOT NULL,
  `is_all_warehouses` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(192) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `avatar`, `status`, `role_users_id`, `is_all_warehouses`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'James Brown', 'admin@example.com', NULL, 'no_avatar.png', 1, 1, 1, '$2y$10$IFj6SwqC0Sxrsiv4YkCt.OJv1UV4mZrWuyLoRG7qt47mseP9mJ58u', NULL, NULL, '2024-01-12 15:06:30.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_warehouse`
--

CREATE TABLE `user_warehouse` (
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `name` varchar(192) NOT NULL,
  `city` varchar(192) DEFAULT NULL,
  `mobile` varchar(192) DEFAULT NULL,
  `zip` varchar(192) DEFAULT NULL,
  `email` varchar(192) DEFAULT NULL,
  `country` varchar(192) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `city`, `mobile`, `zip`, `email`, `country`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Warehouse', 'Lahore', '03049350926', '1122', 'awaiskhan9160@gmail.com', 'Pakistan', '2024-01-15 17:36:13.000000', '2024-01-19 05:45:47.000000', '2024-01-19 05:45:47'),
(2, 'Eclat Cosmetic Ltd', 'London', '', '', '', 'UNITED KINGDOM', '2024-01-19 05:50:31.000000', '2024-01-19 05:50:31.000000', NULL),
(3, 'Poland', 'poland', '', '', '', 'Poland', '2024-01-23 01:08:30.000000', '2024-01-23 01:08:30.000000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_adjustment` (`user_id`),
  ADD KEY `warehouse_id_adjustment` (`warehouse_id`);

--
-- Indexes for table `adjustment_details`
--
ALTER TABLE `adjustment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjust_product_id` (`product_id`),
  ADD KEY `adjust_adjustment_id` (`adjustment_id`),
  ADD KEY `adjust_product_variant` (`product_variant_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id` (`user_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposit_account_id` (`account_id`),
  ADD KEY `deposit_category_id` (`deposit_category_id`),
  ADD KEY `deposit_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `deposit_categories`
--
ALTER TABLE `deposit_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_messages`
--
ALTER TABLE `email_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_account_id` (`account_id`),
  ADD KEY `expenses_category_id` (`expense_category_id`),
  ADD KEY `expenses_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_payment_purchases` (`user_id`),
  ADD KEY `payment_purchases_account_id` (`account_id`),
  ADD KEY `payments_purchase_id` (`purchase_id`),
  ADD KEY `payment_method_id_payment_purchases` (`payment_method_id`);

--
-- Indexes for table `payment_purchase_returns`
--
ALTER TABLE `payment_purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_payment_return_purchase` (`user_id`),
  ADD KEY `payment_purchase_returns_account_id` (`account_id`),
  ADD KEY `supplier_id_payment_return_purchase` (`purchase_return_id`),
  ADD KEY `payment_method_id_payment_purchase_returns` (`payment_method_id`);

--
-- Indexes for table `payment_sales`
--
ALTER TABLE `payment_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_payments_sale` (`user_id`),
  ADD KEY `account_id_payment_sales` (`account_id`),
  ADD KEY `payment_sale_id` (`sale_id`),
  ADD KEY `payment_method_id_payment_sales` (`payment_method_id`);

--
-- Indexes for table `payment_sale_returns`
--
ALTER TABLE `payment_sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factures_sale_return_user_id` (`user_id`),
  ADD KEY `payment_sale_returns_account_id` (`account_id`),
  ADD KEY `factures_sale_return` (`sale_return_id`),
  ADD KEY `payment_method_id_payment_sale_returns` (`payment_method_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pos_settings`
--
ALTER TABLE `pos_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id_products` (`brand_id`),
  ADD KEY `unit_id_products` (`unit_id`),
  ADD KEY `category_id_products` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_variant` (`product_id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_warehouse_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_user_id` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_purchases` (`user_id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `warehouse_id_purchase` (`warehouse_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_unit_id_purchase` (`purchase_unit_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `purchase_product_variant_id` (`product_variant_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_returns` (`user_id`),
  ADD KEY `purchase_id_purchase_returns` (`purchase_id`),
  ADD KEY `provider_id_return` (`provider_id`),
  ADD KEY `purchase_return_warehouse_id` (`warehouse_id`);

--
-- Indexes for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id_purchase_return_details` (`purchase_unit_id`),
  ADD KEY `purchase_return_id_return` (`purchase_return_id`),
  ADD KEY `product_id_details_purchase_return` (`product_id`),
  ADD KEY `purchase_return_product_variant_id` (`product_variant_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_quotation` (`user_id`),
  ADD KEY `client_id_quotation` (`client_id`),
  ADD KEY `warehouse_id_quotation` (`warehouse_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_unit_id_quotation` (`sale_unit_id`),
  ADD KEY `product_id_quotation_details` (`product_id`),
  ADD KEY `quote_product_variant_id` (`product_variant_id`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_sales` (`user_id`),
  ADD KEY `sale_client_id` (`client_id`),
  ADD KEY `warehouse_id_sale` (`warehouse_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Details_Sale_id` (`sale_id`),
  ADD KEY `sale_product_id` (`product_id`),
  ADD KEY `sale_product_variant_id` (`product_variant_id`),
  ADD KEY `sales_sale_unit_id` (`sale_unit_id`);

--
-- Indexes for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_returns` (`user_id`),
  ADD KEY `sale_id_return_sales` (`sale_id`),
  ADD KEY `client_id_returns` (`client_id`),
  ADD KEY `warehouse_id_sale_return_id` (`warehouse_id`);

--
-- Indexes for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`sale_return_id`),
  ADD KEY `product_id_details_returns` (`product_id`),
  ADD KEY `sale_unit_id_return_details` (`sale_unit_id`),
  ADD KEY `sale_return_id_product_variant_id` (`product_variant_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_currency_id` (`currency_id`),
  ADD KEY `settings_client_id` (`client_id`),
  ADD KEY `settings_warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sms_messages`
--
ALTER TABLE `sms_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_transfers` (`user_id`),
  ADD KEY `from_warehouse_id` (`from_warehouse_id`),
  ADD KEY `to_warehouse_id` (`to_warehouse_id`);

--
-- Indexes for table `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id_transfers` (`product_id`),
  ADD KEY `product_variant_id_transfer` (`product_variant_id`),
  ADD KEY `unit_sale_id_transfer` (`purchase_unit_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_users_id` (`role_users_id`);

--
-- Indexes for table `user_warehouse`
--
ALTER TABLE `user_warehouse`
  ADD KEY `user_warehouse_user_id` (`user_id`),
  ADD KEY `user_warehouse_warehouse_id` (`warehouse_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustment_details`
--
ALTER TABLE `adjustment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_categories`
--
ALTER TABLE `deposit_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_messages`
--
ALTER TABLE `email_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_purchase_returns`
--
ALTER TABLE `payment_purchase_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_sales`
--
ALTER TABLE `payment_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_sale_returns`
--
ALTER TABLE `payment_sale_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_settings`
--
ALTER TABLE `pos_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_messages`
--
ALTER TABLE `sms_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_details`
--
ALTER TABLE `transfer_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD CONSTRAINT `user_id_adjustment` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_adjustment` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `adjustment_details`
--
ALTER TABLE `adjustment_details`
  ADD CONSTRAINT `adjust_adjustment_id` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`),
  ADD CONSTRAINT `adjust_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `adjust_product_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposit_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `deposit_category_id` FOREIGN KEY (`deposit_category_id`) REFERENCES `deposit_categories` (`id`),
  ADD CONSTRAINT `deposit_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `expenses_category_id` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `expenses_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

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
-- Constraints for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  ADD CONSTRAINT `payment_method_id_payment_purchases` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `payment_purchases_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `payment_purchases_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `payment_purchases_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_purchase_returns`
--
ALTER TABLE `payment_purchase_returns`
  ADD CONSTRAINT `payment_method_id_payment_purchase_returns` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `payment_purchase_returns_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `supplier_id_payment_return_purchase` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`),
  ADD CONSTRAINT `user_id_payment_return_purchase` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_sales`
--
ALTER TABLE `payment_sales`
  ADD CONSTRAINT `account_id_payment_sales` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `payment_method_id_payment_sales` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `payment_sales_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `user_id_payment_sales` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_sale_returns`
--
ALTER TABLE `payment_sale_returns`
  ADD CONSTRAINT `payment_method_id_payment_sale_returns` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `payment_sale_returns_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `payment_sale_returns_sale_return_id` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`),
  ADD CONSTRAINT `payment_sale_returns_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_id_products` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `category_id_products` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `unit_id_products` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_id_variant` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD CONSTRAINT `art_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `mag_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `provider_id` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `user_id_purchases` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_purchase` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `purchase_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `purchase_unit_id_purchase` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `provider_id_return` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `purchase_id_purchase_returns` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `purchase_return_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_return_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD CONSTRAINT `product_id_details_purchase_return` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_return_id_return` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`),
  ADD CONSTRAINT `purchase_return_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `unit_id_purchase_return_details` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `client_id _quotation` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `user_id_quotation` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_quotation` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `product_id_quotation_details` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `quotation_id` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `quote_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `sale_unit_id_quotation` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sale_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `user_id_sales` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_sale` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `Details_Sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `sale_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `sales_sale_unit_id` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD CONSTRAINT `client_id_returns` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `sale_id_return_sales` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `user_id_returns` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `warehouse_id_sale_return_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD CONSTRAINT `product_id_details_returns` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_return_id` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`),
  ADD CONSTRAINT `sale_return_id_product_variant_id` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `sale_unit_id_return_details` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `settings_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `settings_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `from_warehouse_id` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `to_warehouse_id` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `user_id_transfers` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD CONSTRAINT `product_id_transfers` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_variant_id_transfer` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `transfer_id` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`),
  ADD CONSTRAINT `unit_sale_id_transfer` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `base_unit` FOREIGN KEY (`base_unit`) REFERENCES `units` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_users_id` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_warehouse`
--
ALTER TABLE `user_warehouse`
  ADD CONSTRAINT `user_warehouse_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_warehouse_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
