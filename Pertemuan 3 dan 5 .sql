-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 06:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soal_petra`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_dengan_retur_tertinggi`
--

CREATE TABLE `barang_dengan_retur_tertinggi` (
  `Nama_Barang` varchar(255) NOT NULL,
  `Total_Retur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_dengan_retur_tertinggi`
--

INSERT INTO `barang_dengan_retur_tertinggi` (`Nama_Barang`, `Total_Retur`) VALUES
('Barang C', 15);

-- --------------------------------------------------------

--
-- Table structure for table `barang_dengan_stok_rendah`
--

CREATE TABLE `barang_dengan_stok_rendah` (
  `Nama_Barang` varchar(255) NOT NULL,
  `Jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_dengan_stok_rendah`
--

INSERT INTO `barang_dengan_stok_rendah` (`Nama_Barang`, `Jumlah`) VALUES
('Barang B', 30),
('Barang D', 20);

-- --------------------------------------------------------

--
-- Table structure for table `barang_terlaris`
--

CREATE TABLE `barang_terlaris` (
  `Nama_Barang` varchar(255) NOT NULL,
  `Total_Jumlah_Terjual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_terlaris`
--

INSERT INTO `barang_terlaris` (`Nama_Barang`, `Total_Jumlah_Terjual`) VALUES
('Barang A', 150);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_Penjualan` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `ID_Barang` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Total_Harga` decimal(10,2) NOT NULL,
  `ID_Pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_bulanan`
--

CREATE TABLE `penjualan_bulanan` (
  `Bulan` varchar(7) NOT NULL,
  `Jumlah_Transaksi` int(11) NOT NULL,
  `Total_Pendapatan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan_bulanan`
--

INSERT INTO `penjualan_bulanan` (`Bulan`, `Jumlah_Transaksi`, `Total_Pendapatan`) VALUES
('2024-09', 20, 3000000.00),
('2024-10', 15, 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `persediaan_barang`
--

CREATE TABLE `persediaan_barang` (
  `ID_Barang` int(11) NOT NULL,
  `Nama_Barang` varchar(255) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Harga_Satuan` decimal(10,2) NOT NULL,
  `Tanggal_Masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rata_rata_harga_penjualan`
--

CREATE TABLE `rata_rata_harga_penjualan` (
  `Nama_Barang` varchar(255) NOT NULL,
  `Rata_Rata_Harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rata_rata_harga_penjualan`
--

INSERT INTO `rata_rata_harga_penjualan` (`Nama_Barang`, `Rata_Rata_Harga`) VALUES
('Barang A', 15000.00),
('Barang B', 15000.00),
('Barang C', 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `rata_rata_penjualan_per_hari`
--

CREATE TABLE `rata_rata_penjualan_per_hari` (
  `Tanggal` date NOT NULL,
  `Rata_Rata_Penjualan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rata_rata_penjualan_per_hari`
--

INSERT INTO `rata_rata_penjualan_per_hari` (`Tanggal`, `Rata_Rata_Penjualan`) VALUES
('2024-09-01', 450000.00),
('2024-09-02', 600000.00),
('2024-09-03', 500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `retur_berdasarkan_pelanggan`
--

CREATE TABLE `retur_berdasarkan_pelanggan` (
  `ID_Pelanggan` int(11) NOT NULL,
  `Jumlah_Retur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retur_berdasarkan_pelanggan`
--

INSERT INTO `retur_berdasarkan_pelanggan` (`ID_Pelanggan`, `Jumlah_Retur`) VALUES
(1, 10),
(2, 5),
(3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `retur_penjualan`
--

CREATE TABLE `retur_penjualan` (
  `ID_Retur` int(11) NOT NULL,
  `ID_Penjualan` int(11) NOT NULL,
  `Tanggal_Retur` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Alasan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rincian_retur_penjualan`
--

CREATE TABLE `rincian_retur_penjualan` (
  `Nama_Barang` varchar(255) NOT NULL,
  `Jumlah_Retur` int(11) NOT NULL,
  `Alasan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rincian_retur_penjualan`
--

INSERT INTO `rincian_retur_penjualan` (`Nama_Barang`, `Jumlah_Retur`, `Alasan`) VALUES
('Barang A', 10, 'Barang cacat'),
('Barang B', 5, 'Salah ukuran'),
('Barang C', 15, 'Tidak sesuai pesanan');

-- --------------------------------------------------------

--
-- Table structure for table `total_penjualan_per_barang`
--

CREATE TABLE `total_penjualan_per_barang` (
  `Nama_Barang` varchar(255) NOT NULL,
  `Total_Jumlah` int(11) NOT NULL,
  `Total_Pendapatan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_penjualan_per_barang`
--

INSERT INTO `total_penjualan_per_barang` (`Nama_Barang`, `Total_Jumlah`, `Total_Pendapatan`) VALUES
('Barang A', 150, 2250000.00),
('Barang B', 100, 1500000.00),
('Barang C', 200, 3000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `total_retur_berdasarkan_tanggal`
--

CREATE TABLE `total_retur_berdasarkan_tanggal` (
  `Tanggal_Retur` date NOT NULL,
  `Total_Jumlah_Retur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_retur_berdasarkan_tanggal`
--

INSERT INTO `total_retur_berdasarkan_tanggal` (`Tanggal_Retur`, `Total_Jumlah_Retur`) VALUES
('2024-09-01', 10),
('2024-09-02', 5),
('2024-09-03', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_Penjualan`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indexes for table `persediaan_barang`
--
ALTER TABLE `persediaan_barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indexes for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD PRIMARY KEY (`ID_Retur`),
  ADD KEY `ID_Penjualan` (`ID_Penjualan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_Penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persediaan_barang`
--
ALTER TABLE `persediaan_barang`
  MODIFY `ID_Barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  MODIFY `ID_Retur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `persediaan_barang` (`ID_Barang`);

--
-- Constraints for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD CONSTRAINT `retur_penjualan_ibfk_1` FOREIGN KEY (`ID_Penjualan`) REFERENCES `penjualan` (`ID_Penjualan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
