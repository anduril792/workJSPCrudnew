-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-08-08 10:18:47
-- 伺服器版本: 10.1.24-MariaDB
-- PHP 版本： 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `test`;

-- --------------------------------------------------------

--
-- 資料表結構 `article`
--

CREATE TABLE `article` (
  `idarticle` int(12) NOT NULL,
  `libelle` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `qte` int(10) NOT NULL,
  `img` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `article`
--

INSERT INTO `article` (`idarticle`, `libelle`, `description`, `prix`, `category`, `qte`, `img`) VALUES
(15, '測試四', 'DGW', 234, 'BOSTON', 3, 'images/null'),
(24, 'dag', 'oudiu', 112312, 'BOSTON', 46, 'images/02330-01.jpg'),
(25, '測試三', '測試', 123, 'SHOULDER', 213, 'images/12710-05.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `msg`
--

CREATE TABLE `msg` (
  `idMsg` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `msg`
--

INSERT INTO `msg` (`idMsg`, `name`, `email`, `subject`, `message`) VALUES
(3, '測試', 'asd@asd', '測試', '測試');

-- --------------------------------------------------------

--
-- 資料表結構 `register`
--

CREATE TABLE `register` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `register`
--

INSERT INTO `register` (`id`, `name`, `password`, `email`, `sex`, `country`) VALUES
(17, 'arun', 'kumar', 'arun@gmail.com', 'Male', 'India'),
(19, 'sfdsaf', 'jaiswal', 'sonoo@javatpoint.com', 'female', 'India'),
(20, 'Ashok', 'ashok', 'ashok@javatpoint.com', 'male', 'India'),
(25, 'wang', '123', '123@asd', 'male', 'India'),
(28, '王', '123', '123@123', 'male', 'India'),
(48, '陳', '123', '123@123', 'male', 'India'),
(50, 'samtest', '12345', '123@123', 'female', 'India'),
(51, 'lksjglskjg', '12345', 'fdsf@sfaf', 'male', 'India'),
(52, 'sddsag', 'qwert', '123@ldskfjlgdsk', 'male', 'Berma'),
(53, 'SDF', '1234', '123@sdfa', 'male', 'India'),
(54, 'SDF', '12345', '123@sdfa', 'male', 'India'),
(55, 'sdaflkjl', '123', 'safd@sdfklh', 'male', 'Other'),
(56, 'tom', '123', '213@123', 'male', 'India'),
(57, 'sam', '123', '123@123', 'male', 'India');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`idarticle`);

--
-- 資料表索引 `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`idMsg`);

--
-- 資料表索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `idarticle` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用資料表 AUTO_INCREMENT `msg`
--
ALTER TABLE `msg`
  MODIFY `idMsg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
