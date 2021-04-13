-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2021 at 11:49 AM
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
-- Database: `spppamuji`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cekLoginPetugas` (`uname` VARCHAR(100), `pass` VARCHAR(100))  BEGIN
	SELECT * FROM petugas
	    WHERE username = uname AND PASSWORD=pass;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cekLoginSiswa` (`nis_` VARCHAR(100), `pass` VARCHAR(100))  BEGIN
	SELECT * 
	    FROM siswa
	    WHERE nis = nis_ and password=pass;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `levelPetugas` (`uname` VARCHAR(100), `pass` VARCHAR(100))  BEGIN
	SELECT * 
	    FROM petugas
	    WHERE username = uname and password=pass;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampilData` (`tabel` VARCHAR(50), `kolom` VARCHAR(50))  BEGIN
	declare tab varchar(50);
	set tab= tabel;
SELECT * FROM tab order by kolom desc;
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `kompetensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(1, 'X - RPL 1', 'Rekayasa Perangkat Lunak'),
(2, 'X - RPL 2', 'Rekayasa Perangkat Lunak'),
(3, 'XI - RPL 1', 'Rekayasa Perangkat Lunak'),
(4, 'XI - RPL 2', 'Rekayasa Perangkat Lunak'),
(5, 'XII - RPL 1', 'Rekayasa Perangkat Lunak'),
(6, 'XII - RPL 2', 'Rekayasa Perangkat Lunak'),
(7, 'X - TKJ 1', 'Teknik Komputer dan Jaringan'),
(8, 'X - TKJ 2', 'Teknik Komputer dan Jaringan'),
(9, 'XI - TKJ 1', 'Teknik Komputer dan Jaringan'),
(10, 'XI - TKJ 2', 'Teknik Komputer dan Jaringan'),
(11, 'XII - TKJ 1', 'Teknik Komputer dan Jaringan'),
(12, 'XII  - TKJ 2', 'Teknik Komputer dan Jaringan'),
(13, 'X - MM 1', 'MultiMedia'),
(14, 'X - MM 2', 'MultiMedia'),
(15, 'XI - MM 1', 'MultiMedia'),
(16, 'XI - MM 2', 'MultiMedia'),
(17, 'XII - MM 1', 'MultiMedia'),
(18, 'XII - MM 2', 'MultiMedia');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` varchar(10) NOT NULL,
  `tahun_dibayar` int(11) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_dibayar`, `id_spp`, `jumlah_bayar`) VALUES
(2, 2, '0039130191', '2020-11-20', 'November', 2020, 17, 300000),
(20, 1, '0039130191', '2021-04-06', 'Maret', 2021, 17, 150000),
(21, 3, '0032072148', '2021-03-10', 'Februari', 2021, 17, 300000),
(22, 1, '0032072148', '2021-01-12', 'September', 2021, 17, 150000),
(23, 2, '0039130191', '2021-04-08', 'Januari', 2021, 17, 300000);

--
-- Triggers `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `update_total_spp` AFTER INSERT ON `pembayaran` FOR EACH ROW BEGIN
UPDATE spp SET nominal= nominal+ NEW.jumlah_bayar WHERE id_spp= NEW.id_spp;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_petugas` varchar(100) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'Aziz123', '77f96d74d75182a5a4fa205443bbc7e0', 'Aziz_admin', 'admin'),
(2, 'Fikri123', '19da9ebef1ca88a6cb3ffcb997054199', 'Fikri_petugas', 'petugas'),
(3, 'Pamuji123', '3c0a2293762b0cc98a9e578c46e37b27', 'Pamuji_admin', 'admin'),
(4, 'petugas', '570c396b3fc856eceb8aa7357f32af1a', 'PETUGAS', 'petugas'),
(5, 'admin', '0192023a7bbd73250516f069df18b500', 'ADMIN', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` varchar(15) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_spp`, `id_kelas`, `password`, `alamat`, `no_telp`) VALUES
('0032072148', '11212', 'Aziz Pamuji Fikri', 17, 11, '02973e115fca799c8ef43f56faf3564d', 'Jl. Kaki No.2, Bandung', '081362221776'),
('0039130191', '11111', 'Fikri Aziz Pamuji', 17, 5, '3c0a2293762b0cc98a9e578c46e37b27', 'Jl. Menado No.12, Bandung', '0895326969678');

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(17, 2021, 2330000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_spp` (`id_spp`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_3` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
