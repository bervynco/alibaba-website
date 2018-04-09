-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 09, 2018 at 10:52 AM
-- Server version: 5.6.32-78.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hika2qh8_alibabachips`
--

-- --------------------------------------------------------

--
-- Table structure for table `body`
--

CREATE TABLE IF NOT EXISTS `body` (
  `id` int(11) NOT NULL,
  `overall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `name` text,
  `description` text,
  `image` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `body`
--

INSERT INTO `body` (`id`, `overall_id`, `content_id`, `name`, `description`, `image`, `timestamp`) VALUES
(1, 1, 1, 'Alibaba Corn Chips 1', '1', 'assets/img/logo/default/placeholder.png', '2018-02-12 04:24:00'),
(2, 1, 1, 'BNB Cornick 1', '2', 'assets/img/logo/default/placeholder.png', '2018-02-12 04:24:00'),
(3, 1, 1, 'BNB Green Peas1', '3', 'assets/img/logo/default/placeholder.png', '2018-02-12 04:24:00'),
(4, 1, 3, 'Vision', 'To start-up and establish a wide-ranging presence and set point of reference for a manufacturing company by implementing constant development in work standard to provide the utmost customer satisfaction, taking on-board the top and foremost course of action, quality and ethical standards, and establishing a long-term connection value, both to our internal and external customers as we deliver our products and services on time and on budget.', 'assets/img/logo/default/placeholder.png', '2018-02-04 16:14:15'),
(5, 1, 3, 'Mission', 'To start-up and establish a wide-ranging presence and set point of reference for a manufacturing company by implementing constant development in work standard to provide the utmost customer satisfaction, taking on-board the top and foremost course of action, quality and ethical standards, and establishing a long-term connection value, both to our internal and external customers as we deliver our products and services on time and on budget.', 'assets/img/logo/default/placeholder.png', '2018-02-04 16:14:15'),
(6, 1, 2, 'Raw Materials', 'Only selected finest corn, fresh from harvest is used to manufacture our products. We now produce 50,000 kg of sweet yellow corn and 20,000 kgs of white corn, daily.', 'assets/img/logo/default/placeholder.png', '2017-12-24 16:22:16'),
(7, 1, 2, 'Corn Cooking and Washing', 'Rice Husk is used as fuel to Boiler that would generate the heat required for Cooking. As responsible citizen of the planet, the company uses only ZERO Carbon Foot print fuel.', 'assets/img/logo/default/placeholder.png', '2017-12-24 16:22:16'),
(8, 1, 2, 'Packing and Storage', 'Warehouse Management is strictly enforced to sustain FIFO. Manually and carefully packed into bundles by highly skilled and trained workers.', 'assets/img/logo/default/placeholder.png', '2017-12-24 16:22:16'),
(9, 1, 2, 'Loading', NULL, 'assets/img/logo/default/placeholder.png', '2017-12-24 16:22:16'),
(13, 1, 1, 'Alibaba Cellphone Case', 'Nice phone La', '', '2018-02-12 04:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL,
  `telephone` text,
  `mobile` text,
  `email` text,
  `address` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `telephone`, `mobile`, `email`, `address`, `timestamp`) VALUES
(1, '+632 5422842 / +63 25422847', '+63 9178001968', 'fdsf_faam@yahoo.com', 'Rm 4-a 1409 Alvarado ext. Tondo, Manila', '2018-02-04 14:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL,
  `overall_id` int(11) NOT NULL,
  `title` text,
  `link` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `overall_id`, `title`, `link`, `timestamp`) VALUES
(1, 1, 'what we offer', 'products', '2017-12-24 15:55:52'),
(2, 1, 'how we do things', 'process', '2017-12-24 15:55:53'),
(3, 1, 'our vision', 'vision', '2017-12-24 15:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE IF NOT EXISTS `home` (
  `id` int(11) NOT NULL,
  `title` text,
  `body` text,
  `image` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`id`, `title`, `body`, `image`, `timestamp`) VALUES
(1, 'FRANK AND DAVID FOOD MANUFACTURING CORPORATION', 'Our company Frank and David Food Manufacturing Corporation is the maker of “Alibaba” Brand Corn chips and “Bawang na Bawang (BNB) Cornick and Green Peas.', 'assets/img/logo/default/placeholder.png', '2017-12-24 15:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `overall`
--

CREATE TABLE IF NOT EXISTS `overall` (
  `id` int(11) NOT NULL,
  `home_id` tinyint(4) DEFAULT NULL,
  `contact_id` tinyint(4) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `overall`
--

INSERT INTO `overall` (`id`, `home_id`, `contact_id`, `timestamp`, `active`) VALUES
(1, 1, 1, '2017-12-24 15:42:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `step`
--

CREATE TABLE IF NOT EXISTS `step` (
  `id` int(11) NOT NULL,
  `overall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `body_id` int(11) DEFAULT NULL,
  `name` text,
  `description` text,
  `image` text,
  `sub` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `step`
--

INSERT INTO `step` (`id`, `overall_id`, `content_id`, `body_id`, `name`, `description`, `image`, `sub`, `timestamp`) VALUES
(1, 1, 2, 6, NULL, NULL, NULL, '["Yellow Corn", "White Corn", "Palm Oil / Coco Oil", "Garlic", "Green Peas", "Lime", "Flavorings"]', '2018-01-03 15:42:19'),
(2, 1, 2, 7, NULL, 'Corn is cooked together with lime,  to gelatinize its starch , remove the corn skin and sanitized using lime. It is then washed to clean ready for grinding corn.', 'assets/img/logo/default/placeholder.png', NULL, '2018-01-03 06:48:59'),
(3, 1, 2, 7, 'Sheeter', NULL, 'assets/img/logo/default/placeholder.png', '["Line 1: 1,000 KG/HOUR", "Line 1: 1,200 KG/HOUR"]', '2018-01-03 15:42:19'),
(4, 1, 2, 7, 'Frier', 'German Brand: Burner', 'assets/img/logo/default/placeholder.png', '["Fully Automated", "Horizontal Burner", "Fuel: LPG"]', '2018-01-03 15:42:19'),
(5, 1, 2, 8, 'Small Packing Machine', '120 Units', 'assets/img/logo/default/placeholder.png', '["Packing Capacity: 120 units X 50packs/hr = 6000 packs / hour", "Precision Technology"]', '2018-01-03 15:41:38'),
(6, 1, 2, 8, 'Ishida Weigher', '10 Units', 'assets/img/logo/default/placeholder.png', '["Packing Capacity: 60packs / hr x 10 units = 600 pack / hour", "Horizontal Burner", "Fully Automated", "Highly Reliable Machine", "99.99% Weight Accuracy"]', '2018-01-03 15:41:38'),
(7, 1, 2, 9, 'Loading', 'Loading is done systematically, to preserve products and  achieve OTIF at all times.', 'assets/img/logo/default/placeholder.png', NULL, '2018-01-03 06:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `sub`
--

CREATE TABLE IF NOT EXISTS `sub` (
  `id` int(11) NOT NULL,
  `overall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `detail` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub`
--

INSERT INTO `sub` (`id`, `overall_id`, `content_id`, `body_id`, `step_id`, `detail`, `timestamp`) VALUES
(1, 1, 2, 8, 6, 'Packing Capacity: 60packs / hr x 10 units = 600 pack / hour', '2018-01-03 07:58:10'),
(2, 1, 2, 8, 6, 'Horizontal Burner', '2018-01-03 07:58:10'),
(3, 1, 2, 8, 6, 'Fully Automated', '2018-01-03 07:58:10'),
(4, 1, 2, 8, 6, 'Highly Reliable Machine', '2018-01-03 07:58:10'),
(5, 1, 2, 8, 6, '99.99% Weight Accuracy', '2018-01-03 07:58:10'),
(6, 1, 2, 8, 5, 'Packing Capacity: 120 units X 50packs/hr = 6000 packs / hour', '2018-01-03 08:24:25'),
(7, 1, 2, 8, 5, 'Precision Technology', '2018-01-03 08:24:25'),
(8, 1, 2, 7, 4, 'Fully Automated', '2018-01-03 08:25:41'),
(9, 1, 2, 7, 4, 'Horizontal Burner', '2018-01-03 08:25:41'),
(10, 1, 2, 7, 4, 'Fuel: LPG', '2018-01-03 08:25:41'),
(11, 1, 2, 7, 3, 'Line 1: 1,000 KG/HOUR', '2018-01-03 08:26:08'),
(12, 1, 2, 7, 3, 'Line 1: 1,200 KG/HOUR', '2018-01-03 08:26:08'),
(13, 1, 2, 6, 1, 'Yellow Corn', '2018-01-03 08:28:13'),
(14, 1, 2, 6, 1, 'White Corn', '2018-01-03 08:28:13'),
(15, 1, 2, 6, 1, 'Palm Oil / Coco Oil', '2018-01-03 08:28:13'),
(16, 1, 2, 6, 1, 'Garlic', '2018-01-03 08:28:13'),
(17, 1, 2, 6, 1, 'Green Peas', '2018-01-03 08:28:13'),
(18, 1, 2, 6, 1, 'Lime', '2018-01-03 08:28:13'),
(19, 1, 2, 6, 1, 'Flavorings', '2018-01-03 08:28:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `body`
--
ALTER TABLE `body`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overall`
--
ALTER TABLE `overall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `step`
--
ALTER TABLE `step`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub`
--
ALTER TABLE `sub`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `body`
--
ALTER TABLE `body`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `overall`
--
ALTER TABLE `overall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sub`
--
ALTER TABLE `sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
