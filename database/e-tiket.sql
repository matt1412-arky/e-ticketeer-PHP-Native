-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2021 at 09:47 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-tiket`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cat` int(11) NOT NULL,
  `nama_cat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cat`, `nama_cat`) VALUES
(1, 'Eksekutif'),
(2, 'Ekonomi'),
(3, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phone` decimal(20,0) NOT NULL,
  `gender` text NOT NULL,
  `username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `address`, `phone`, `gender`, `username`) VALUES
(1, 'test', 'Jl. Golek', '6285781571190', 'Laki-laki', 'test'),
(2, 'Matthew Christian', 'Jl. Golek', '6285781571190', 'Laki-laki', 'Matthew');

-- --------------------------------------------------------

--
-- Table structure for table `reserv`
--

CREATE TABLE `reserv` (
  `id_reserv` int(11) NOT NULL,
  `reserv_code` decimal(10,0) NOT NULL,
  `reserv_at` text NOT NULL,
  `reserv_date` date NOT NULL,
  `seat` decimal(10,0) NOT NULL,
  `depart` date NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_rute` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserv`
--

INSERT INTO `reserv` (`id_reserv`, `reserv_code`, `reserv_at`, `reserv_date`, `seat`, `depart`, `price`, `id_user`, `id_customer`, `id_rute`, `status`) VALUES
(1, '692538471', '2021-04-13', '2021-04-20', '38', '2021-04-27', '3500000', 1, 1, 1, 'Selesai'),
(2, '945723168', '2021-04-13', '2021-04-20', '9', '2021-04-27', '2500000', 1, 1, 5, 'Selesai'),
(3, '783915264', '2021-04-13', '2021-04-20', '21', '2021-04-20', '100000', 2, 2, 4, 'Selesai'),
(4, '823574619', '', '0000-00-00', '38', '2021-03-11', '3500000', 1, 1, 1, 'Proses');

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `depart` date NOT NULL,
  `rute_from` text NOT NULL,
  `rute_to` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `id_trans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`id_rute`, `depart`, `rute_from`, `rute_to`, `price`, `id_trans`) VALUES
(1, '2021-03-11', 'Jakarta', 'Bandung', '3500000', 2),
(2, '2021-04-09', 'Jakarta', 'Bandung', '1500000', 1),
(3, '2021-03-30', 'Jakarta', 'Bandung', '150000', 3),
(4, '2021-04-20', 'Jakarta', 'Bandung', '100000', 4),
(5, '2021-04-09', 'Jakarta', 'Bandung', '2500000', 5),
(6, '2021-04-02', 'Jakarta', 'Bandung', '1250000', 6);

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `id_trans` int(11) NOT NULL,
  `code` decimal(10,0) NOT NULL,
  `description` text NOT NULL,
  `seat` text NOT NULL,
  `id_trans_type` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`id_trans`, `code`, `description`, `seat`, `id_trans_type`, `id_cat`) VALUES
(1, '981754263', 'Garuda Indonesia Eko.', '70', 1, 2),
(2, '825374691', 'Garuda Indonesia Eks.', '38', 1, 1),
(3, '351468927', 'Blue Star', '43', 2, 3),
(4, '947135682', 'Argo Bromo', '250', 3, 3),
(5, '482356179', 'Lion Air Eks.', '70', 1, 1),
(6, '594718632', 'Lion Air Eko.', '154', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `type_trans`
--

CREATE TABLE `type_trans` (
  `id_trans_type` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_trans`
--

INSERT INTO `type_trans` (`id_trans_type`, `description`) VALUES
(1, 'Pesawat'),
(2, 'Bus'),
(3, 'Kereta');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `fullname`) VALUES
(1, 'test', '123', 'test'),
(2, 'Matthew', '123', 'Matthew Christian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `id_cat` (`id_cat`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `reserv`
--
ALTER TABLE `reserv`
  ADD PRIMARY KEY (`id_reserv`),
  ADD KEY `id_reserv` (`id_reserv`),
  ADD KEY `id_user` (`id_user`,`id_customer`,`id_rute`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_rute` (`id_rute`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`),
  ADD KEY `id_rute` (`id_rute`),
  ADD KEY `id_trans` (`id_trans`);

--
-- Indexes for table `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `id_trans` (`id_trans`),
  ADD KEY `id_trans_type` (`id_trans_type`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Indexes for table `type_trans`
--
ALTER TABLE `type_trans`
  ADD PRIMARY KEY (`id_trans_type`),
  ADD KEY `id_trans_type` (`id_trans_type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reserv`
--
ALTER TABLE `reserv`
  MODIFY `id_reserv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `id_rute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trans`
--
ALTER TABLE `trans`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type_trans`
--
ALTER TABLE `type_trans`
  MODIFY `id_trans_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reserv`
--
ALTER TABLE `reserv`
  ADD CONSTRAINT `reserv_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `reserv_ibfk_3` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`),
  ADD CONSTRAINT `reserv_ibfk_4` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Constraints for table `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_ibfk_1` FOREIGN KEY (`id_trans`) REFERENCES `trans` (`id_trans`);

--
-- Constraints for table `trans`
--
ALTER TABLE `trans`
  ADD CONSTRAINT `trans_ibfk_1` FOREIGN KEY (`id_trans_type`) REFERENCES `type_trans` (`id_trans_type`),
  ADD CONSTRAINT `trans_ibfk_2` FOREIGN KEY (`id_cat`) REFERENCES `category` (`id_cat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
