-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 26, 2024 at 11:30 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spotify_clone`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `song_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `song_id` (`song_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `song_id`) VALUES
(1, 2),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE IF NOT EXISTS `songs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `song_name`, `file_path`, `artist`) VALUES
(2, 'Blue Sky', '1727325363208.mp3', 'Hale'),
(3, 'Sunday Morning', '1727329773627.mp3', 'Maroon 5'),
(4, 'Every Breath You Take', '1727348513480.mp3', 'The Police'),
(5, 'Bumalik Ka Na Sa \'Kin', '1727348578993.mp3', 'Silent Sanctuary'),
(6, 'Heaven Knows', '1727348621088.mp3', 'Orange & Lemon'),
(7, 'I Won\'t Give Up', '1727348667104.mp3', 'Jason Mraz'),
(8, 'Someone To You', '1727348703946.mp3', 'Banners'),
(9, 'We Found Love', '1727348730209.mp3', 'Rihanna'),
(10, 'Ligaya', '1727349941156.mp3', 'Eraserheads'),
(11, 'Comethru', '1727349989017.mp3', 'Jeremy Zucker');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
