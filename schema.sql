/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.22-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: humake_production
-- ------------------------------------------------------
-- Server version	10.6.22-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_controller_ist`
--

DROP TABLE IF EXISTS `access_controller_ist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_controller_ist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_controller_id` int(10) unsigned NOT NULL,
  `send_ip` int(10) unsigned NOT NULL,
  `dest_ip` int(10) unsigned NOT NULL,
  `device_id` varchar(45) NOT NULL DEFAULT '001',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aci_ac_id` (`access_controller_id`),
  CONSTRAINT `fk_aci_ac_id` FOREIGN KEY (`access_controller_id`) REFERENCES `access_controllers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_controllers`
--

DROP TABLE IF EXISTS `access_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_controllers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `connection` varchar(60) DEFAULT NULL,
  `model` varchar(45) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ac_branch_id` (`branch_id`),
  CONSTRAINT `fk_ac_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_categories`
--

DROP TABLE IF EXISTS `account_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_commissions`
--

DROP TABLE IF EXISTS `account_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_commissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `enroll_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `employee_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ac_account_id` (`account_id`),
  KEY `fk_ac_enroll_id` (`enroll_id`),
  KEY `fk_ac_course_id` (`course_id`),
  KEY `fk_ac_employee_id` (`employee_id`),
  CONSTRAINT `fk_ac_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ac_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ac_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ac_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enrolls` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=886625 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_edit_log_fields`
--

DROP TABLE IF EXISTS `account_edit_log_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_edit_log_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_edit_log_id` int(10) unsigned NOT NULL,
  `field` varchar(60) NOT NULL,
  `origin` varchar(60) DEFAULT NULL,
  `change` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_edit_log_fields_ael_id` (`account_edit_log_id`),
  CONSTRAINT `fk_account_edit_log_ael_id` FOREIGN KEY (`account_edit_log_id`) REFERENCES `account_edit_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_edit_logs`
--

DROP TABLE IF EXISTS `account_edit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_edit_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_edit_logs_admin_id` (`admin_id`),
  KEY `fk_account_edit_logs_account_id` (`account_id`),
  CONSTRAINT `fk_account_edit_logs_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_account_edit_logs_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=950 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_order_transfers`
--

DROP TABLE IF EXISTS `account_order_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_order_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `order_transfer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_order_transfer_account_id` (`account_id`),
  KEY `account_order_transfer_order_transfer_id` (`order_transfer_id`),
  CONSTRAINT `account_order_transfer_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_order_transfer_order_transfer_id` FOREIGN KEY (`order_transfer_id`) REFERENCES `order_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_orders`
--

DROP TABLE IF EXISTS `account_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_account_order` (`account_id`,`order_id`),
  KEY `fk_ao_order_id` (`order_id`),
  KEY `fk_ao_accont_id` (`account_id`),
  CONSTRAINT `fk_ao_accont_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ao_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1104328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_products`
--

DROP TABLE IF EXISTS `account_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ap` (`account_id`,`product_id`),
  KEY `fk_ap_product_id` (`product_id`),
  KEY `fk_ap_account_id` (`account_id`),
  CONSTRAINT `fk_ap_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ap_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=821341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_category_id` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '회원',
  `type` enum('I','O') NOT NULL DEFAULT 'I' COMMENT '수입/지출 표시, I:수입(Income), O:지출(Outgo)',
  `transaction_date` date NOT NULL,
  `cash` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '현금, 지출인 경우 -',
  `credit` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '신용, 지출인 경우 -',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '최종변경일시 - regtime과 다르다면 임의로 수정했다는 뜻임.',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_branch_id` (`branch_id`),
  KEY `fk_account_user_id` (`user_id`),
  KEY `fk_account_cateogry_id` (`account_category_id`),
  KEY `idx_account_transaction_date` (`transaction_date`),
  CONSTRAINT `fk_account_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_account_cateogry_id` FOREIGN KEY (`account_category_id`) REFERENCES `account_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1727197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회계장부';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_access_cards`
--

DROP TABLE IF EXISTS `admin_access_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_access_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `card_no` varchar(100) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_aac_admin_id` (`admin_id`),
  CONSTRAINT `fk_aac_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_attendances`
--

DROP TABLE IF EXISTS `admin_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL COMMENT '관리자(종업원) 연결키',
  `in_time` datetime NOT NULL COMMENT '출근시간 - 휴무인 경우 NULL',
  `created_at` datetime NOT NULL COMMENT '등록일시 - 별일 없다면 출근시간과 비슷',
  PRIMARY KEY (`id`),
  KEY `fk_aa_admin_id` (`admin_id`),
  CONSTRAINT `fk_aa_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='종업원 출퇴근 관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_contents`
--

DROP TABLE IF EXISTS `admin_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_contents` (
  `id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ac_admin_id` (`admin_id`),
  CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_enable_send_messages`
--

DROP TABLE IF EXISTS `admin_enable_send_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_enable_send_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aesm_admin_id` (`admin_id`),
  CONSTRAINT `fk_aesm_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_login_logs`
--

DROP TABLE IF EXISTS `admin_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_login_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `admin_id` int(10) unsigned NOT NULL COMMENT '관리자 연결키',
  `ip` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_all_admin_id` (`admin_id`),
  CONSTRAINT `fk_all_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관리자 방문기록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_move_available_branches`
--

DROP TABLE IF EXISTS `admin_move_available_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_move_available_branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amab_admin_id` (`admin_id`),
  KEY `amab_branch_Id` (`branch_id`),
  CONSTRAINT `amab_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `amab_branch_Id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `deny` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ap` (`admin_id`,`permission_id`,`deny`),
  KEY `fk_ap_admin_id` (`admin_id`),
  KEY `fk_ap_permission_id` (`permission_id`),
  CONSTRAINT `fk_ap_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ap_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_pictures`
--

DROP TABLE IF EXISTS `admin_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(45) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_admin_picture_admin_id` (`admin_id`),
  CONSTRAINT `fk_admin_picture_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `branch_id` int(10) unsigned NOT NULL COMMENT '지점번호 연결 외부키, 연결센터를 찾으려면 tbl_center_branch.center_idx를 참조할 것.',
  `role_id` int(10) unsigned NOT NULL DEFAULT 5,
  `uid` varchar(20) NOT NULL COMMENT '관리자 아이디',
  `encrypted_password` varchar(60) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '관리자 이름',
  `email` varchar(60) DEFAULT NULL COMMENT '이메일',
  `birthday` date DEFAULT NULL,
  `is_trainer` tinyint(1) NOT NULL DEFAULT 0,
  `is_fc` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(13) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT 1,
  `zipcode` varchar(6) DEFAULT NULL COMMENT '우편번호, 맨앞이 0이 될 수 있다.',
  `address` varchar(128) DEFAULT NULL,
  `status` enum('H','R','L') NOT NULL DEFAULT 'H' COMMENT '재직상태, H:재직(holding), R:퇴사(resign), L:휴직(leave)',
  `commission_rate` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'PT 수수료비율',
  `sms_send` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `hiring_date` date NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_admin` (`branch_id`,`uid`),
  UNIQUE KEY `uk_admin_email` (`email`),
  KEY `fk_admin_branch_id` (`branch_id`),
  KEY `fk_admin_role_id` (`role_id`),
  CONSTRAINT `fk_admin_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_admin_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1714 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관리자 등록/관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch_pictures`
--

DROP TABLE IF EXISTS `branch_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(100) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bp_branch_id` (`branch_id`),
  CONSTRAINT `fk_bp_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `center_id` int(10) unsigned NOT NULL COMMENT '상위 센터 idx 외부연결키',
  `title` varchar(60) NOT NULL COMMENT '지점이름',
  `description` varchar(150) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `sms_available_point` decimal(10,1) unsigned NOT NULL DEFAULT 0.0,
  `use_admin_ac` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `use_ac_controller` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `use_access_card` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `use_return_calculator` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `not_return_rate` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `app_title_color` varchar(10) NOT NULL DEFAULT '#333333',
  `app_notice_color` varchar(10) NOT NULL DEFAULT '#666666',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '최초등록일시',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_branch_center_id` (`center_id`),
  CONSTRAINT `fk_branch_center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='센터별 지점, center->branch';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `center_pictures`
--

DROP TABLE IF EXISTS `center_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `center_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `center_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(100) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cp_center_id` (`center_id`),
  CONSTRAINT `fk_cp_center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `centers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `title` varchar(60) NOT NULL COMMENT '센터이름',
  `branch_counts` int(10) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '등록일시',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='센터, 최상위';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_admins`
--

DROP TABLE IF EXISTS `counsel_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counsel_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ca_counsel_id` (`counsel_id`),
  KEY `fk_ca_admin_id` (`admin_id`),
  CONSTRAINT `fk_ca_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ca_counsel_id` FOREIGN KEY (`counsel_id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_contents`
--

DROP TABLE IF EXISTS `counsel_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_contents` (
  `id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_cc_counsel_id` (`id`),
  CONSTRAINT `fk_cc_counsel_id` FOREIGN KEY (`id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_edit_log_fields`
--

DROP TABLE IF EXISTS `counsel_edit_log_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_edit_log_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counsel_edit_log_id` int(10) unsigned NOT NULL,
  `field` varchar(60) NOT NULL,
  `origin` varchar(60) DEFAULT NULL,
  `change` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `counsel_edit_log_id_idx` (`counsel_edit_log_id`),
  CONSTRAINT `counsel_edit_log_id` FOREIGN KEY (`counsel_edit_log_id`) REFERENCES `counsel_edit_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_edit_logs`
--

DROP TABLE IF EXISTS `counsel_edit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_edit_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counsel_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `counsel_edit_log_counsel_id_idx` (`counsel_id`),
  KEY `counsel_edit_log_admin_id_idx` (`admin_id`),
  CONSTRAINT `counsel_edit_log_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `counsel_edit_log_counsel_id` FOREIGN KEY (`counsel_id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_managers`
--

DROP TABLE IF EXISTS `counsel_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counsel_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `counsel_id_UNIQUE` (`counsel_id`),
  KEY `fk_counsel_managers_counsel_id` (`counsel_id`),
  KEY `fk_counsel_managers_admin_id` (`admin_id`),
  CONSTRAINT `fk_counsel_managers_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_counsel_managers_counsel_id` FOREIGN KEY (`counsel_id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_responses`
--

DROP TABLE IF EXISTS `counsel_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_responses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counsel_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `counsel_response_counsel_id_idx` (`counsel_id`),
  CONSTRAINT `counsel_response_counsel_id` FOREIGN KEY (`counsel_id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsel_users`
--

DROP TABLE IF EXISTS `counsel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsel_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counsel_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `display` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_cu_counsel_id` (`counsel_id`),
  KEY `fk_cu_user_id` (`user_id`),
  CONSTRAINT `fk_cu_counsel_id` FOREIGN KEY (`counsel_id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cu_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counsels`
--

DROP TABLE IF EXISTS `counsels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counsels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `execute_date` date NOT NULL,
  `type` enum('A','E','D') NOT NULL DEFAULT 'A' COMMENT '상담구분: A: 전화, E: 인터뷰, D: 앱',
  `question_course` enum('default','pt','golf') DEFAULT 'default',
  `complete` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '상담상태, S: 처리중, E: 처리완료',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '등록일시',
  `updated_at` datetime NOT NULL COMMENT '최종 수정일시',
  PRIMARY KEY (`id`),
  KEY `fk_counsels_branch_id_idx` (`branch_id`),
  CONSTRAINT `fk_counsels_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57528 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='상담 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `trainer_id` int(10) unsigned DEFAULT NULL COMMENT '강사 연결키',
  `quota` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '정원',
  `lesson_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '수강체크타입, 1:기간제, 2:회수제, 3:쿠폰제, 4:PT, 5:단체운동',
  `lesson_quantity` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'lesson_unit에 대응하는 수량 1M = 1달, 2W = 2주, 3D = 3일,...',
  `lesson_period` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '수강기간 - 시작일로 부터',
  `lesson_period_unit` enum('M','W','D') NOT NULL DEFAULT 'M' COMMENT '수강기간 단위, M:월, W:주, D:일',
  `progress_time` smallint(5) unsigned NOT NULL DEFAULT 0,
  `min_time` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '쿠폰사용 최소 시간',
  `min_person` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `lesson_dayofweek` varchar(7) DEFAULT NULL COMMENT '강습요일, 1:월, 2:화, 3:수, 4:목, 5:금, 6:토, 0:일',
  `user_reservation` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '강습상태, 강습중/종료',
  `order_no` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_course_trainer_id` (`trainer_id`),
  KEY `fk_courses_product_id` (`product_id`),
  CONSTRAINT `fk_course_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_courses_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='강습, 지점별';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enroll_commissions`
--

DROP TABLE IF EXISTS `enroll_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_commissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enroll_id` int(10) unsigned NOT NULL,
  `commission` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ec_enroll_id` (`enroll_id`),
  CONSTRAINT `fk_ec_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enrolls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6612 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enroll_pts`
--

DROP TABLE IF EXISTS `enroll_pts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_pts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enroll_id` int(10) unsigned NOT NULL,
  `serial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ep_enroll_id` (`enroll_id`),
  UNIQUE KEY `serial_UNIQUE` (`serial`),
  CONSTRAINT `fk_ep_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enrolls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29831 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enroll_trainers`
--

DROP TABLE IF EXISTS `enroll_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_trainers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enroll_id` int(10) unsigned NOT NULL,
  `trainer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enroll_trainer` (`enroll_id`,`trainer_id`),
  KEY `fk_enroll_trainer_enroll_id` (`enroll_id`),
  KEY `fk_enroll_trainer_trainer_id` (`trainer_id`),
  CONSTRAINT `fk_enroll_trainer_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enrolls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_enroll_trainer_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68957 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enroll_use_logs`
--

DROP TABLE IF EXISTS `enroll_use_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll_use_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enroll_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `reservation_user_id` int(10) unsigned DEFAULT NULL,
  `type` enum('confirm','sign','no_show','admin') NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eul_enroll_id` (`enroll_id`),
  KEY `fk_eul_account_id` (`account_id`),
  KEY `fk_eul_reservation_user_id` (`reservation_user_id`),
  CONSTRAINT `fk_eul_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_eul_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enrolls` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_eul_reservation_user_id` FOREIGN KEY (`reservation_user_id`) REFERENCES `reservation_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1634906 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enrolls`
--

DROP TABLE IF EXISTS `enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `order_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL COMMENT '강습 연결키',
  `type` enum('month','week','day','time') NOT NULL DEFAULT 'month',
  `quantity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '수량, 수강단위(기간,횟수, 쿠폰)의 갯수',
  `use_quantity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '쿠폰등 사용량, enroll_use_log의 이번달 카운터',
  `insert_quantity` smallint(5) unsigned NOT NULL DEFAULT 1,
  `start_date` date NOT NULL COMMENT '시작일',
  `end_date` date NOT NULL COMMENT '종료일',
  `have_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enroll_course_id` (`course_id`),
  KEY `fk_enroll_order_id` (`order_id`),
  CONSTRAINT `fk_enroll_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_enroll_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=504028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AVG_ROW_LENGTH=16384 COMMENT='수강등록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrance_not_users`
--

DROP TABLE IF EXISTS `entrance_not_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrance_not_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `entrance_not_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrances`
--

DROP TABLE IF EXISTS `entrances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `user_id` int(10) unsigned NOT NULL COMMENT '회원연결키',
  `in_time` datetime NOT NULL COMMENT '퇴장시간, 현재로서는 필요없지만 나중에 혹시 필요할 수 있어서.',
  `created_at` datetime NOT NULL COMMENT '최초 등록시간',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ue_ui` (`user_id`,`in_time`),
  KEY `fk_ue_user_id` (`user_id`),
  CONSTRAINT `fk_ue_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6268518 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원입장기록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_report_contents`
--

DROP TABLE IF EXISTS `error_report_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_report_contents` (
  `id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_erc_id` FOREIGN KEY (`id`) REFERENCES `error_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_report_files`
--

DROP TABLE IF EXISTS `error_report_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_report_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `error_report_id` int(10) unsigned NOT NULL,
  `file_url` varchar(150) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_error_report_file_id` (`error_report_id`),
  CONSTRAINT `fk_error_report_file_id` FOREIGN KEY (`error_report_id`) REFERENCES `error_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_reports`
--

DROP TABLE IF EXISTS `error_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(60) NOT NULL,
  `solve` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `solve_date` date DEFAULT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_error_reports_admin_id` (`admin_id`),
  KEY `fk_error_reports_branch_id` (`branch_id`),
  CONSTRAINT `fk_error_reports_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_error_reports_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exercise_categories`
--

DROP TABLE IF EXISTS `exercise_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL COMMENT '제목',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '사용여부',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ec_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='운동 운동분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exercise_category_pictures`
--

DROP TABLE IF EXISTS `exercise_category_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_category_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_category_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(200) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ecp_exercise_category_id` (`exercise_category_id`),
  CONSTRAINT `fk_ecp_exercise_category_id` FOREIGN KEY (`exercise_category_id`) REFERENCES `exercise_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exercise_pictures`
--

DROP TABLE IF EXISTS `exercise_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(200) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ep_exercise_id` (`exercise_id`),
  CONSTRAINT `fk_ep_exercise_id` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_category_id` int(10) unsigned NOT NULL,
  `title` varchar(60) NOT NULL COMMENT '제목',
  `content` text DEFAULT NULL COMMENT '내용',
  `tip` varchar(200) DEFAULT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '사용여부',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ec_group_id` (`exercise_category_id`),
  CONSTRAINT `fk_ec_group` FOREIGN KEY (`exercise_category_id`) REFERENCES `exercise_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='운동(운동관리-tbl-training에 쓰임)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `order_no` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '정렬순',
  `quantity` int(10) unsigned NOT NULL COMMENT '수량',
  `start_no` int(10) unsigned NOT NULL COMMENT '시작번호',
  `use_not_set` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_f_product_id` (`product_id`),
  CONSTRAINT `fk_f_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='락커관리 메인, 성별, 락커수, 시작번호, 갯수, 월당 대여료를 관리한다. 대여료의 경우 기존의 데이타는 변경되지 않고 신규임대의 경우에만 적용된다.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facility_breakdowns`
--

DROP TABLE IF EXISTS `facility_breakdowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility_breakdowns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int(10) unsigned NOT NULL,
  `no` int(10) unsigned NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lb_locker_id` (`facility_id`),
  CONSTRAINT `fk_lb_locker_id` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `title` varchar(60) NOT NULL,
  `share` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_branch_id` (`branch_id`),
  CONSTRAINT `fk_job_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_contents`
--

DROP TABLE IF EXISTS `message_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_contents` (
  `id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_message_content_id` FOREIGN KEY (`id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_pictures`
--

DROP TABLE IF EXISTS `message_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(150) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_unique` (`message_id`),
  CONSTRAINT `fk_mp_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43846 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_prepare_admins`
--

DROP TABLE IF EXISTS `message_prepare_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_prepare_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_prepare_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mpa` (`message_prepare_id`,`admin_id`),
  KEY `fk_mpa_mp_id` (`message_prepare_id`),
  KEY `fk_mpa_admin_id` (`admin_id`),
  CONSTRAINT `fk_mpa_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mpa_mp_id` FOREIGN KEY (`message_prepare_id`) REFERENCES `message_prepares` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_prepare_contents`
--

DROP TABLE IF EXISTS `message_prepare_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_prepare_contents` (
  `id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_mp_content_id` FOREIGN KEY (`id`) REFERENCES `message_prepares` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_prepares`
--

DROP TABLE IF EXISTS `message_prepares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_prepares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `use_count` int(10) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mp_branch_id` (`branch_id`),
  CONSTRAINT `fk_mp_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='sms 준비된 문장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_schedules`
--

DROP TABLE IF EXISTS `message_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `schedule` datetime NOT NULL COMMENT '예약시간',
  PRIMARY KEY (`id`),
  KEY `fk_ms_message_id` (`message_id`),
  CONSTRAINT `fk_ms_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='예약 메세지';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_senders`
--

DROP TABLE IF EXISTS `message_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_senders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_message_sender` (`message_id`,`admin_id`),
  KEY `fk_message_senders_message_id` (`message_id`),
  KEY `fk_message_senders_admin_id` (`admin_id`),
  CONSTRAINT `fk_message_senders_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_senders_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=687315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_sms_results`
--

DROP TABLE IF EXISTS `message_sms_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_sms_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `result_code` int(10) unsigned NOT NULL,
  `message` varchar(150) DEFAULT NULL,
  `msg_id` int(10) unsigned DEFAULT NULL,
  `success_cnt` int(10) unsigned NOT NULL DEFAULT 0,
  `error_cnt` int(10) unsigned NOT NULL DEFAULT 0,
  `msg_type` enum('SMS','LMS','MMS') DEFAULT 'SMS',
  PRIMARY KEY (`id`),
  KEY `fk_msr_message_id` (`message_id`),
  CONSTRAINT `fk_msr_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=282523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_temp_users`
--

DROP TABLE IF EXISTS `message_temp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_temp_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `temp_user_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_mtu` (`message_id`,`temp_user_id`),
  KEY `fk_mtu_message_id` (`message_id`),
  KEY `fk_mtu_temp_user_id` (`temp_user_id`),
  CONSTRAINT `fk_mtu_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mtu_temp_user_id` FOREIGN KEY (`temp_user_id`) REFERENCES `temp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2284434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_users`
--

DROP TABLE IF EXISTS `message_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('sms','lms','mms','push') NOT NULL DEFAULT 'sms',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `display` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `readtime` datetime DEFAULT NULL COMMENT '데이타 읽은 시간 - 한번 읽은 메시지를 반복적으로 보여주지 않도록 키로 사용한다. - 오라클등 NULL을 인덱스로 사용할 수 없는 DB에서는 다른 방법을 강구할 것.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mm` (`message_id`,`user_id`),
  KEY `fk_mm_message_id` (`message_id`),
  KEY `fk_mm_member_id` (`user_id`),
  KEY `idx_mm_readtim` (`readtime`),
  CONSTRAINT `fk_mm_member_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mm_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9203247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메세지전송 - 회원 관계';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `type` enum('sms','wapos','push') NOT NULL DEFAULT 'sms',
  `title` varchar(60) NOT NULL COMMENT '제목',
  `send_all` tinyint(3) unsigned NOT NULL COMMENT '전체 전송여부',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '전송일시',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_branch_id` (`branch_id`),
  CONSTRAINT `fk_message_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=686762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='보낸 메세지';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice_contents`
--

DROP TABLE IF EXISTS `notice_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_contents` (
  `id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_nc_id` FOREIGN KEY (`id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(60) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_n_admin_id` (`admin_id`),
  KEY `fk_n_branch_id` (`branch_id`),
  CONSTRAINT `fk_n_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_n_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_access_controll_schedules`
--

DROP TABLE IF EXISTS `order_access_controll_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_access_controll_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `schedule_date` date NOT NULL,
  `execute` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  CONSTRAINT `fk_oacs_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53858 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_blocks`
--

DROP TABLE IF EXISTS `order_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_count` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `reference_date` date NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `period` int(11) NOT NULL DEFAULT 1,
  `enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_contents`
--

DROP TABLE IF EXISTS `order_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_oc_order_id` (`order_id`),
  CONSTRAINT `fk_oc_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_discounts`
--

DROP TABLE IF EXISTS `order_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `total_dc_price` int(10) unsigned NOT NULL DEFAULT 0,
  `dc_rate` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dc_price` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_od_order_id` (`order_id`),
  CONSTRAINT `fk_od_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9685 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_edit_log_fields`
--

DROP TABLE IF EXISTS `order_edit_log_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_edit_log_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_edit_log_id` int(10) unsigned NOT NULL,
  `field` varchar(60) NOT NULL,
  `origin` varchar(60) DEFAULT NULL,
  `change` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oelf_oel_id` (`order_edit_log_id`),
  KEY `field_index` (`field`),
  CONSTRAINT `fk_oelf_oel_id` FOREIGN KEY (`order_edit_log_id`) REFERENCES `order_edit_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134664 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_edit_logs`
--

DROP TABLE IF EXISTS `order_edit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_edit_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL DEFAULT 1,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oel_order_id` (`order_id`),
  CONSTRAINT `fk_oel_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47480 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_ends`
--

DROP TABLE IF EXISTS `order_ends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_ends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `origin_end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ond` (`order_id`),
  CONSTRAINT `fk_ond_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50704 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `total_price` int(10) unsigned NOT NULL DEFAULT 0,
  `quantity` mediumint(8) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_op_order_id` (`order_id`),
  KEY `fk_op_product_id` (`product_id`),
  CONSTRAINT `fk_op_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_op_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1243906 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_stop_log_contents`
--

DROP TABLE IF EXISTS `order_stop_log_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_stop_log_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_stop_log_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_oslc_osl_id` (`order_stop_log_id`),
  CONSTRAINT `fk_oslc_osl_id` FOREIGN KEY (`order_stop_log_id`) REFERENCES `order_stop_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148772 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_stop_log_order_stops`
--

DROP TABLE IF EXISTS `order_stop_log_order_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_stop_log_order_stops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_stop_log_id` int(10) unsigned NOT NULL,
  `order_stop_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oslos_order_stop_log_id` (`order_stop_log_id`),
  KEY `fk_oslos_order_stop_id` (`order_stop_id`),
  CONSTRAINT `fk_oslos_order_stop_id` FOREIGN KEY (`order_stop_id`) REFERENCES `order_stops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oslos_order_stop_log_id` FOREIGN KEY (`order_stop_log_id`) REFERENCES `order_stop_logs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=430819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_stop_logs`
--

DROP TABLE IF EXISTS `order_stop_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_stop_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `stop_start_date` date NOT NULL,
  `stop_end_date` date NOT NULL,
  `origin_end_date` date NOT NULL,
  `change_end_date` date NOT NULL,
  `request_date` date NOT NULL,
  `stop_day_count` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_stop_log_order_id` (`order_id`),
  CONSTRAINT `fk_order_stop_log_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=430829 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_stops`
--

DROP TABLE IF EXISTS `order_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_stops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_stop_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `stop_start_date` date NOT NULL,
  `stop_end_date` date DEFAULT NULL,
  `is_change_start_date` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `stop_day_count` smallint(5) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_stops_order_id` (`order_id`),
  KEY `fk_order_stops_user_stop_id` (`user_stop_id`),
  CONSTRAINT `fk_order_stops_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_stops_user_stop_id` FOREIGN KEY (`user_stop_id`) REFERENCES `user_stops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=435340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_transfer_contents`
--

DROP TABLE IF EXISTS `order_transfer_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transfer_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_transfer_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_otc_ot_id` (`order_transfer_id`),
  CONSTRAINT `fk_otc_ot_id` FOREIGN KEY (`order_transfer_id`) REFERENCES `order_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8915 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_transfer_other_branches`
--

DROP TABLE IF EXISTS `order_transfer_other_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transfer_other_branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_transfer_id` int(10) unsigned NOT NULL,
  `origin_branch_id` int(10) unsigned NOT NULL,
  `origin_product_id` int(10) unsigned NOT NULL,
  `transfer_branch_id` int(10) unsigned NOT NULL,
  `transfer_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_otob_order_transfer_id` (`order_transfer_id`),
  KEY `fk_otob_transfer_product_id` (`transfer_product_id`),
  KEY `fk_otob_tansfer_branch_id` (`transfer_branch_id`),
  KEY `fk_otob_origin_branch_id` (`origin_branch_id`),
  KEY `fk_otob_origin_product_id` (`origin_product_id`),
  CONSTRAINT `fk_otob_order_transfer_id` FOREIGN KEY (`order_transfer_id`) REFERENCES `order_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_otob_origin_branch_id` FOREIGN KEY (`origin_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_otob_origin_product_id` FOREIGN KEY (`origin_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_otob_transfer_branch_id` FOREIGN KEY (`transfer_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_otob_transfer_product_id` FOREIGN KEY (`transfer_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2652 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_transfer_schedules`
--

DROP TABLE IF EXISTS `order_transfer_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transfer_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_transfer_id` int(10) unsigned NOT NULL,
  `schedule_date` date NOT NULL,
  `execute` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ots_ot_id` (`order_transfer_id`),
  CONSTRAINT `fk_ots_ot_id` FOREIGN KEY (`order_transfer_id`) REFERENCES `order_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_transfers`
--

DROP TABLE IF EXISTS `order_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `giver_id` int(10) unsigned NOT NULL,
  `recipient_id` int(10) unsigned NOT NULL,
  `give_count` smallint(5) unsigned NOT NULL,
  `same` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `origin_start_date` date DEFAULT NULL,
  `origin_end_date` date DEFAULT NULL,
  `origin_quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `transfer_date` date NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_transfers_order_id` (`order_id`),
  KEY `fk_order_transfers_giver_id` (`giver_id`),
  KEY `fk_order_transfers_recipient_id` (`recipient_id`),
  CONSTRAINT `fk_order_transfers_giver_id` FOREIGN KEY (`giver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_transfers_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_transfers_recipient_id` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `original_price` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `payment` int(10) unsigned NOT NULL DEFAULT 0,
  `re_order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `stopped` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_o_user_id` (`user_id`),
  KEY `fk_o_branch_id` (`branch_id`),
  KEY `idx_o_transaction_date` (`transaction_date`),
  CONSTRAINT `fk_o_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_o_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1236567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `others`
--

DROP TABLE IF EXISTS `others`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `others` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_other_order_id` (`order_id`),
  CONSTRAINT `fk_other_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `controller` varchar(60) NOT NULL,
  `action` varchar(60) NOT NULL,
  `show_list` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `type` enum('product','course','facility','sports_wear','coupon') NOT NULL DEFAULT 'sports_wear',
  `title` varchar(60) NOT NULL,
  `order_no` int(10) unsigned NOT NULL DEFAULT 1,
  `product_counts` int(10) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pc_branch_id` (`branch_id`),
  CONSTRAINT `fk_pc_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_category_contents`
--

DROP TABLE IF EXISTS `product_category_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_pcc_product_category_id` (`product_category_id`),
  CONSTRAINT `fk_product_category_content_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_contents`
--

DROP TABLE IF EXISTS `product_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_pc_product_id` (`product_id`),
  CONSTRAINT `fk_product_contents_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_pictures`
--

DROP TABLE IF EXISTS `product_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(100) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pp_product_id` (`product_id`),
  CONSTRAINT `fk_pp_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_relation_types`
--

DROP TABLE IF EXISTS `product_relation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relation_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_relation_type_id` int(10) unsigned NOT NULL DEFAULT 1,
  `display_type` enum('enroll','rent') NOT NULL DEFAULT 'enroll',
  `rel_product_type` enum('enroll','rent','rent_sw') NOT NULL DEFAULT 'rent',
  `product_id` int(10) unsigned NOT NULL,
  `rel_product_id` int(10) unsigned DEFAULT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pr_prt_id` (`product_relation_type_id`),
  KEY `fk_pr_product_id` (`product_id`),
  KEY `fk_pr_rel_product_id` (`rel_product_id`),
  CONSTRAINT `fk_pr_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pr_prt_id` FOREIGN KEY (`product_relation_type_id`) REFERENCES `product_relation_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pr_rel_product_id` FOREIGN KEY (`rel_product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(60) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `gender` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `order_no` int(10) unsigned NOT NULL DEFAULT 1,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_id` (`product_category_id`),
  KEY `fk_product_branch_id` (`branch_id`),
  CONSTRAINT `fk_product_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rent_sws`
--

DROP TABLE IF EXISTS `rent_sws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_sws` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `insert_quantity` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rent_sws_order_id` (`order_id`),
  CONSTRAINT `fk_rent_sws_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `order_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL COMMENT '락카마스터테이블 연결키 - 외래키',
  `no` int(10) unsigned NOT NULL COMMENT '락카번호',
  `insert_quantity` smallint(5) unsigned NOT NULL DEFAULT 1,
  `start_datetime` datetime NOT NULL COMMENT '대여 시작일자',
  `end_datetime` datetime NOT NULL COMMENT '대여 종료일자',
  PRIMARY KEY (`id`),
  KEY `fk_rent_facility_id` (`facility_id`),
  KEY `fk_rent_order_id` (`order_id`),
  KEY `rent_no_index` (`no`),
  KEY `rent_endtime_index` (`end_datetime`),
  CONSTRAINT `fk_rent_facility_id` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rent_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=643013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='락커 대여현황 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservation_contents`
--

DROP TABLE IF EXISTS `reservation_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rc_reservation_id` (`reservation_id`),
  CONSTRAINT `fk_rc_reservation_id` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservation_users`
--

DROP TABLE IF EXISTS `reservation_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `enroll_id` int(10) unsigned DEFAULT NULL,
  `complete` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0: 요청없음 , 1: 요청중, 2 : 노쇼 요청중, 3 : 요청완료, 4: 노쇼 요청완료',
  `complete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ru` (`reservation_id`,`user_id`),
  KEY `fk_ru_enroll_id` (`enroll_id`),
  KEY `fk_ru_reservation_id` (`reservation_id`),
  KEY `fk_ru_user_id` (`user_id`),
  CONSTRAINT `fk_ru_enroll_id` FOREIGN KEY (`enroll_id`) REFERENCES `enrolls` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ru_reservation_id` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ru_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1735278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='예약-회원 관계';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL COMMENT '입력자',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '담당자',
  `type` enum('PT','OT','Counsel','Etc') NOT NULL DEFAULT 'PT' COMMENT '강의 종류',
  `start_time` datetime NOT NULL COMMENT '예약시간',
  `end_time` datetime NOT NULL,
  `progress_time` smallint(5) unsigned NOT NULL DEFAULT 10 COMMENT '진행시간(분)',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '사용여부',
  `created_at` datetime NOT NULL COMMENT '등록일시',
  `updated_at` datetime NOT NULL COMMENT '최종 수정일시',
  PRIMARY KEY (`id`),
  KEY `fk_r_manager_id` (`manager_id`),
  KEY `index_r_start_time` (`start_time`),
  KEY `fk_r_branch_id` (`branch_id`),
  CONSTRAINT `fk_r_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_r_trainer_id` FOREIGN KEY (`manager_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1735208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='예약관리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rp_role_id` (`role_id`),
  KEY `fk_rp_permission_id` (`permission_id`),
  CONSTRAINT `fk_rp_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rp_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `show_list` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_user_contents`
--

DROP TABLE IF EXISTS `temp_user_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_user_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temp_user_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_tuc_temp_user_id` (`temp_user_id`),
  CONSTRAINT `fk_tuc_temp_user_id` FOREIGN KEY (`temp_user_id`) REFERENCES `temp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_user_fcs`
--

DROP TABLE IF EXISTS `temp_user_fcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_user_fcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temp_user_id` int(10) unsigned NOT NULL,
  `fc_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_tuf_temp_user_id` (`temp_user_id`),
  KEY `fk_tuf_fc_id` (`fc_id`),
  CONSTRAINT `fk_tuf_fc_id` FOREIGN KEY (`fc_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tuf_temp_user_id` FOREIGN KEY (`temp_user_id`) REFERENCES `temp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_user_trainers`
--

DROP TABLE IF EXISTS `temp_user_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_user_trainers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temp_user_id` int(10) unsigned NOT NULL,
  `trainer_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_tut_temp_user_id` (`temp_user_id`),
  KEY `fk_tut_trainer_id` (`trainer_id`),
  CONSTRAINT `fk_tut_temp_user_id` FOREIGN KEY (`temp_user_id`) REFERENCES `temp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tut_trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_users`
--

DROP TABLE IF EXISTS `temp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `counsel_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` tinyint(3) unsigned DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `registration_date` date NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_temp_users_branch_id` (`branch_id`),
  KEY `fk_temp_users_counsel_id` (`counsel_id`),
  CONSTRAINT `fk_temp_users_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_temp_users_counsel_id` FOREIGN KEY (`counsel_id`) REFERENCES `counsels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102908 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_access_cards`
--

DROP TABLE IF EXISTS `user_access_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_access_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `card_no` varchar(100) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_uac_user_id` (`user_id`),
  UNIQUE KEY `unique_uac_card_no` (`card_no`),
  CONSTRAINT `fk_uac_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=194302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_additionals`
--

DROP TABLE IF EXISTS `user_additionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_additionals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `visit_route` varchar(60) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_user_additional_user_id` (`user_id`),
  KEY `fk_user_additional_job_id` (`job_id`),
  CONSTRAINT `fk_user_additional_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_additional_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_contents`
--

DROP TABLE IF EXISTS `user_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_uc_user_id` (`user_id`),
  CONSTRAINT `fk_uc_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `user_id` int(10) unsigned NOT NULL COMMENT 'tbl_member 연결키',
  `os` enum('android','ios') NOT NULL COMMENT '휴대기기 OS 종류, ''android'', ''ios''',
  `token` varchar(200) NOT NULL COMMENT '푸시메시지용 토큰',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '생성시간 - 처음 앱으로 접속한 시간.',
  `updated_at` datetime NOT NULL COMMENT '최종 변경일시',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ud_user_id` (`user_id`),
  CONSTRAINT `fk_ud_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원 휴대기기 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_fcs`
--

DROP TABLE IF EXISTS `user_fcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `fc_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_user_fcs_user_id` (`user_id`),
  KEY `fk_user_fcs_fc_id` (`fc_id`),
  CONSTRAINT `fk_user_fcs_fc_id` FOREIGN KEY (`fc_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_fcs_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152542 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_heights`
--

DROP TABLE IF EXISTS `user_heights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_heights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `height` decimal(8,1) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_user_height_user_id` (`user_id`),
  CONSTRAINT `fk_user_height_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11808 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_logs`
--

DROP TABLE IF EXISTS `user_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ull_user_id` (`user_id`),
  CONSTRAINT `fk_ull_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=436474 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_pictures`
--

DROP TABLE IF EXISTS `user_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `picture_url` varchar(150) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_user_picture_user_id` (`user_id`),
  CONSTRAINT `fk_user_picture_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_stop_contents`
--

DROP TABLE IF EXISTS `user_stop_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stop_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_stop_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_usc_user_stop_id` (`user_stop_id`),
  CONSTRAINT `fk_usc_user_stop_id` FOREIGN KEY (`user_stop_id`) REFERENCES `user_stops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=130581 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_stop_customs`
--

DROP TABLE IF EXISTS `user_stop_customs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stop_customs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `custom_days` int(11) NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_stop_customs_order_id` (`order_id`),
  CONSTRAINT `fk_user_stop_customs_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_stop_requests`
--

DROP TABLE IF EXISTS `user_stop_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stop_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `stop_start_date` date NOT NULL,
  `stop_end_date` date NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `complete` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usr_user_id` (`user_id`),
  CONSTRAINT `usr_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11606 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_stop_schedules`
--

DROP TABLE IF EXISTS `user_stop_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stop_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_stop_id` int(10) unsigned NOT NULL,
  `schedule_date` date NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_stop_id_UNIQUE` (`user_stop_id`),
  KEY `fk_uss_user_stop_id` (`user_stop_id`),
  CONSTRAINT `fk_user_stop_schedules_user_stop_id` FOREIGN KEY (`user_stop_id`) REFERENCES `user_stops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_stops`
--

DROP TABLE IF EXISTS `user_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `stop_start_date` date NOT NULL,
  `stop_end_date` date DEFAULT NULL,
  `stop_day_count` smallint(5) unsigned NOT NULL DEFAULT 1,
  `request_date` date NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_us_user_id` (`user_id`),
  CONSTRAINT `fk_us_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=141843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_temp_user_transfers`
--

DROP TABLE IF EXISTS `user_temp_user_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_temp_user_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `temp_user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_temp_user_users_temp_user_id` (`temp_user_id`),
  UNIQUE KEY `fk_temp_user_users_user_id` (`user_id`),
  CONSTRAINT `fk_temp_user_users_temp_user_id` FOREIGN KEY (`temp_user_id`) REFERENCES `temp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_temp_user_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_trainers`
--

DROP TABLE IF EXISTS `user_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_trainers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `trainer_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_user_trainers_user_id` (`user_id`),
  KEY `fk_user_trainers_triner_id` (`trainer_id`),
  CONSTRAINT `fk_user_trainers_triner_id` FOREIGN KEY (`trainer_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_trainers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_transfers`
--

DROP TABLE IF EXISTS `user_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `old_branch_id` int(10) unsigned NOT NULL,
  `new_branch_id` int(10) unsigned NOT NULL,
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_transfers_old_branch_id` (`old_branch_id`),
  KEY `fk_user_transfers_new_branch_id` (`new_branch_id`),
  KEY `fk_user_transfers_user_id` (`user_id`),
  CONSTRAINT `fk_user_transfers_new_branch_id` FOREIGN KEY (`new_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_transfers_old_branch_id` FOREIGN KEY (`old_branch_id`) REFERENCES `branches` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_transfers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_user_transfers`
--

DROP TABLE IF EXISTS `user_user_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_transfer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_uut_user_id` (`user_id`),
  UNIQUE KEY `fk_uut_user_transfer_id` (`user_transfer_id`),
  CONSTRAINT `fk_uut_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uut_user_transfer_id` FOREIGN KEY (`user_transfer_id`) REFERENCES `user_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_weights`
--

DROP TABLE IF EXISTS `user_weights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_weights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_weight_user_id` (`user_id`),
  CONSTRAINT `fk_user_weights` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5809 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL COMMENT '지점번호, 센터는 지점테이블 참조로 찾을 것.',
  `name` varchar(50) NOT NULL COMMENT '회원이름',
  `phone` varchar(20) DEFAULT NULL COMMENT '연락처, 휴대폰번호',
  `gender` tinyint(3) unsigned DEFAULT NULL COMMENT '성별',
  `birthday` date DEFAULT NULL COMMENT '생년월일, 주민번호와 다를 수 있음.',
  `registration_date` date NOT NULL COMMENT '등록일',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL COMMENT '등록일시',
  `updated_at` datetime NOT NULL COMMENT '마지막 변경 시점',
  PRIMARY KEY (`id`),
  KEY `fk_user_branch_id` (`branch_id`),
  KEY `idx_u_name` (`name`),
  KEY `idx_u_phone` (`phone`),
  CONSTRAINT `fk_u_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=273863 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원기본정보';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-03 22:05:18
