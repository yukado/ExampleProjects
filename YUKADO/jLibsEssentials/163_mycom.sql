-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 24. Apr 2018 um 16:05
-- Server Version: 5.6.17
-- PHP-Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `163_mycom`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Daten für Tabelle `administrators`
--

INSERT INTO `administrators` (`admin_id`, `email`, `password`) VALUES
(1, 'admin@mycom.de', '05b24dfc60c08ea0b6a177fe0dabd4e579889c3b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Daten für Tabelle `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(5, 'Büro & Schreibwaren'),
(4, 'Kleidung & Accessoires'),
(3, 'Uhren & Schmuck'),
(2, 'Computer, Tablets & Netzwerk'),
(1, 'Handys, Smartwatches, Kommunik');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `expenses_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `purchase_date` datetime NOT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Daten für Tabelle `expenses`
--

INSERT INTO `expenses` (`expenses_id`, `product_id`, `product_name`, `price`, `purchase_date`) VALUES
(1, 1, 'Assassins Creed', 0, '2012-12-11 14:58:00'),
(2, 42, 'Sonnenbrille', 480, '2017-07-09 18:13:25'),
(3, 42, 'Sonnenbrille', 0, '2017-07-09 18:15:18'),
(4, 43, 'Samsung-Galaxy-J3-2016', 6800, '2017-07-10 21:19:18'),
(5, 43, 'Samsung-Galaxy-J3-2016', 0, '2017-07-10 21:20:57'),
(6, 43, 'Samsung-Galaxy-J3-2016', 0, '2017-07-10 21:22:40'),
(7, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 10980, '2017-07-10 22:29:37'),
(8, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 0, '2017-07-10 22:31:11'),
(9, 45, 'LEGO Star Wars Reys speeder 75099', 40, '2017-08-08 11:20:31'),
(10, 45, 'LEGO Star Wars Reys speeder 75099', 0, '2017-08-08 11:21:05'),
(11, 46, 'RYOBI EPS80RS 80W Multischleife', 72, '2017-08-08 11:26:34'),
(12, 47, 'Solitary 2.0 Longboard in grÃ?Â¼n green 22297', 2700, '2017-08-15 14:43:03'),
(13, 47, 'Solitary 2.0 Longboard in grÃ??Ã?Â¼n green 22297', 0, '2017-08-15 14:44:15'),
(14, 31, 'FERRARI Flap Case Fliptasche fÃ¼r Samsung Galaxy S4', 74, '2017-08-19 21:04:26'),
(15, 6, 'Original Samsung Galaxy S4 GI9500 Akkudeckel Back Cover WeiÃ?', 0, '2017-08-19 21:06:03');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `image-id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image-name` varchar(255) NOT NULL,
  `product-name` varchar(255) NOT NULL,
  PRIMARY KEY (`image-id`),
  UNIQUE KEY `image-name` (`image-name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=155 ;

--
-- Daten für Tabelle `images`
--

INSERT INTO `images` (`image-id`, `image-name`, `product-name`) VALUES
(31, 'uploads/32.jpg', 'Flap Case Fliptasche Galaxy S4'),
(30, 'uploads/31.jpg', 'Galaxy S5 SView Cover Flip Tasche Metallic'),
(29, 'uploads/29.jpg', 'Galaxy S6 S VIEW COVER Flip Stoff Tasche EF'),
(44, 'uploads/45.jpg', 'Galaxy S7710 X-Cover 2 Akkudeckel'),
(43, 'uploads/44.jpg', 'Flip Cover Galaxy S4'),
(42, 'uploads/43.jpg', 'Galaxy S5 mini S View Cover Flip Tasche'),
(41, 'uploads/42.jpg', 'Galaxy S5 S View Cover Flip Tasche'),
(40, 'uploads/41.jpg', 'Galaxy Grand Pr. EFWG530 Flip Wallet Book'),
(38, 'uploads/39.jpg', 'Nokia 8210 Cover Blau'),
(39, 'uploads/40.jpg', 'Galaxy S3 mini Original Schutzhülle Cover'),
(37, 'uploads/37.jpg', 'Galaxy J1 (2016) SM-J120F Akkudeckel BackCo'),
(35, 'uploads/36.jpg', 'Coat Fruit Case Grape Schützhülle u. LCD Folie iPho'),
(33, 'uploads/34.jpg', 'Coat Fruit Case Banana Schützhülle'),
(34, 'uploads/35.jpg', 'Galaxy Alpha G850F Akkudeckel Back Cover Sc'),
(32, 'uploads/33.jpg', 'Hochglanz Schützhülle/Cover in schwarz'),
(28, 'uploads/28.jpg', 'Birds Cover/Schutztasche High gloss'),
(27, 'uploads/27.jpg', 'Galaxy S3 mini Flip Cover Display'),
(26, 'uploads/26.jpg', 'Cover/Schutztasche iPhone 5 5s'),
(25, 'uploads/25.jpg', 'Cover/Schutztaschen iPhone 5 5s'),
(24, 'uploads/21.jpg', 'Coconut Schützhülle u. LCD Folie'),
(23, 'uploads/23.jpg', 'SlimCase SoftTouchNeopren Blueberry 7'),
(22, 'uploads/22.jpg', 'Galaxy S 4 Flip Cover FlipCase'),
(21, 'uploads/24.jpg', 'Sheer Schutzhülle Galaxy S3'),
(20, 'uploads/20.jpg', 'Coconut Schützhülle u. LCD Folie'),
(19, 'uploads/19.jpg', 'Galaxy S6 edge Flip Stoff Tasche'),
(17, 'uploads/17.jpg', 'Covers/Schutztaschen iPhone 5 5s'),
(18, 'uploads/18.jpg', 'Galaxy S 4 mini Flip Cover FlipCase'),
(16, 'uploads/16.jpg', 'IPhone 5 5s Tasche'),
(15, 'uploads/15.jpg', 'Magnet Charging Galaxy S5'),
(13, 'uploads/13.jpg', 'Panzerglas + Silikontasche'),
(14, 'uploads/14.jpg', 'Schützhülle iPhone 5 5s'),
(12, 'uploads/12.jpg', 'Hard Case iPhone 5'),
(10, 'uploads/10.jpg', 'Ladegerät SOLAR Rucksack'),
(11, 'uploads/11.jpg', 'Galaxy Akkudeckel'),
(9, 'uploads/9.jpg ', 'Galaxy Grand Pr. Akkudeckel'),
(8, 'uploads/8.jpg ', 'Galaxy S5 mini Taschen'),
(7, 'uploads/7.jpg ', 'Galaxy S5 BackCover'),
(2, 'uploads/2.jpg ', 'Galaxy S5 mini Tasche'),
(1, 'uploads/1.jpg ', 'Power Case Galaxy S4'),
(3, 'uploads/3.jpg ', 'Galaxy J5 BackCover'),
(5, 'uploads/4.jpg ', 'Handytasche'),
(4, 'uploads/5.jpg ', 'Powerbank Samsung S5'),
(6, 'uploads/6.jpg ', 'Galaxy S4 BackCover');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` enum('pending','approved','delivered') NOT NULL,
  `shippers_name` varchar(30) NOT NULL,
  `address` varchar(120) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `shippers_email` varchar(45) NOT NULL,
  `ordered_On` datetime NOT NULL,
  `total_order_price` double(10,2) unsigned NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Daten für Tabelle `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `status`, `shippers_name`, `address`, `mobile_number`, `shippers_email`, `ordered_On`, `total_order_price`) VALUES
(1, 1, 'delivered', 'Chirag Pandit', 'B-10, 102 SilverPark, Mira Bhyendar Road, Mira Road east', '9004300', 'dead.night7@gmail.com', '2016-12-15 01:03:41', 1450.00),
(2, 78, 'delivered', 'Yusuf Kagan Dogruyol', 'agaydsagrydsg', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-10 00:51:22', 3764.85),
(3, 78, 'pending', 'Yusuf Kagan Dogruyol', 'agaydsagrydsg', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-10 00:51:58', 0.00),
(4, 78, 'pending', 'Yusuf Kagan Dogruyol', 'agaydsagrydsg', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-10 00:58:36', 0.00),
(5, 78, 'delivered', 'dtjuft', 'w4hrxnb f', '265436', 'yusufkagandogruyol@gmail.com', '2017-07-10 21:28:09', 136.90),
(6, 78, 'pending', 'Yusuf Kagan Dogruyol', 'agaydsagrydsg', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-10 21:30:03', 0.00),
(7, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-10 23:52:49', 549.90),
(8, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:11:00', 0.00),
(9, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:11:42', 549.90),
(10, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:19:17', 0.00),
(11, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:22:49', 549.90),
(12, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:23:09', 0.00),
(13, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:23:42', 549.90),
(14, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:24:17', 549.90),
(15, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:37:05', 549.90),
(16, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 00:48:59', 549.90),
(17, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 01:05:03', 549.90),
(18, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 12:23:24', 1099.80),
(19, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 12:23:31', 0.00),
(20, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 13:50:41', 549.90),
(21, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 13:54:56', 549.90),
(22, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 13:57:24', 549.90),
(23, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 13:59:31', 549.90),
(24, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:04:16', 549.90),
(25, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:26:01', 549.90),
(26, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:31:50', 549.90),
(27, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:38:27', 549.90),
(28, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:43:14', 549.90),
(29, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:45:50', 549.90),
(30, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 14:54:46', 549.90),
(31, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 15:06:43', 549.90),
(32, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 15:09:34', 549.90),
(33, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 15:15:44', 549.90),
(34, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 15:58:21', 549.90),
(35, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 16:00:30', 549.90),
(36, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 16:01:43', 549.90),
(37, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 16:49:20', 549.90),
(38, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 17:02:26', 549.90),
(39, 78, 'approved', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 17:07:13', 549.90),
(40, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 17:27:24', 549.90),
(41, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 21:43:53', 549.90),
(42, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 21:53:51', 549.90),
(43, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 22:58:24', 1099.80),
(44, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 23:00:58', 549.90),
(45, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 23:04:05', 549.90),
(46, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 23:14:31', 549.90),
(47, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-11 23:24:03', 549.90),
(48, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 00:24:45', 549.90),
(49, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 00:35:44', 549.90),
(50, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 01:11:58', 549.90),
(51, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 01:13:41', 1099.80),
(52, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 01:44:52', 549.90),
(53, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 01:46:33', 549.90),
(54, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 02:43:31', 1099.80),
(55, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 02:47:00', 549.90),
(56, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 03:33:04', 549.90),
(57, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-07-12 03:44:48', 549.90),
(58, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-12 07:47:30', 36.00),
(59, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-12 08:31:57', 0.00),
(60, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-12 17:25:58', 1119.80),
(61, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-15 16:36:48', 549.90),
(62, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-15 16:40:45', 56.00),
(63, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-21 10:26:58', 5.90),
(69, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-21 12:31:22', 5.90),
(70, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-21 12:32:57', 5.90),
(71, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-08-21 14:31:16', 5.90),
(72, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-12-17 01:43:59', 5.90),
(73, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2017-12-17 01:57:33', 0.00),
(75, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2018-04-18 00:21:20', 0.00),
(76, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2018-04-18 01:10:51', 7.90),
(77, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2018-04-18 01:15:59', 7.90),
(78, 78, 'pending', 'Yusuf', 'agaydsagrydsg/', '1234567', 'yusufkagandogruyol@gmail.com', '2018-04-18 01:20:48', 7.90);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product-company`
--

CREATE TABLE IF NOT EXISTS `product-company` (
  `company-id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company-name` varchar(40) NOT NULL,
  PRIMARY KEY (`company-id`),
  UNIQUE KEY `company-name` (`company-name`),
  UNIQUE KEY `company-name_2` (`company-name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Daten für Tabelle `product-company`
--

INSERT INTO `product-company` (`company-id`, `company-name`) VALUES
(1, 'Prada'),
(2, 'Arenbo'),
(22, 'Samsung'),
(23, 'Aurora'),
(24, 'Lego'),
(25, 'RYOBI'),
(26, 'LOEWE'),
(27, 'DENVER'),
(28, 'RAM');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product-name` varchar(60) NOT NULL,
  `sub-category-name` varchar(40) NOT NULL,
  `category-name` varchar(40) NOT NULL,
  `company-name` varchar(40) NOT NULL,
  `price` double(10,2) unsigned NOT NULL,
  `summary` text,
  `tags` varchar(255) NOT NULL,
  `product_qty` int(11) unsigned NOT NULL,
  `lastUpdated` datetime NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product-name` (`product-name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4294967296 ;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`product_id`, `product-name`, `sub-category-name`, `category-name`, `company-name`, `price`, `summary`, `tags`, `product_qty`, `lastUpdated`, `hits`) VALUES
(44, 'Galaxy S7710 X-Cover 2 Akkudeckel', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 9.90, 'Idealer Ersatz für jedes beschädigte, zerkratzte oder defekte Cover! Mit diesem Original Cover verleihen sie ihrem Handy ein neues Aussehen, oder ersetzten Sie einfach ihr verkratztes oder altes Cover in Kunstleder', '122475190358 Original Samsung Galaxy S7710 X-Cover 2 Akkudeckel Back Cover Schwarz', 50, '2016-12-15 01:03:12', 50),
(42, 'Galaxy S5 mini S View Cover Flip Tasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 11.90, 'Das praktische Samsung Galaxy S View Cover für Ihr GALAXY S5 mini ist so ausgelegt, dass es das Beste aus zwei Welten bietet: Den Stil und die Vertraulichkeit eines Flip Covers und den Komfort eines Bildschirmfensters, durch das Sie angezeigte Warnungen, Status und andere wichtige Informationen im Blick haben. Das schlanke Cover des GALAXY S5 mini kann zum Wechseln des Akkus abgenommen werden. Mit dem S View Cover-Modus können Sie eingehende Anrufe annehmen und durch das Bildschirmfenster die Uhrzeit, das Wetter, S Health usw. anzeigen.', '111645854446 Original Samsung Galaxy S5 mini S View Cover Flip Tasche Weiß', 10, '2016-12-15 01:03:12', 50),
(43, 'Flip Cover Galaxy S4', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 14.90, 'Ein bunter Weg Ihr GALAXY S4 zu schützen Trotz Cover bleibt das Handy schlank da die Akkuabdeckung ausgetauscht wird. Das Flip Cover ist in einer Reihe attraktiver Farben erhältlich. Trotz Cover bleibt das Handy schlank da die Akkuabdeckung ausgetauscht wird. Das Flip Cover ist in einer Reihe attraktiver Farben erhältlich. Stilvolle Farben: Das Flip Cover für das Samsung Galaxy S4 gibt es in verschiedenen Farben, damit für jede Persönlichkeit garantiert die richtige Farbe dabei ist. Sogar der modebewussteste Smartphone-Benutzer wird ein – oder zwei oder drei – Cover finden, das seinem persönlichem Stil entspricht. Spezielles Design: Diese Cover wurden extra für das Samsung Galaxy S4 Smartphone gestaltet. Die Rückseite schnappt problemlos ein und ersetzt den Standardakkudeckel, ohne dass das Smartphone dadurch unhandlich wird. Bildschirmschutz: Durch das Samsung Flip Cover wird auch der Bildschirm des Samsung Galaxy S4 optimal geschützt und die Möglichkeit von Schlieren oder Kratzern verringert.', '132281881764 Samsung Flip Cover für das Samsung Galaxy S4 EF FI950BREGWW in Rot', 2, '2016-12-15 01:03:12', 50),
(39, 'Galaxy S3 mini Original Schutzhülle Cover', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 7.90, 'Hervorragender Rundumschutz. Angepasste Aussparungen für die Anschlüsse. Hochwertige Verarbeitung. Schutz vor Kratzern und Stößen. Alle Funktionen sind weiterhin ohne Einschränkungen bedienbar', '131487748125 Original Samsung Galaxy S3 mini Original Schutzhülle Cover Pink', 5, '2016-12-15 01:03:12', 86),
(40, 'Galaxy Grand Pr. EFWG530 Flip Wallet Book', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 14.90, '- Praktisches und schlankes Design in Lederoptik - Hochwertiges Material sorgt für angenehme Griffigkeit - Die kunstvolle Naht wirkt wie handgemacht und zeugt von hoher Qualität - Integriertes Aufbewahrungsfach für Visitenkarten - Automatisches Ein-/Ausschalten des Bildschirms', '132179373423 Original Samsung Galaxy Grand Prime EFWG530 Flip Wallet Book Cover Weiß', 4, '2016-12-15 01:03:12', 50),
(41, 'Galaxy S5 S View Cover Flip Tasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 14.90, 'Das praktische Samsung Galaxy S View Cover für Ihr GALAXY S5 ist so ausgelegt, dass es das Beste aus zwei Welten bietet: Den Stil und die Vertraulichkeit eines Flip Covers und den Komfort eines Bildschirmfensters, durch das Sie angezeigte Warnungen, Status und andere wichtige Informationen im Blick haben. Das schlanke Cover des GALAXY S5 kann zum Wechseln des Akkus abgenommen werden. Mit dem S View Cover-Modus können Sie eingehende Anrufe annehmen und durch das Bildschirmfenster die Uhrzeit, das Wetter, S Health usw. anzeigen.', '131486549374 Original Samsung Galaxy S5 S View Cover Flip Tasche Sichtfenster Weiß', 1, '2016-12-15 01:03:12', 50),
(34, 'Galaxy Alpha G850F Akkudeckel Back Cover Sc', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 5.90, 'Idealer Ersatz für jedes beschädigte, zerkratzte oder defekte Cover! Mit diesem Original Cover verleihen sie ihrem Handy ein neues Aussehen, oder ersetzten Sie einfach ihr verkratztes oder altes Cover in Kunstleder', '112527729864 Original Samsung Galaxy Alpha G850F Akkudeckel Back Cover Schwarz', 5, '2016-12-15 01:03:12', 50),
(35, 'Coat Fruit Case Grape Schützhülle u. LCD Folie iPho', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Ozaki O!', 6.90, 'Dünn, wie ein Fruchtaufstrich schützt das fruchtig-frische Ozaki O!Coat Fruit case passgenau das Apple iPhone 5. Mit unverwechselbaren Farben macht das Fruit case aus jedem iPhone 5 einen echten Augenschmaus. Weg mit dem tristen Alltag - lassen Sie etwas Farbe hinein!', '111063867010 Ozaki O! Coat Fruit Case Grape Schützhülle u. LCD Folie iPhone 5 5s in violett', 10, '2016-12-15 01:03:12', 51),
(36, 'G530 Grand Prime Panzerglas H9 Schutzfolie + Silikon', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 5.90, ' Das speziell hergestellte Schutzglas schützt Ihr Display gegen Beschädigung und Kratzer von außen. Das Verbundglas ist sehr kratzfest und dennoch leicht anzubringen. Achtung: Das Glas ist kleiner als das eigentliche Display. Es wurde aufgrund der Wölbung des Displays bewusst kleiner geschnitten. Sonst würde das Glas an den Seite nicht am Display haften! Das Glas endet da, wo der Rahmen vom LC-Display endet und sich das Display anfängt zu wölben. Entsprechend ist es nur minimal kleiner geschnitten! ', '132179426546 Samsung G530 Grand Prime Panzerglas H9 Schutzfolie + Silikontasche durchsichtig', 10, '2016-12-15 01:03:12', 50),
(37, 'Galaxy J1 (2016) SM-J120F Akkudeckel BackCo', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 9.90, 'Idealer Ersatz für jedes beschädigte, zerkratzte oder defekte Cover! Mit diesem Original Cover verleihen sie ihrem Handy ein neues Aussehen, oder ersetzten Sie einfach ihr verkratztes oder altes Cover.', '112257135264 Original Samsung Galaxy J1 (2016) SM-J120F Akkudeckel BackCover Weiß', 10, '2016-12-15 01:03:12', 50),
(38, 'Nokia 8210 Cover Blau', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Nokia', 24.90, 'Original Nokia Qualität = Langlebig & Passgenau, Hochwertige Materialien & Lackierung, Einfacher Austausch, kein Schrauben nötig, Displayglas bereits vormontiert, Ersatzteil bereits komplett vormontiert, bereit zum Einbau', '122191492742 Original Nokia 8210 Cover Blau Electric Blue Front Oberschale Housing', 3, '2016-12-15 01:03:12', 51),
(33, 'Coat Fruit Case Banana Schützhülle', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Ozaki O!', 6.90, 'Dünn, wie ein Fruchtaufstrich schützt das fruchtig-frische Ozaki O!Coat Fruit case passgenau das Apple iPhone 5. Mit unverwechselbaren Farben macht das Fruit case aus jedem iPhone 5/ 5S einen echten Augenschmaus. Weg mit dem tristen Alltag - lassen Sie etwas Farbe hinein!', '121103793944 Ozaki O! Coat Fruit Case Banana Schützhülle u.LCD Folie für iPhone 5 5s in gelb', 10, '2016-12-15 01:03:12', 50),
(32, 'Hochglanz Schützhülle/Cover in schwarz', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Gear4', 8.90, 'Für Liebhaber von glänzenden Farben und funkelnden Augen ist die Gear4 Pop Hülle der perfekte Schutz mit der richtigen Optik für Sie. Neben der hochglänzenden und farbigen Optik werden Rückseite sowie Seiten Ihres iPhone 5 von der Schutzhülle perfekt vor Kratzern und Schmutz geschützt. Die hauteng angepasste Konstruktion lässt Ihr iPhone schlank bleiben und passt auch perfekt in jede Hosentasche. Dabei bleiben alle Bedienelemente frei zugänglich und können wie gewohnt verwendet werden. ', '121107041281 Gear4 POP hoch Glanz Schützhülle / Cover in schwarz für iPhone 5 5s', 10, '2016-12-15 01:03:12', 50),
(31, 'Flap Case Fliptasche Galaxy S4', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'FERRARI', 14.90, 'In dieser hochwertigen Tasche ist Ihr Mobiltelefon bestens geschÃ¼tzt und dennoch immer schnell zur Hand. Auf der edlen Vorderseite prangt ein Emblem des original Ferrari-Pferdes.', '121432095093 FERRARI Flap Case Fliptasche fÃ¼r Samsung Galaxy S4', 6, '2017-08-19 21:04:26', 54),
(30, 'Galaxy S5 SView Cover Flip Tasche Metallic ', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 14.90, 'Das praktische Samsung Galaxy S View Cover für Ihr GALAXY S5 ist so ausgelegt, dass es das Beste aus zwei Welten bietet: Den Stil und die Vertraulichkeit eines Flip Covers und den Komfort eines Bildschirmfensters, durch das Sie angezeigte Warnungen, Status und andere wichtige Informationen im Blick haben. Das schlanke Cover des GALAXY S5 kann zum Wechseln des Akkus abgenommen werden. Mit dem S View Cover-Modus können Sie eingehende Anrufe annehmen und durch das Bildschirmfenster die Uhrzeit, das Wetter, S Health usw. anzeigen.', '111646359558 Original Samsung Galaxy S5 SView Cover Flip Tasche Metallic Pink', 10, '2016-12-15 01:03:12', 52),
(29, 'Galaxy S6 S VIEW COVER Flip Stoff Tasche EF', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 14.90, 'Offizielles Samsung-Zubehör, speziell für das Galaxy S6  konzipiert. Eigenschaften:- Bedeckt mit stylischem, weichen Gewebe - Die Flip-Hüllebietet den Rundumschutz für das Gerät - Die Flip-Hülle zeichnet sich durch modernes Design, haltbare Konstruktion und Premium-Materialien aus - Die Frontklappe schützt das Display - Die Flip-Hülle hat passgenaue Ausschnitte für Lautsprecher und Kamera - Alle Anschlüsse sind zugänglich. Dieses Produkt ist kompatibel mit: Samsung Galaxy S6 G920', '112338197884 Original Samsung Galaxy S6 S VIEW COVER Flip Stoff Tasche EF CG920BOE', 5, '2016-12-15 01:03:12', 50),
(27, 'Birds Cover/Schutztasche High gloss', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Gear4', 5.90, 'Mit dem Cheep ShowCase von Gear4 wird Ihr iPhone 5 / 5s ideal und mit einem lustigen Motiv geschützt. Das Wortspiel auf der Rückseite der Schutzhülle sorgt für Freude bei jeder Benutzung. Die Hülle umschließt Ihr iPhone rundum, nur das Display wird ausgespart. Dabei wirkt das Case leicht und schlank. Alle Bedienelemente wurden ausgespart, sodass Sie bei der Handhabung Ihres iPhone 5 vollen Komfort genießen können.', '111068455015 Gear4 ShowCase Birds Cover/Schutztasche High gloss Clip Design für iPhone 5 5s', 10, '2016-12-15 01:03:12', 50),
(28, 'Armband für Sport iPhone 4 4s', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Markenlos', 8.88, 'Beim Joggen im Park, Workout im Fitness-Center oder Mountain-Biking auf den gefährlichsten Pisten ist Ihr geliebtes Smartphone ab sofort SICHER dabei. So sind Sie mit Ihrem Smartphone nicht nur erreichbar, sondern lassen sich von Ihrer Musikbibliothek auch motivieren. Dieses sehr bequeme Armband bietet kompletten Schutz für Ihr Smartphone, wenn Sie Sport treiben oder einfach nur unterwegs sind. Der Riemen aus leichtem, atmungsaktivem Neopren ist mit einem Klettverschluss versehen, so dass die gewünschte Größe eingestellt werden kann. Sie können das Gerät bequem ein- und ausschalten, wenn nach dem Joggen der Alltag weitergeht. Das Material ist spritzwassergeschützt und handwaschbar. Perfekter Schutz und leichter Zugriff auf das Smartphone - ohne lästigen Ballast in der Hand während des Training oder Spaziergang.Das Armband ist sehr leicht in der Handhabung. Ihr iPhone wird einfach von innen eingesteckt und ist somit abgesichert. Das Armband lässt sich Stufenlos per extra langem Klettverschluss und 1 Ösen auf nahezu jeden Arm einstellen', '111273803112 DESIGN Armband für Sport Oberarm Tasche für iPhone 4 4s Joggen Laufen', 10, '2016-12-15 01:03:12', 50),
(25, 'Cover/Schutztasche iPhone 5 5s', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Gear4', 9.90, 'Genießen Sie freie Sicht auf Ihr iPhone 5 mit der Schutzhülle gear4 IceBox Edge. Die 9 Gramm leichte Schale gewährleistet trotz ihres geringen Gewichts optimalen Smartphone-Schutz. Besonders die empfindlichen Ecken des intelligenten Kommunikationsapparats sind durch die verstärkten Kanten besonders gut gegen Kratzer und Stöße gewappnet. Gleichzeitig bleibt der Zugang zu allen Anschlüssen und Bedienelementen durch exakte Aussparungen frei.', '121106549152 Gear4 IceBox Edge Cover /Schutztasche für iPhone 5 5s Transparent weiss', 4, '2016-12-15 01:03:12', 50),
(26, 'Galaxy S3 mini Flip Cover Display ', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 8.80, 'Sicherer Schutz für das Galaxy S III mini Schützende Display-Klappe aus strapazierfähigem Material Angepasste Aussparungen für den direkten Zugriff auf Gerätefunktionen und Anschlüsse EFC-1M7FA Schützende Display-Klappe aus strapazierfähigem Material mit angepassten Aussparungen fürs Telefonieren und den direkten Zugriff auf Gerätefunktionen und Anschlüsse Design: Flip, Funktionsmerkmale: Zugriff auf Anschlüsse/Bedienfläche, Abmessungen: Farbe: Gelb, Außenmaterial: Polyurethan-Kunstleder, Höhe: 121,5 mm, Breite: 63 mm, Tiefe: 10,9 mm, Gewicht: 29,8 g, Kompatibilität: Samsung - Galaxy S III mini, Art der Tasche: flip, Materialien: Kunststoff, Polyurethan, Markenkompatibilität: Samsung, Kompatibilität: Samsung GALAXY S III mini, Tragetaschen Stil: Hand, Hosentasche, Schutzfunktion: Staubresistent, Kratzresistent, Breite: 6,3 cm, Tiefe: 1,09 cm, Höhe: 12,15 cm, Wasserfest: Nicht, Bildschirmschutz: Nicht', '131968346105 Original Samsung Galaxy S3 mini Original Flip Cover Display Klappe Gelb', 5, '2016-12-15 01:03:12', 50),
(23, 'Galaxy S 4 Flip Cover FlipCase', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 4.90, 'Schützen Sie Ihr Samsung Galaxy S4 (i9500) und S4 LTE (i9505) vor Kratzern, Stößen und Schmutz mit der ersten originalen Samsung Fliptasche für das Galaxy S4. Die Tasche ist speziell für das S4 entwickelt worden und passt daher 100%ig auf Ihr Gerät., Original Samsung Zubehör, Sicherer Schutz für das Galaxy S4, Schützende Klappe aus strapazierfähigen Material, Akkudeckel aus Kunststoff, Display-Flappe aus Leder, Hochwertige Verarbeitung, Bedienbarkeit: ja, Anschlüsse zugänglich: ja, Kameraöffnung: ja, Hersteller: samsung, Kompatibilität*: Samsung i9500 Galaxy S4, i9505 Galaxy S4 LTE *Die Angaben zur Kompatibilität des Artikels übernehmen wir direkt vom Hersteller des Produkts. Zustand: NEUWARE, ORIGINALWARE', '121188221002 Original Samsung Galaxy S 4 IV Flip Cover FlipCase EF-FI950B Weiss', 10, '2016-12-15 01:03:12', 50),
(24, 'Galaxy Tab 10 Schutzhülle', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Belkin', 14.90, 'Art der Tasche: Abdeckung, Produktfarbe: Transparent, Maximaler Bildschirmdurchmesser: 25,65 cm (10.1"), Markenkompatibilität: Samsung, Kompatibilität: Galaxy Tab 10.1, Tragetaschen Stil: Hand, Schutzfunktion: Kratzresistent', '121574584189 Belkin Snap Shield für Samsung Galaxy Tab 10 1 Schutzhülle Rauchgrau', 50, '2016-12-15 01:03:12', 50),
(19, 'Galaxy S6 edge Flip Stoff Tasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 14.90, 'Original Samsung Galaxy S 6 Edge Flip Textile Tasche, Offizielles Samsung-Zubehör, speziell für das Galaxy SVI Edge konzipiert. Eigenschaften: - Bedeckt mit stylischem, weichen Gewebe - Die Flip-Hülle EF-WG925BS bietet den Rundumschutz für das Gerät - Die Flip-Hülle zeichnet sich durch modernes Design, haltbare Konstruktion und Premium-Materialien aus - Die Frontklappe schützt das Display - Mit Innenfach für Kreditkarten, Visitenkarten oder Bargeld - Die Flip-Hülle hat passgenaue Ausschnitte für Lautsprecher und Kamera - Alle Anschlüsse sind zugänglich, Dieses Produkt ist kompatibel mit: Samsung Galaxy S6 Edge G925', '132129403739 Original Samsung Galaxy S6 edge Flip Geldbörse Stoff Tasche EF WG925BYE', 4, '2016-12-15 01:03:12', 51),
(20, 'Coconut Schützhülle u. LCD Folie', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Ozaki O!', 6.90, 'Ozaki O!Coat Fruit case für iPhone 5,5s Kokosnussweiss: Dünn, wie ein Fruchtaufstrich schützt das fruchtig-frische Ozaki O!Coat Fruit case passgenau das Apple iPhone 5. Mit unverwechselbaren Farben macht das Fruit case aus jedem iPhone 5 einen echten Augenschmaus. Weg mit dem tristen Alltag - lassen Sie etwas Farbe hinein! + Fruchtig-frische Farbe + 1 mm dünn + 10 Gramm leicht + passgenaues Design, (voller Zugriff auf Anschlüsse, Tasten, Kamera) + Pflegeset = O!Coat Fruit case, Ganz nebenbei schützt die unglaublich dünne Schutzschale aus robustem und flexiblem Kunststoff wirksam das iPhone 5 vor Kratzern und leichten Stößen. Mit dem im Lieferumfang enthaltenen Rundum-Sorglos-Paket ist das iPhone 5 perfekt gegen die Tücken der Smartphone-Benutzung abgeschirmt. Neben der Displayschutzfolie sorgt ein Mikrofasertuch für Glanz auf dem Display Ihres iPhone 5, 5S. Technische Daten: Farbe: weiss, Material: Flexibler Kunststoff, Ausrichtung: vertikal, Art: modellspezifisch, Bedienbarkeit: ja, Kameraöffnung: ja, Anschlüsse zugänglich: ja, Tragevorrichtung: keine, Hersteller: Ozaki, Herstellerartikelnr: OC537CU', '121103803692 Ozaki O! Coat Fruit Case Coconut Schützhülle u. LCD Folie iPhone 5 5s in weiss', 10, '2016-12-15 01:03:12', 50),
(21, 'Sheer Schutzhülle Galaxy S3', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Belkin', 3.90, 'Grip Sheer Schutzhülle, Getönte Hochglanzoberfläche, Biegsames, griffiges TPU-Material, Schutz vor Stößen und Kratzern, Schlankes Design in perfekter Passform, Voller Zugriff auf alle Bedienelemente und Anschlüsse, Aussparung für Kameralinse, Farbe: Metallic Schwarz', '121714324825 Belkin Grip Sheer Schutzhülle für Samsung Galaxy S3 Designed für Samsung', 10, '2016-12-15 01:03:12', 50),
(22, 'SlimCase SoftTouchNeopren Blueberry 7', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Bugatti', 5.90, 'Produktbeschreibung: Gerätetyp: Handytasche, Farbe: blueberry, Material: Außen: SoftTouchNeopren (STN), Innen: Microfaser, Breite: 75 mm, Höhe: 122 mm, Kompatibilität: Passend für: Universal, iPhone: 3G, 3GS, 4, 4S, Ab Iphone 5 Gerät 2 mm länger als Tasche, HTC : bitte Maße prüfen 122mm x 75mm, Motorola Defy, Nokia: 3250, 5630 , 5730 , 6290, C3, C6, C7, E6-00, E63, E71, E72, N70, N71, N8, N80, N82, N86, N95, N95 8GB, N96, N97, X6 , Sony Ericsson: Aspen, C702i, C905, Cedar, M600i, W960i, Xperia Neo, Xperia Neo V, Xperia pro, XPERIA X1, XPERIA X2, XPERIA X8, Samsung: B2710, Galaxy Ace, Galaxy mini, i7110, i8000, i8320, i7500 Galaxy, S3850 Corby 2, S5600, SGH-F700 Qbowl, SGH-G810, SGH-i6410, SGH-I7110, SGH-i850 innov8, Sony: Xperia U, Strapazierfähiges SoftTouchNeopren, Displayreinigung durch Mikrofasserfutter, Handwaschbar mit milder Seife', '111647373529 Bugatti Universal Case SlimCase SoftTouchNeopren Blueberry 75 x 122mm', 8, '2016-12-15 01:03:12', 50),
(18, 'Galaxy S 4 mini Flip Cover FlipCase', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 4.90, 'Original & Neu  ab Lager sofort lieferbar. Rechnung Inkl. MwSt. vom Fachhändler.', '111281783290 Original Samsung Galaxy S 4 IV mini Flip Cover FlipCase I9195 GRÜN', 8, '2016-12-15 01:03:12', 50),
(17, 'Covers/Schutztaschen iPhone 5 5s', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'xqisit', 8.90, 'Die Xqisit iPlate Glossy ist eine speziell für das iPhone 5/5s entwickelte Schutzhülle und deshalb sehr passgenau. Das dünne Profil der Schutzhülle trägt nicht stark auf und erhält so die schlanke Form des iPhone. Die Xqisit iPlate Glossy verhindert Kratzer auf der Rückseite und den Kanten des iPhone 5/5s. Der Zugriff auf Anschlüsse und Bedienelemente ist mit der Xqisit iPlate Glossy immer gegeben', '111068990875 xqisit iPlate Glossy Cover /Schutztasche für iPhone 5 5s weiss', 7, '2016-12-15 01:03:12', 50),
(16, 'IPhone 5 5s Tasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Gear4', 7.90, 'Die Transparente Gear4 Clear Case IC503G für das iPhone 5 ist leicht wie eine Feder und trotzdem ultrahart gegen Kratzer und Stöße jeder Art! Die gerade mal 1.23 mm dünne Hülle besteht aus dem hochwertigem und extra gehärteten speziellem Kunststoff , der Ihr iPhone 5 schützt wie eine zweite Haut. Tragen Sie nicht mehr mit sich herum, als Sie wirklich benötigen. iPhone Hüllen gibt es viele, aber kaum eine ist so dünn, hart und elegant zugleich wie die Gear4 Clear Case!', '111103359813 Original Gear4 IC503G Thin Ice Apple IPhone 5 5s Tasche Cover Rückschale', 10, '2016-12-15 01:03:12', 50),
(15, 'Magnet Charging Galaxy S5', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'ANYMODE', 14.90, 'Diese praktische Hartschale für die Rückseite des Handys schützt das Handygehäuse vor Staub und, Schmutz. Sie umgreift das Handy in seiner Form und, lässt nur die Funktionstasten und das Display zum, Bedienen frei. Überzogen mit einer weichen, Gummischicht, liegt die hartschale haptisch, angenehm in der Hand. Diese Hartschale gibt es in, verschiedenen stylischen Trendfarben', '132056126594 ANYMODE Magnet Charging Cover für Samsung Galaxy S5 Weiß Blau oder Grün', 6, '2016-12-15 01:03:12', 50),
(14, 'Schützhülle iPhone 5 5s', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Belkin', 8.90, 'Belkin View Case für Apple iPhone 5 /5s, Die vollständig transparente Polykarbonat-Schutzfläche lässt Ihr iPhone voll zu Geltung kommen, während ein stoßfestes TPU-Band an den Kanten zuverlässig vor Kratzern und Kerben schützt. Das elastische TPU liegt gut in der Hand und sorgt für einen kräftigen Farbtupfer.', '111065390303 Belkin View Case Schützhülle iPhone 5 5s aus Polycarbonat Rosa Transparent', 9, '2016-12-15 01:03:12', 50),
(2, 'Galaxy S5 mini Tasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 11.90, 'Das praktische Samsung Galaxy S View Cover für Ihr GALAXY S5 mini ist so ausgelegt, dass es das Beste aus zwei Welten bietet: Den Stil und die Vertraulichkeit eines Flip Covers und den Komfort eines Bildschirmfensters, durch das Sie angezeigte Warnungen, Status und andere wichtige Informationen im Blick haben. Das schlanke Cover des GALAXY S5 mini kann zum Wechseln des Akkus abgenommen werden. Mit dem S View Cover-Modus können Sie eingehende Anrufe annehmen und durch das Bildschirmfenster die Uhrzeit, das Wetter, S Health usw. anzeigen.', '121621841813 Original Samsung Galaxy S5 mini S View Cover Flip Cover Tasche Grün', 100, '2016-12-15 01:03:49', 50),
(3, 'Galaxy J5 BackCover', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 11.90, 'Das Samsung Galaxy J5 Back Cover ist in vier Trendfarben erhältlich: Schwarz, Gold. Das auffallend attraktive, perforierte Muster auf der Rückseite und das schicke Design mit Konturen sorgen für stilvolles Aussehen in modischen Farben.', '122228224022 Original Samsung Galaxy J5 2016 J510F Akkudeckel BackCover Schwarz Gold', 100, '2016-12-15 01:03:44', 50),
(4, 'Powerbank Samsung S5', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Markenlos', 17.90, 'Output Voltage: 5V, Kapazität: 3800mAh, Input Voltage: 5V, Micro USB 3.0 Input port, Micro USB 3.0 Output port, Gewicht: 105g, Maße:74x17x151mm', '132174271385 Externe Powerbank Akku und Hülle für das Samsung S5 3800mAh in Schwarz', 7, '2016-12-15 01:03:41', 51),
(1, 'Power Case Galaxy S4 ', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Markenlos', 13.90, '3200 MHA starker externer Akku für Samsung Galaxy S4, flaches Design, schwarz, mit Flip Cover und Staender, aufladbar und syncbar ueber Mini USB, Power Pack fuer Galaxy S, Externer Akku für Samsung S4', '122468685408 Externe Power Case Akku Hülle 3200mAh für Samsung Galaxy S4 i9500', 60, '2016-12-15 01:03:50', 50),
(7, 'Galaxy S5 BackCover', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 7.77, 'Das Samsung Galaxy S5 Back Cover ist in vier Trendfarben erhältlich: Schwarz, Weiß, Blau und Gold. Das auffallend attraktive, perforierte Muster auf der Rückseite und das schicke Design mit Konturen sorgen für stilvolles Aussehen in modischen Farben.', '122650390845 Original Samsung Galaxy S5 Akkudeckel Back Cover Schwarz Gold Weiss Weiß', 10, '2016-12-15 01:03:12', 50),
(6, 'Galaxy S4 BackCover', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 5.90, 'Idealer Ersatz für jedes beschädigte, zerkratzte oder defekte Cover! Mit diesem Original Cover verleihen sie ihrem Handy ein neues Aussehen, oder ersetzten Sie einfach ihr verkratztes oder altes Cover.', '112257127455 Original Samsung Galaxy S4 GI9500 Akkudeckel Back Cover Weiß', 5, '2016-12-15 01:03:11', 92),
(5, 'Handytasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'FERRARI', 11.90, 'Von Ferrari lizenziertes Qualitätsprodukt mit Lizenzsiegel auf jeder Packung, Ferrari-Pferde-Logo auf der Vorderseite, Aus der Ferrari Formula One Carbon Kollektion, Material: Hochwertiges und strapazierfähiges PU in Karbon-Optik, Aufklappbare Displayabdeckung (Buchstyle), In dieser hochwertigen Tasche ist Ihr Mobiltelefon bestens geschützt und dennoch immer schnell zur Hand. Auf der edlen Vorderseite mit Applikation prangt ein Emblem des offiziellen Ferrari-Pferdes., Kompatibel zu LG G Flex D95', '122356711749 Scuderia FERRARI Booktype Handytasche in Karbon Optik für das LG G FLEX ', 7, '2016-12-15 01:03:10', 50),
(10, 'Ladegerät SOLAR Rucksack', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'EnerPlex', 74.90, 'Es ist in der Lage Lade vielen elektronischen Geräten in weniger als 3 Stunden. Ausgestattet mit flexibler Technologie " Solar ist aus Kunststoff " , der Sonnenkollektor ist vollständig in die Tasche integriert. Dieser Rucksack ist eine technische Meisterleistung und ermöglicht es Ihnen, immer Ihre Solarenergiequellemit Ihnen.', '112160138851 EnerPlex Packr Executive High End Ladegerät SOLAR Rucksack in Grau', 1, '2016-12-15 01:03:12', 60),
(11, 'Galaxy Akkudeckel', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 6.90, 'Idealer Ersatz für jedes beschädigte, zerkratzte oder defekte Cover! Mit diesem Original Cover verleihen sie ihrem Handy ein neues Aussehen, oder ersetzten Sie einfach ihr verkratztes oder altes Cover. in Kunstleder', '111664468760 Original Samsung Galaxy Grand 2 G7105 Akkudeckel Back Cover Schwarz', 5, '2016-12-15 01:03:12', 50),
(12, 'Hard Case iPhone 5', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'ANYMODE', 8.90, 'Dieses Hardcase von AnyMode schützt Ihr iPhone 5 vor Kratzern und anderen Beschädigungen, ausserdem ist es mit dem Iron Man, Spiderman oder Hulk Design ein echt stylischer Hingucker.', '132196517974 ANYMODE Marvel Comics Hard Case Schutzhülle für das iPhone 5 5S SE', 10, '2016-12-15 01:03:12', 50),
(13, 'Panzerglas + Silikontasche', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'SONY', 6.90, ' Das speziell hergestellte Schutzglas schützt Ihr Display gegen Beschädigung und Kratzer von außen. Das Verbundglas ist sehr kratzfest und dennoch leicht anzubringen. Achtung: Das Glas ist kleiner als das eigentliche Display. Es wurde aufgrund der Wölbung des Displays bewusst kleiner geschnitten. Sonst würde das Glas an den Seite nicht am Display haften! Das Glas endet da, wo der Rahmen vom LC-Display endet und sich das Display anfängt zu wölben. Entsprechend ist es nur minimal kleiner geschnitten!', '132051926641 SONY Panzerglas Schutzglas H9 Schutzfolie + Silikontasche durchsichtig', 10, '2016-12-15 01:03:12', 50),
(8, 'Galaxy S5 mini Taschen', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 11.90, 'Das praktische Samsung Galaxy S View Cover für Ihr GALAXY S5 mini ist so ausgelegt, dass es das Beste aus zwei Welten bietet: Den Stil und die Vertraulichkeit eines Flip Covers und den Komfort eines Bildschirmfensters, durch das Sie angezeigte Warnungen, Status und andere wichtige Informationen im Blick haben. Das schlanke Cover des GALAXY S5 mini kann zum Wechseln des Akkus abgenommen werden. Mit dem S View Cover-Modus können Sie eingehende Anrufe annehmen und durch das Bildschirmfenster die Uhrzeit, das Wetter, S Health usw. anzeigen.', '131485922454 Original Samsung Galaxy S5 mini SView Cover Flip Tasche Rose Gold', 10, '2016-12-15 01:03:12', 50),
(9, 'Galaxy Grand Pr. Akkudeckel', 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunikation & Zu', 'Samsung', 9.90, 'Idealer Ersatz für jedes beschädigte, zerkratzte oder defekte Cover! Mit diesem Original Cover verleihen sie ihrem Handy ein neues Aussehen, oder ersetzten Sie einfach ihr verkratztes oder altes Cover. Einfache Anbringung, 100% Passgenauigkeit, 100% Original, Farbe: Schwarz, G530F, Lieferumfang: Original Samsung Back Cover - Akkudeckel als Bulk Ware, gegebenfalls  angezeigtes kompatibles Endgerät nicht im Lieferumfang', '112527760875 Original Samsung Galaxy Grand Prime G530F Akkudeckel in Grau oder Weiß', 10, '2016-12-15 01:03:12', 50);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL,
  `sold_on` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Daten für Tabelle `sales`
--

INSERT INTO `sales` (`sales_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `sold_on`, `user_id`) VALUES
(1, 1, 3, 'Assassins Creed III', 600.00, 1, '2016-12-15 01:03:41', 1),
(2, 2, 1, 'Grand theft Auto Vice City', 250.99, 15, '2017-07-10 00:51:22', 78),
(3, 5, 43, 'Samsung-Galaxy-J3-2016', 136.90, 1, '2017-07-10 21:28:09', 78),
(4, 7, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-10 23:52:49', 78),
(5, 9, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 00:11:42', 78),
(6, 11, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 00:22:49', 78),
(7, 13, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 00:23:42', 78),
(8, 14, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 00:24:17', 78),
(9, 15, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 00:37:05', 78),
(10, 16, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 00:48:59', 78),
(11, 17, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 01:05:03', 78),
(12, 18, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 2, '2017-07-11 12:23:24', 78),
(13, 20, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 13:50:41', 78),
(14, 21, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 13:54:56', 78),
(15, 22, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 13:57:24', 78),
(16, 23, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 13:59:31', 78),
(17, 24, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:04:16', 78),
(18, 25, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:26:01', 78),
(19, 26, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:31:50', 78),
(20, 27, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:38:27', 78),
(21, 28, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:43:14', 78),
(22, 29, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:45:50', 78),
(23, 30, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 14:54:46', 78),
(24, 31, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 15:06:43', 78),
(25, 32, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 15:09:34', 78),
(26, 33, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 15:15:44', 78),
(27, 34, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 15:58:21', 78),
(28, 35, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 16:00:30', 78),
(29, 36, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 16:01:43', 78),
(30, 37, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 16:49:20', 78),
(31, 38, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 17:02:26', 78),
(32, 39, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 17:07:13', 78),
(33, 40, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 17:27:24', 78),
(34, 41, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 21:43:53', 78),
(35, 42, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 21:53:51', 78),
(36, 43, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 2, '2017-07-11 22:58:24', 78),
(37, 44, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 23:00:58', 78),
(38, 45, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 23:04:05', 78),
(39, 46, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 23:14:31', 78),
(40, 47, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-11 23:24:03', 78),
(41, 48, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 00:24:46', 78),
(42, 49, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 00:35:44', 78),
(43, 50, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 01:11:58', 78),
(44, 51, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 2, '2017-07-12 01:13:41', 78),
(45, 52, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 01:44:52', 78),
(46, 53, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 01:46:33', 78),
(47, 54, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 2, '2017-07-12 02:43:31', 78),
(48, 55, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 02:47:00', 78),
(49, 56, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 03:33:05', 78),
(50, 57, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-07-12 03:44:48', 78),
(51, 58, 46, 'RYOBI EPS80RS 80W Multischleife', 36.00, 1, '2017-08-12 07:47:30', 78),
(52, 60, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 2, '2017-08-12 17:25:58', 78),
(53, 60, 45, 'LEGO Star Wars Reys speeder 75099', 20.00, 1, '2017-08-12 17:25:58', 78),
(54, 61, 44, 'V7 iCartech Navigation GPS DVD Autoradio', 549.90, 1, '2017-08-15 16:36:48', 78),
(55, 62, 46, 'RYOBI EPS80RS 80W Multischleife', 36.00, 1, '2017-08-15 16:40:45', 78),
(56, 62, 45, 'LEGO Star Wars Reys speeder 75099', 20.00, 1, '2017-08-15 16:40:45', 78),
(57, 63, 6, 'Original Samsung Galaxy S4 GI9500 Akkudeckel Back Cover Weiß', 5.90, 1, '2017-08-21 10:26:58', 78),
(63, 69, 6, 'Original Samsung Galaxy S4 GI9500 Akkudeckel Back Cover Weiß', 5.90, 1, '2017-08-21 12:31:22', 78),
(64, 70, 6, 'Original Samsung Galaxy S4 GI9500 Akkudeckel Back Cover Weiß', 5.90, 1, '2017-08-21 12:32:57', 78),
(65, 71, 6, 'Original Samsung Galaxy S4 GI9500 Akkudeckel Back Cover Weiß', 5.90, 1, '2017-08-21 14:31:16', 78),
(66, 72, 6, 'Galaxy S4 BackCover', 5.90, 1, '2017-12-17 01:43:59', 78),
(68, 76, 39, 'Galaxy S3 mini Original Schutzhülle Cover', 7.90, 1, '2018-04-18 01:10:51', 78),
(69, 77, 39, 'Galaxy S3 mini Original Schutzhülle Cover', 7.90, 1, '2018-04-18 01:15:59', 78),
(70, 78, 39, 'Galaxy S3 mini Original Schutzhülle Cover', 7.90, 1, '2018-04-18 01:20:48', 78);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sub-category`
--

CREATE TABLE IF NOT EXISTS `sub-category` (
  `subcategory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub-category_name` varchar(30) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  UNIQUE KEY `sub-category_name` (`sub-category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Daten für Tabelle `sub-category`
--

INSERT INTO `sub-category` (`subcategory_id`, `sub-category_name`, `category_name`) VALUES
(29, 'Damen-Turnschuhe & -Sneakers', 'Kleidung & Accessoires'),
(28, 'Herrenstiefel & -Boots', 'Kleidung & Accessoires'),
(27, 'Herren-Sonnenbrillen', 'Kleidung & Accessoires'),
(26, 'Damen-Pumps', 'Kleidung & Accessoires'),
(25, 'Herren-Turnschuhe & -Sneakers', 'Kleidung & Accessoires'),
(24, 'Damen-Halbschuhe & -Ballerinas', 'Kleidung & Accessoires'),
(23, 'Damen-Sonnenbrillen', 'Kleidung & Accessoires'),
(22, 'Echtschmuck', 'Uhren & Schmuck'),
(21, 'Armbanduhren', 'Uhren & Schmuck'),
(20, 'Ringe mit echten Edelsteinen', 'Uhren & Schmuck'),
(19, 'Sonstige Armbänder aus Echtsch', 'Uhren & Schmuck'),
(18, 'Sonstige Ringe aus Echtschmuck', 'Uhren & Schmuck'),
(17, 'Sonstige Halsketten & Anhänger', 'Uhren & Schmuck'),
(16, 'Tintenpatronen für Computer-Dr', 'Computer, Tablets & Netzwerk'),
(15, 'Sonstige Computer-Netzwerkkabe', 'Computer, Tablets & Netzwerk'),
(14, 'USB-WLAN-Adapter & -Dongles', 'Computer, Tablets & Netzwerk'),
(13, 'Computer-Monitor- & AV-Kabel &', 'Computer, Tablets & Netzwerk'),
(12, 'USB-Kabel, -Hubs & -Adapter', 'Computer, Tablets & Netzwerk'),
(11, 'Ethernetkabel (RJ-45/8P8C)', 'Computer, Tablets & Netzwerk'),
(10, 'Sonstige Computer-Komponenten ', 'Computer, Tablets & Netzwerk'),
(9, 'Tonerkassetten für Computer-Dr', 'Computer, Tablets & Netzwerk'),
(8, 'Handy-Ladegeräte & -Dockingsta', 'Handys, Smartwatches, Kommunik'),
(7, 'Handy- & PDA- Zubehö', 'Handys, Smartwatches, Kommunik'),
(6, 'Handy-Lautsprecher & -Soundsys', 'Handys, Smartwatches, Kommunik'),
(5, 'Handy-Displayschutzfolien', 'Handys, Smartwatches, Kommunik'),
(4, 'Handys ohne Vertrag', 'Handys, Smartwatches, Kommunik'),
(3, 'Handy-Akkus', 'Handys, Smartwatches, Kommunik'),
(2, 'Handy-Ersatzteile', 'Handys, Smartwatches, Kommunik'),
(1, 'Handy-Taschen & -Schutzhüllen', 'Handys, Smartwatches, Kommunik');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `registeredOn` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `email`, `pass`, `registeredOn`) VALUES
(79, 'yukado@live.de', '496c6c6694e4ccf546519ef21bdeef4f74419567', '2017-07-09 23:34:03'),
(78, 'yusufkagandogruyol@gmail.com', '496c6c6694e4ccf546519ef21bdeef4f74419567', '2017-07-09 23:32:04');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user-details`
--

CREATE TABLE IF NOT EXISTS `user-details` (
  `userDetail_Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `userImage` text NOT NULL,
  PRIMARY KEY (`userDetail_Id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Daten für Tabelle `user-details`
--

INSERT INTO `user-details` (`userDetail_Id`, `user_id`, `username`, `mobile_no`, `address`, `gender`, `userImage`) VALUES
(17, 76, 'Yusuf Kagan Dogruyol', '1234567', 'Walter-Flex-Str.99, 65428 Ruessleheim', 'male', ''),
(18, 78, 'Yusuf Kagan Dogruyol', '1234567', 'agaydsagrydsg', 'male', ''),
(19, 79, 'Yusuf Kagan Dogruyol', '1234567', 'Walter Str.33 65754 weinheim', 'male', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
