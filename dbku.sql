-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2017 at 06:38 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spkum_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

DROP TABLE IF EXISTS `prodi`;
CREATE TABLE IF NOT EXISTS `prodi` (
  `kd_prodi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_prodi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`kd_prodi`, `nama_prodi`) VALUES
(1, 'Fisika'),
(2, 'Matematika'),
(3, 'Teknik Mesin'),
(4, 'Teknik Elektro'),
(5, 'Teknik Kimia'),
(6, 'Teknik Material dan Metalurgi'),
(7, 'Teknik Sipil'),
(8, 'Perencanaan Wilayah dan Kota'),
(9, 'Teknik Perkapalan'),
(10, 'Sistem Informasi'),
(11, 'Informatika'),
(12, 'Teknik Industri'),
(13, 'Teknik Lingkungan'),
(14, 'Teknik Kelautan');
-- --------------------------------------------------------

--
-- Table structure for table `camaba`
--

DROP TABLE IF EXISTS `camaba`;
CREATE TABLE IF NOT EXISTS `camaba` (
  `no_pendaftaran` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tahun_lulus` char(4) NOT NULL,
  PRIMARY KEY (`no_pendaftaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camaba`
--

INSERT INTO `camaba` (`no_pendaftaran`, `nama`, `alamat`, `jenis_kelamin`, `tahun_lulus`) VALUES
('125610036', 'Anisa Reviana Sakti', 'Jogja', 'Perempuan', '2017'),
('125610076', 'Heni Nurhidayati', 'palembang', 'Perempuan', '2017'),
('125610080', 'Nur Afifah Safitri', 'Medan', 'Perempuan', '2017'),
('125610098', 'Tri Septa Kurnia', 'Kalimantan', 'Perempuan', '2017');

-- --------------------------------------------------------
--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE IF NOT EXISTS `pengguna` (
  `kd_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `status` enum('petugas','puket') DEFAULT NULL,
  PRIMARY KEY (`kd_pengguna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`kd_pengguna`, `username`, `password`, `status`) VALUES
(1, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas'),
(2, 'puket', '679a71646e932b7c4647a081ee2a148', 'puket');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--
DROP TABLE IF EXISTS `kriteria`;
CREATE TABLE IF NOT EXISTS `kriteria` (
  `kd_kriteria` int(11) NOT NULL AUTO_INCREMENT,
  `kd_prodi` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sifat` enum('min','max') DEFAULT NULL,
  PRIMARY KEY (`kd_kriteria`),
  KEY `kd_prodi` (`kd_prodi`),
  KEY `kd_prodi_2` (`kd_prodi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kd_kriteria`, `kd_prodi`, `nama`, `sifat`) VALUES
(1, 1, 'Nilai TPA', 'max'),
(2, 1, 'Nilai TPD', 'max'),
(3, 1, 'Akreditasi Sekolah', 'max'),
(4, 1, 'Indeks Sekolah', 'max'),
(5, 2, 'Nilai TPA', 'max'),
(6, 2, 'Nilai TPD', 'max'),
(7, 2, 'Akreditasi Sekolah', 'max'),
(8, 2, 'Indeks Sekolah', 'max'),
(9, 3, 'Nilai TPA', 'max'),
(10, 3, 'Nilai TPD', 'max'),
(11, 3, 'Akreditasi Sekolah', 'max'),
(12, 3, 'Indeks Sekolah', 'max'),
(13, 4, 'Nilai TPA', 'max'),
(14, 4, 'Nilai TPD', 'max'),
(15, 4, 'Akreditasi Sekolah', 'max'),
(16, 4, 'Indeks Sekolah', 'max'),
(17, 5, 'Nilai TPA', 'max'),
(18, 5, 'Nilai TPD', 'max'),
(19, 5, 'Akreditasi Sekolah', 'max'),
(20, 5, 'Indeks Sekolah', 'max'),
(21, 6, 'Nilai TPA', 'max'),
(22, 6, 'Nilai TPD', 'max'),
(23, 6, 'Akreditasi Sekolah', 'max'),
(24, 6, 'Indeks Sekolah', 'max'),
(25, 7, 'Nilai TPA', 'max'),
(26, 7, 'Nilai TPD', 'max'),
(27, 7, 'Akreditasi Sekolah', 'max'),
(28, 7, 'Indeks Sekolah', 'max'),
(29, 8, 'Nilai TPA', 'max'),
(30, 8, 'Nilai TPD', 'max'),
(31, 8, 'Akreditasi Sekolah', 'max'),
(32, 8, 'Indeks Sekolah', 'max'),
(33, 9, 'Nilai TPA', 'max'),
(34, 9, 'Nilai TPD', 'max'),
(35, 9, 'Akreditasi Sekolah', 'max'),
(36, 9, 'Indeks Sekolah', 'max'),
(37, 10, 'Nilai TPA', 'max'),
(38, 10, 'Nilai TPD', 'max'),
(39, 10, 'Akreditasi Sekolah', 'max'),
(40, 10, 'Indeks Sekolah', 'max'),
(41, 11, 'Nilai TPA', 'max'),
(42, 11, 'Nilai TPD', 'max'),
(43, 11, 'Akreditasi Sekolah', 'max'),
(44, 11, 'Indeks Sekolah', 'max'),
(45, 12, 'Nilai TPA', 'max'),
(46, 12, 'Nilai TPD', 'max'),
(47, 12, 'Akreditasi Sekolah', 'max'),
(48, 12, 'Indeks Sekolah', 'max'),
(49, 13, 'Nilai TPA', 'max'),
(50, 13, 'Nilai TPD', 'max'),
(51, 13, 'Akreditasi Sekolah', 'max'),
(52, 13, 'Indeks Sekolah', 'max'),
(53, 13, 'Nilai TPA', 'max'),
(54, 14, 'Nilai TPD', 'max'),
(55, 14, 'Akreditasi Sekolah', 'max'),
(56, 14, 'Indeks Sekolah', 'max');

--
-- Table structure for table `bobotkriteria`
--

DROP TABLE IF EXISTS `bobot_kriteria`;
CREATE TABLE IF NOT EXISTS `bobot_kriteria` (
  `kd_bobot` int(11) NOT NULL AUTO_INCREMENT,
  `kd_prodi` int(11) NOT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `bobot` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kd_bobot`),
  KEY `fk_kriteria` (`kd_kriteria`),
  KEY `fk_prodi` (`kd_prodi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `bobotkriteria`
--

INSERT INTO `bobot_kriteria` (`kd_bobot`, `kd_prodi`, `kd_kriteria`, `bobot`) VALUES
(1, 1, 1, '0.40'),
(2, 1, 2, '0.30'),
(3, 1, 3, '0.20'),
(4, 1, 4, '0.10'),
(5, 2, 5, '0.30'),
(6, 2, 6, '0.40'),
(7, 2, 7, '0.10'),
(8, 2, 8, '0.20'),
(9, 3, 9, '0.30'),
(10, 3, 10, '0.30'),
(11, 3, 11, '0.20'),
(12, 3, 12, '0.20'),
(13, 4, 13, '0.30'),
(14, 4, 14, '0.30'),
(15, 4, 15, '0.30'),
(16, 4, 16, '0.10'),
(17, 5, 17, '0.40'),
(18, 5, 18, '0.30'),
(19, 5, 19, '0.10'),
(20, 5, 20, '0.20'),
(21, 6, 21, '0.40'),
(22, 6, 22, '0.20'),
(23, 6, 23, '0.20'),
(24, 6, 24, '0.20'),
(25, 7, 25, '0.30'),
(26, 7, 26, '0.20'),
(27, 7, 27, '0.30'),
(28, 7, 28, '0.20'),
(29, 8, 29, '0.60'),
(30, 8, 30, '0.20'),
(31, 8, 31, '0.10'),
(32, 8, 32, '0.10'),
(33, 9, 33, '0.20'),
(34, 9, 34, '0.40'),
(35, 9, 35, '0.20'),
(36, 9, 36, '0.20'),
(37, 10, 37, '0.30'),
(38, 10, 38, '0.50'),
(39, 10, 39, '0.10'),
(40, 10, 40, '0.10'),
(41, 11, 41, '0.50'),
(42, 11, 42, '0.30'),
(43, 11, 43, '0.10'),
(44, 11, 44, '0.10'),
(45, 12, 45, '0.50'),
(46, 12, 46, '0.20'),
(47, 12, 47, '0.10'),
(48, 12, 48, '0.20'),
(49, 13, 49, '0.40'),
(50, 13, 50, '0.20'),
(51, 13, 51, '0.30'),
(52, 13, 52, '0.10'),
(53, 14, 53, '0.40'),
(54, 14, 54, '0.40'),
(55, 14, 55, '0.10'),
(56, 14, 56, '0.10');

-- --------------------------------------------------------

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

