-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2017-08-16 13:34:35
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
(24, 'dag', 'oudiu', 112312, 'BOSTON', 46, 'images/02330-01.jpg'),
(25, '測試三', '測試', 123, 'SHOULDER', 213, 'images/12710-05.jpg'),
(26, 'sdaf', 'sdaf', 123, 'BOSTON', 3, 'images/12710-05.jpg'),
(27, 'dsadsf', 'sadf', 1243124, 'BOSTON', 34, 'images/24212-03.jpg'),
(28, 'sa', 'sada', 123, 'BOSTON', 12, 'images/null'),
(29, 'sf', 'sad', 123, 'BOSTON', 123, 'images/null'),
(30, 'sf', 'ew', 12, 'BOSTON', 12, 'images/null'),
(31, 'sdf', '123', 3, 'BOSTON', 3, 'images/null'),
(32, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(33, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(34, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(35, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(36, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(37, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(38, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null'),
(39, 'sfdsf', 'qr', 123, 'BOSTON', 4, 'images/null');

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
-- 資料表結構 `orderitem`
--

CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `buynum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `orderitem`
--

INSERT INTO `orderitem` (`order_id`, `product_id`, `buynum`) VALUES
('0fd69e04-0cb4-40d4-a773-4319da00e10e', '55541', 1),
('2626f210-7965-4f20-af5e-8f57df02a60e', '01237', 3),
('50555c9e-45d0-4d77-b57f-f1ca7071dcd3', '03600', 1),
('b82f86b8-2475-4f23-b36e-050ad23f133c', '55541', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `orders`
--

INSERT INTO `orders` (`id`, `money`, `receiverAddress`, `receiverName`, `receiverPhone`, `paystate`, `ordertime`, `user_id`) VALUES
('0fd69e04-0cb4-40d4-a773-4319da00e10e', 10400, 'jspoj', '124124234', '124321412414', 0, '2017-08-09 12:13:37', 57),
('2626f210-7965-4f20-af5e-8f57df02a60e', 35700, 'sdfsfd', 'asasfasf', 'sdfsdfsdf', 0, '2017-08-09 12:16:42', 57),
('50555c9e-45d0-4d77-b57f-f1ca7071dcd3', 6000, 'iuhiuh', 'oijij', 'huh', 0, '2017-08-09 10:44:53', 57),
('b82f86b8-2475-4f23-b36e-050ad23f133c', 10400, '123', '123', '123', 0, '2017-08-09 10:46:14', 57),
('fe2aabf5-b140-4e1e-be6f-d63d01eabbbc', 17900, 'kjhk', 'iououooi', 'iouopiu', 0, '2017-08-09 10:07:20', 57);

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `id` varchar(100) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category`, `pnum`, `img_url`, `description`) VALUES
('01237', 'HUNTER', 11900, 'BOSTON', 9, 'images/24212-03.jpg', '  高品質指標的INVISTA社CORDURA®brand fabric所特別生產的MASTERTEX-04使用縱線500d、橫線840d的特殊尼龍線，磨擦、撕裂及割損等耐耗損強度皆通過CORDURA®brand fabric的檢驗標準。內側以PU防水加工及壓合夾入特殊透濕薄膜L-VENT®，提高材質本身的防水性，並另外貼合TRICOT NYLON成為一布三層構造，此特殊布料為MSPC PRODUCT獨家開發特殊MASTERTEX尼龍可耐水壓達20,000m/m的防水機能。底部素材使用較通常尼龍高出約5倍耐耗損、耐撕裂強度的INVISTA社CORDURA® 1680d Ballistic尼龍，裏層施以PVC加工以提升面料的抗潑水特性。附屬皮料均於染色時加入防水劑以提升撥水機能。全系列以MSPC PRODUCT原創的LOW TECH扣具作為系列識別，經典之一的HUNT系列以全新的科技撥水素材重新打造！'),
('03600', 'OVER', 6000, 'BOSTON', 6, '03600-d1.jpg', '本體素材使用較一般應用於輪胎簾布層(tire cord)的1000d強力尼龍線更堅固耐用的超強力尼龍線 – BEATTEX；簾布層是生成輪胎的骨架中重要一環，其被厚重的硫化橡膠包圍，為輪胎強度的依據並提供耐重、耐衝擊、散熱、抗疲勞程度等功能，為廣泛應用的強力素材。此種素材普遍僅應用於工業用途且染色困難，此回特別訂製的BEATTEX經特殊染色製成經典OVER ver.6，搭配鮮明突出的天然牛麂皮拼接細節，為從用料為根本，全面升級的OVER Series！'),
('123123', 'asdfs', 123, 'TOTE', 2, 'images/12710-05.jpg', 'dsaglksf'),
('12602', 'TIGHT', 9300, 'TOTE', 43, '12602-d1.jpg', '本體使用縱系1260d 橫系630d的強撚高密度尼龍使整體面料更加細緻平滑兼具有良好的張力，表面施加抗撥水處理提升其撥水及抗污機能。附屬布料則使用縱系消光尼龍線絲與橫系光澤線絲混紡，因2種不同光澤之尼龍線絲交織使布料呈現深度飽和之光澤；經抗撥水加工的CORDURA® 610d fabric 聚脂纖維100%更提供良好的抗磨損及撥水性。附屬皮革以日本國產牛皮以天然植物丹寧酸鞣製，並將染料與油脂混合進行染色，後以熨燙加工提升皮革亮澤感與平滑手感，為喜好日常用休閒包款的朋友提供新的選擇的上品系列！'),
('2003', 'test', 90, 'MESSENGER', 7, NULL, NULL),
('2004', 'test2', 80, 'SHOULDER', 8, NULL, NULL),
('2005', 'test3', 300, 'WAIST', 5, NULL, NULL),
('24114', 'LEAP', 17900, 'BOSTON', 19, '24114-d1.jpg', '本體使用之北美產天然牛皮革經鉻鞣製後於染色時以染料與單寧酸混合進行處理保有皮革原有厚實質感，並置於滾筒內浸以油脂與單寧酸一夜使厚實的皮革變得柔軟，再次以大量油脂塗於表層更使皮革呈現透明高級感。附屬皮料使用通過JES（日本皮革技術協会）13種有害物質檢査表準，成品絕不包含所有對人體有害物質及六價鉻等化學成分，採植物單寧鞣製之環保製程牛皮。更使用較耗時的內縫工法表現整體柔軟的質感，全包款以單一色調統一，搭配原創的復古壓釦與拉鍊五金，強調細節質感，復古與成熟風格為重點的休閒包款。'),
('55541', 'SLICK', 10400, 'BOSTON', 7, '55541-d1.jpg', '本體布料使用600d聚脂纖維為基底，並以德國製的樹脂及義大利製的離型紙(release paper)一同加工而成的全新高耐久素材；獨特類橡膠的手感與傳統的覆膜技術布料相比高出2~3倍的透氣性及加水分解耐久度，也提升了表面劣化抗久性。此素材於製造時減少使用造成大氣污染主因的溶劑VOC(揮發性有機化合物)，排放之廢水也考量環境永續經營而降低污染，為顧及企業社會責任與科技發展之新型面料。附屬布料則使用經INVISTA公司所生產之高強度Ballistic® fabric 1680d 尼龍，無論耐磨擦、耐割損、耐耗損強度均為一般尼龍5倍以上強度，且布料內層覆合之PVC塗層加工更是大大提升其撥水機能。系列包款更特別設計尼龍編織繩以便全系列包款互相結合穿掛。附屬皮革為通過日本皮革技術協會認定13種有害物質檢查 (JES) 標準，成品絕不含對人體、環境有害之六價鉻等重金屬與物質僅使用雙重單寧酸鞣製的天然環保皮革，為科技機能感又兼具環保概念的全分為多功能系列。'),
('82379014', '123123', 123123142, 'BOSTON', 84, 'images/12710-05.jpg', 'sdafjij'),
('9298t97', 'viuheigw', 123, 'TOTE', 2, 'images/24212-03.jpg', 'dsaglksf');

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
(57, 'sam', '123', '123@123', 'male', 'India'),
(63, 'adsfoiu', '321', 'sdflkj@so', 'male', 'India'),
(64, 'woeiru', '123', '123@123', 'male', 'India'),
(65, '0921840', '321', '321@3213', 'female', 'India');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `PASSWORD` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `introduce` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `activeCode` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `role` varchar(10) CHARACTER SET latin1 DEFAULT 'normal',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`id`, `username`, `PASSWORD`, `gender`, `email`, `telephone`, `introduce`, `activeCode`, `state`, `role`, `registTime`) VALUES
(3, 'ccc', '111', NULL, 'ccc@yam.com', '12341234', 'hihi', 'a5f1970a-22d5-4d5d-9453-505ca39d1bde', 1, 'normal', '2017-08-09 09:09:20'),
(4, 'ddd', '123123', 'Female', 'ddd@yam.com', '12341234', 'hihi', '9a2f028a-4b30-4dfe-9dfa-668cae4d5c66', 0, 'normal', '2017-07-31 16:46:08'),
(5, 'eee', '222', 'Male', 'eee@yahoo.com', '222', 'hello', 'c3e92c4a-3b41-4140-905d-be703674a854', 0, 'normal', '2017-07-31 16:49:00'),
(6, 'fff', '333', 'Male', 'jadunehudu@storj99.top', '333', 'lihao', '0580dbd5-6bfc-47e7-bb36-2a15ecd93a0b', 0, 'normal', '2017-07-31 16:49:40'),
(7, 'ggg', '123123', 'Male', 'ggg@yam.com', '44441111', 'nihao', '2ec9753a-16ec-468d-86da-50d8167182d1', 0, 'normal', '2017-08-02 00:58:06'),
(8, 'ssssss', '123', 'Male', 'bbb@yam.com', '2222', 'ss', 'a556b4e7-99a2-4fa1-9f62-cec4594466a6', 0, 'normal', '2017-08-05 15:30:21'),
(9, 'qqq', '111', 'Male', 'qqq@163.com', '11111111', 'qqq', 'c82fcd5f-d1e2-4635-9e7f-fc80ee64e678', 0, 'normal', '2017-08-06 14:35:37'),
(10, 'jad', '123', 'Female', 'jadunehudu@storj99.top', '123', '123', 'b8b1e1ab-c314-40c2-88af-b43cf7717595', 0, 'normal', '2017-08-06 15:27:03'),
(11, 'vvvvv', '1', 'Male', 'bbsb@yam.com', '11221122', '', 'c9359470-48db-43f2-91c8-673d4f5dda0b', 0, 'normal', '2017-08-06 19:35:42'),
(12, 'rr', '111', 'Male', 'rbb@yam.com', '12121212', '', 'dabac5eb-d779-4309-9509-85ae44aebbcc', 0, 'normal', '2017-08-06 20:07:38'),
(13, 's', '', 'Male', 'jau@storj99.top', '11221122', '', '3a1d3c93-9fe1-470e-b724-f5c4fb837104', 0, 'normal', '2017-08-06 20:10:16'),
(14, 'qqq', '111', 'Male', 'bbsb@yam.com', '', '', NULL, 0, 'normal', '2017-08-06 21:42:08'),
(15, 'qqq', '111', 'Male', 'bbsqqb@yam.com', '', '', NULL, 0, 'normal', '2017-08-06 21:42:27'),
(16, 'qqqqqq', '111', 'Male', 'bbssb@yam.com', '', '', NULL, 0, 'normal', '2017-08-06 22:04:32'),
(17, 'qqqqqq', '222', 'Male', 'bbsasb@yam.com', '', '', NULL, 0, 'normal', '2017-08-06 22:06:55'),
(18, 'wwwww', '111', 'Male', 'awwwbc@yahoo.com.tw', '11111111', '1', NULL, 0, 'normal', '2017-08-06 22:07:25'),
(19, 'qqaa', '1111', 'Male', 'aqb@yam.com', '', '', NULL, 0, 'normal', '2017-08-06 22:25:29'),
(20, 'tyt', '1234', 'Male', 'bbddb@yam.com', '123', 'tyt', NULL, 0, 'normal', '2017-08-09 07:22:40');

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
-- 資料表索引 `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `idarticle` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用資料表 AUTO_INCREMENT `msg`
--
ALTER TABLE `msg`
  MODIFY `idMsg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用資料表 AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- 資料表的 Constraints `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
