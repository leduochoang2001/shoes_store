-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 02:35 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoe_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `uname` varchar(60) DEFAULT NULL,
  `passwd` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `uname`, `passwd`, `name`, `phone`, `email`) VALUES
(1, 'phuite6', 'ite6phu', 'phu', '0333333333', 'phuite6@gmail.com'),
(2, 'hoangite6', 'ite6hoang', 'hoang', '0333333335', 'hoangite6@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandID` int(11) NOT NULL,
  `brand_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandID`, `brand_name`) VALUES
(1, 'DUCA DI MORRONE'),
(2, 'ADIDAS'),
(3, 'KATE SPADE'),
(4, 'KENZO'),
(5, 'WHOAU'),
(6, 'SKECHERS'),
(7, 'MLB KOREA');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `cate_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `cate_name`) VALUES
(1, 'men'),
(2, 'women'),
(3, 'unisex'),
(4, 'kid');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `name`, `phone`, `email`, `address`) VALUES
(1, 'khiem', '0334445555', 'khiemite6@gmail.com', 'thai binh'),
(2, 'phuc', '0334445556', 'phucite6@gmail.com', 'hung yen'),
(3, 'minh', '0334445557', 'minhvu@gmail.com', 'thai binh');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `orderID` int(11) NOT NULL,
  `shoeID` int(11) NOT NULL,
  `sizeID` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`orderID`, `shoeID`, `sizeID`, `amount`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 3, 4, 1),
(4, 5, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoe`
--

CREATE TABLE `shoe` (
  `shoeID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brandID` int(11) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `imagePath` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoe`
--

INSERT INTO `shoe` (`shoeID`, `name`, `brandID`, `categoryID`, `price`, `sale`, `color`, `imagePath`) VALUES
(1, 'Duca Di Morrone Suede Men\'s Shoes-Brown', 1, 1, '99.85', 37, 'brown', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-tay-nam-duca-di-morrone-da-lon-pvn774-mau-nau-6396d723a69ac-12122022142419.png'),
(2, 'Duca Di Morrone Suede Men\'s Shoes-Gray ', 1, 1, '107.04', 45, 'gray', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-tay-nam-duca-di-morrone-605_camoscio_tortora-da-lon-mau-xam-63969b39a5daa-12122022100841.png'),
(3, 'Adidas Adizero Adios 6 M H67509 Men\'s Running Shoes', 2, 1, '148.08', 50, 'black', 'https://admin.thegioigiay.com/upload/product/2022/11/giay-chay-bo-nam-adidas-adizero-adios-6-m-h67509-637af0f644dc8-21112022103102.jpg'),
(4, 'Adidas AlphaBounce EK Marathon Red GW2267 Sneakers', 2, 1, '110.00', 25, 'red', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-the-thao-adidas-alphabounce-ek-marathon-red-gw2267-mau-do-639c204478445-16122022143740.jpg'),
(5, 'Kate Spade New York Phoebe Ballet Flat Shoes-Red', 3, 2, '126.93', 27, 'red', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-bet-kate-spade-new-york-phoebe-ballet-mau-do-63915a19deffb-08122022102929.jpg'),
(6, 'Kate Spade New York Phoebe Ballet Flat Shoes-Black', 3, 2, '112.12', 17, 'black', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-bet-kate-spade-new-york-phoebe-black-mau-den-6391590ea4e20-08122022102502.jpg'),
(7, 'Slip On Kenzo Tiger Espadrille Shoes-Charcoal Green', 4, 2, '220.00', 8, 'charcoal green', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-slip-on-kenzo-tiger-espadrille-mau-xanh-than-638d5cf406b7e-05122022095236.jpg'),
(8, 'WHOAU WHPGC2121A Sneakers-White', 5, 3, '67.70', 34, 'white', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-sneakers-whoau-whpgc2121a-mau-trang-63915f9a7146f-08122022105258.jpg'),
(9, 'WHOAU WHPGC2121A Sneakers-Black', 5, 3, '67.70', 34, 'black', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-sneakers-whoau-whpgc2121a-mau-den-63915ed436f9c-08122022104940.jpg'),
(10, 'Skechers Casual D\'Lites 4.0 Sneakers-White Black', 6, 3, '96.90', 12, 'white black', 'https://admin.thegioigiay.com/upload/product/2022/12/giay-the-thao-skechers-casual-d-lites-4-0-mau-den-trang-638ac58592e00-03122022104157.jpg'),
(11, 'MLB Chunky Liner High San Francisco 3ASXCB12N-14ORL Sneakers-White Yellow', 7, 4, '165.00', 14, 'white yellow', 'https://admin.thegioigiay.com/upload/product/2022/11/giay-the-thao-mlb-chunky-liner-high-san-francisco-3asxcb12n-14orl-mau-trang-vang-637c468a7f229-22112022104826.jpg'),
(12, 'MLB Chunky Classic La Dodgers 3ASXXA11N-07INS Shoes-White', 7, 4, '135.40', 19, 'white', 'https://admin.thegioigiay.com/upload/product/2022/11/giay-mlb-chunky-classic-la-dodgers-3asxxa11n-07ins-mau-trang-637c83e46492c-22112022151012.jpg'),
(13, 'MLB Big Ball Chunky Light New York Yankees 7ASHC312N-50BKL Sneakers-White Black', 7, 4, '105.78', 24, 'white black', 'https://admin.thegioigiay.com/upload/product/2022/11/giay-the-thao-tre-em-mlb-big-ball-chunky-light-new-york-yankees-7ashc312n-50bkl-mau-den-trang-637b220af2aec-21112022140026.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shoe_order`
--

CREATE TABLE `shoe_order` (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `pay_method` int(11) DEFAULT NULL,
  `totalMoney` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoe_order`
--

INSERT INTO `shoe_order` (`orderID`, `customerID`, `orderDate`, `pay_method`, `totalMoney`) VALUES
(1, 1, '2022-12-10', 1, NULL),
(2, 2, '2022-12-11', 1, NULL),
(3, 2, '2022-12-11', 1, NULL),
(4, 3, '2022-12-12', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shoe_storage`
--

CREATE TABLE `shoe_storage` (
  `shoeID` int(11) NOT NULL,
  `sizeID` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoe_storage`
--

INSERT INTO `shoe_storage` (`shoeID`, `sizeID`, `amount`) VALUES
(1, 1, 2),
(1, 2, 0),
(1, 3, 2),
(1, 4, 2),
(1, 5, 1),
(1, 6, 2),
(1, 7, 3),
(1, 8, 2),
(2, 1, 2),
(2, 2, 0),
(2, 3, 1),
(2, 4, 2),
(2, 5, 1),
(2, 6, 2),
(2, 7, 3),
(2, 8, 3),
(3, 1, 2),
(3, 2, 1),
(3, 3, 1),
(3, 4, 2),
(3, 5, 1),
(3, 6, 2),
(3, 7, 3),
(3, 8, 3),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(4, 4, 2),
(4, 5, 1),
(4, 6, 2),
(4, 7, 3),
(4, 8, 3),
(5, 1, 1),
(5, 2, 2),
(5, 3, 1),
(5, 4, 2),
(5, 5, 1),
(5, 6, 2),
(5, 7, 3),
(5, 8, 3),
(6, 1, 1),
(6, 2, 2),
(6, 3, 2),
(6, 4, 2),
(6, 5, 1),
(6, 6, 2),
(6, 7, 3),
(6, 8, 3),
(7, 1, 1),
(7, 2, 2),
(7, 3, 2),
(7, 4, 2),
(7, 5, 3),
(7, 6, 2),
(7, 7, 1),
(7, 8, 3),
(8, 1, 3),
(8, 2, 2),
(8, 3, 2),
(8, 4, 2),
(8, 5, 2),
(8, 6, 2),
(8, 7, 1),
(8, 8, 3),
(9, 1, 3),
(9, 2, 2),
(9, 3, 3),
(9, 4, 2),
(9, 5, 2),
(9, 6, 2),
(9, 7, 1),
(9, 8, 3),
(10, 1, 3),
(10, 2, 2),
(10, 3, 3),
(10, 4, 2),
(10, 5, 2),
(10, 6, 2),
(10, 7, 1),
(10, 8, 3),
(11, 1, 2),
(11, 2, 2),
(11, 3, 3),
(11, 4, 2),
(11, 5, 2),
(11, 6, 2),
(11, 7, 1),
(11, 8, 1),
(12, 1, 2),
(12, 2, 2),
(12, 3, 3),
(12, 4, 2),
(12, 5, 2),
(12, 6, 2),
(12, 7, 1),
(12, 8, 1),
(13, 1, 2),
(13, 2, 3),
(13, 3, 2),
(13, 4, 2),
(13, 5, 2),
(13, 6, 2),
(13, 7, 3),
(13, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `sizeID` int(11) NOT NULL,
  `sval` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`sizeID`, `sval`) VALUES
(1, 36),
(2, 37),
(3, 38),
(4, 39),
(5, 40),
(6, 41),
(7, 42),
(8, 43);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucherID` int(11) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`orderID`,`shoeID`,`sizeID`),
  ADD KEY `shoeID` (`shoeID`),
  ADD KEY `sizeID` (`sizeID`);

--
-- Indexes for table `shoe`
--
ALTER TABLE `shoe`
  ADD PRIMARY KEY (`shoeID`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `brandID` (`brandID`);

--
-- Indexes for table `shoe_order`
--
ALTER TABLE `shoe_order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `shoe_storage`
--
ALTER TABLE `shoe_storage`
  ADD PRIMARY KEY (`shoeID`,`sizeID`),
  ADD KEY `sizeID` (`sizeID`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`sizeID`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shoe`
--
ALTER TABLE `shoe`
  MODIFY `shoeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shoe_order`
--
ALTER TABLE `shoe_order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `sizeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucherID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `shoe_order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`shoeID`) REFERENCES `shoe` (`shoeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`sizeID`) REFERENCES `size` (`sizeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoe`
--
ALTER TABLE `shoe`
  ADD CONSTRAINT `shoe_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoe_ibfk_2` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoe_order`
--
ALTER TABLE `shoe_order`
  ADD CONSTRAINT `shoe_order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoe_storage`
--
ALTER TABLE `shoe_storage`
  ADD CONSTRAINT `shoe_storage_ibfk_1` FOREIGN KEY (`shoeID`) REFERENCES `shoe` (`shoeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoe_storage_ibfk_2` FOREIGN KEY (`sizeID`) REFERENCES `size` (`sizeID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
