-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2022 at 07:54 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlyphonghoc`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `timphong` (IN `maphonghoc` INT)   SELECT * FROM phonghoc WHERE phonghoc.TenPH LIKE CONCAT('%',maphonghoc,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `xoaphong` (IN `maphonghoc` INT)   DELETE FROM phonghoc WHERE phonghoc.MaPH = maphonghoc$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bcsuachua`
--

CREATE TABLE `bcsuachua` (
  `MaSC` int(11) NOT NULL,
  `NoiDungSC` int(11) NOT NULL,
  `NgaysSC` int(11) NOT NULL,
  `MaTT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bctinhtrang`
--

CREATE TABLE `bctinhtrang` (
  `MaTT` int(10) NOT NULL,
  `NoiDungBC` varchar(200) NOT NULL,
  `NgayBC` text NOT NULL,
  `MaLTB` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bctinhtrang`
--

INSERT INTO `bctinhtrang` (`MaTT`, `NoiDungBC`, `NgayBC`, `MaLTB`) VALUES
(3, 'Su Dung Rat Toi', '7/11/2022', 3),
(4, 'Su Dung Rat On', '7/11/2022', 2);

-- --------------------------------------------------------

--
-- Table structure for table `loaithietbi`
--

CREATE TABLE `loaithietbi` (
  `MaLTB` int(10) NOT NULL,
  `TenLTB` varchar(50) NOT NULL,
  `NgayLap` text NOT NULL,
  `MaTB` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loaithietbi`
--

INSERT INTO `loaithietbi` (`MaLTB`, `TenLTB`, `NgayLap`, `MaTB`) VALUES
(2, 'Bàn phím 1', '30/1/20022', 6),
(3, 'Bàn Học 1', '20/4/2022', 4),
(8, 'May tinh', '20/1/2022', 4);

-- --------------------------------------------------------

--
-- Table structure for table `phonghoc`
--

CREATE TABLE `phonghoc` (
  `MaPH` int(10) NOT NULL,
  `TenPH` varchar(30) NOT NULL,
  `Tang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phonghoc`
--

INSERT INTO `phonghoc` (`MaPH`, `TenPH`, `Tang`) VALUES
(18, '202', '2'),
(20, '204', '2'),
(21, '205', '2'),
(25, '203', '2'),
(33, '101', '1'),
(34, '102', '1'),
(35, '103', '1'),
(36, '104', '1'),
(37, '105', '1'),
(38, '201', '2');

-- --------------------------------------------------------

--
-- Table structure for table `thietbi`
--

CREATE TABLE `thietbi` (
  `MaTB` int(10) NOT NULL,
  `TenTB` varchar(50) NOT NULL,
  `TenNhanHieu` varchar(30) NOT NULL,
  `SoLuong` int(10) NOT NULL,
  `MaPH` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thietbi`
--

INSERT INTO `thietbi` (`MaTB`, `TenTB`, `TenNhanHieu`, `SoLuong`, `MaPH`) VALUES
(1, 'Máy tính bàn', 'Samsung', 40, 18),
(3, 'Ghế', 'Duy Tân', 41, 33),
(4, 'Bàn Học', 'Duy Tân', 41, 33),
(5, 'Chuột', 'Logitech', 41, 33),
(6, 'Bàn phím', 'Logitech', 41, 33),
(7, 'Máy chiếu', 'EPSON', 1, 34),
(8, 'Bảng', 'NXBGDVN', 1, 34),
(9, 'Bảng', 'NXBGDVN', 1, 33),
(10, 'Điều hoà', 'Panasonic', 2, 33),
(11, 'Quạt', 'SENKO', 4, 33),
(12, 'Đèn Led', 'HALEDCO', 12, 33),
(13, 'Tai nghe', 'Logitech', 41, 33),
(14, 'Lót chuột', 'Logitech', 41, 33),
(16, 'Bàn', 'Duy Tân', 41, 37);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `Role` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `Role`) VALUES
(3, 'admin', 'admin', 'admin', 1),
(7, 'B1913281', 'Nguyen Hai Vuong', 'K', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bcsuachua`
--
ALTER TABLE `bcsuachua`
  ADD PRIMARY KEY (`MaSC`);

--
-- Indexes for table `bctinhtrang`
--
ALTER TABLE `bctinhtrang`
  ADD PRIMARY KEY (`MaTT`);

--
-- Indexes for table `loaithietbi`
--
ALTER TABLE `loaithietbi`
  ADD PRIMARY KEY (`MaLTB`);

--
-- Indexes for table `phonghoc`
--
ALTER TABLE `phonghoc`
  ADD PRIMARY KEY (`MaPH`);

--
-- Indexes for table `thietbi`
--
ALTER TABLE `thietbi`
  ADD PRIMARY KEY (`MaTB`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bcsuachua`
--
ALTER TABLE `bcsuachua`
  MODIFY `MaSC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bctinhtrang`
--
ALTER TABLE `bctinhtrang`
  MODIFY `MaTT` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loaithietbi`
--
ALTER TABLE `loaithietbi`
  MODIFY `MaLTB` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phonghoc`
--
ALTER TABLE `phonghoc`
  MODIFY `MaPH` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `thietbi`
--
ALTER TABLE `thietbi`
  MODIFY `MaTB` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
