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


DROP TABLE IF EXISTS `hasil`;
CREATE TABLE IF NOT EXISTS `hasil` (
  `kd_hasil` int(11) NOT NULL AUTO_INCREMENT,
  `kd_prodi` int(11) NOT NULL,
  `no_pendaftaran` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL,
  PRIMARY KEY (`kd_hasil`),
  KEY `fk_camaba` (`no_pendaftaran`),
  KEY `fk_prodi` (`kd_prodi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`kd_hasil`, `kd_prodi`, `no_pendaftaran`, `nilai`, `tahun`) VALUES
(1, 1, '125610076', 0.975, '2017'),
(2, 1, '125610036', 0.8, '2017'),
(3, 1, '125610008', 0.55, '2020'),
(4, 11, '125610098', 0.925, '2017'),
(5, 11, '125610080', 0.9, '2017'),
(6, 11, '125610008', 0.64333333, '2020');


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=260;

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



--
-- Table structure for table `penilaian`
--

DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE IF NOT EXISTS `penilaian` (
  `kd_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `kd_prodi` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `bobot_nilai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kd_penilaian`),
  KEY `fk_kriteria` (`kd_kriteria`),
  KEY `fk_prodi` (`kd_prodi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`kd_penilaian`, `kd_prodi`, `kd_kriteria`, `keterangan`, `bobot_nilai`) VALUES
(1, 1, 1, '200 - 319', 1),
(2, 1, 1, '320 - 439', 2),
(3, 1, 1, '440 - 559', 3),
(4, 1, 1, '560 - 679', 4),
(5, 1, 1, '680 - 800', 5),
(6, 1, 2, '<=25', 1),
(7, 1, 2, '26 - 44', 2),
(8, 1, 2, '45 - 60', 3),
(9, 1, 2, '61 - 76', 4),
(10, 1, 2, '>=77', 5),
(11, 1, 3, '<=60', 2),
(12, 1, 3, '60 - 75', 3),
(13, 1, 3, '76 - 90', 4),
(14, 1, 3, '>=91', 5),
(15, 1, 4, '<=39', 2),
(16, 1, 4, '40 - 59', 3),
(17, 1, 4, '60 - 79', 4),
(18, 1, 4, '>=80', 5),
(20, 2, 5, '200 - 319', 1),
(21, 2, 5, '320 - 439', 2),
(22, 2, 5, '440 - 559', 3),
(23, 2, 5, '560 - 679', 4),
(24, 2, 5, '680 - 800', 5),
(25, 2, 6, '<=25', 1),
(26, 2, 6, '26 - 44', 2),
(27, 2, 6, '45 - 60', 3),
(28, 2, 6, '61 - 76', 4),
(29, 2, 6, '>=77', 5),
(30, 2, 7, '<=60', 2),
(31, 2, 7, '60 - 75', 3),
(32, 2, 7, '76 - 90', 4),
(33, 2, 7, '>=91', 5),
(34, 2, 8, '<=39', 2),
(35, 2, 8, '40 - 59', 3),
(36, 2, 8, '60 - 79', 4),
(37, 2, 8, '>=80', 5),
(38, 3, 9, '200 - 319', 1),
(39, 3, 9, '320 - 439', 2),
(40, 3, 9, '440 - 559', 3),
(41, 3, 9, '560 - 679', 4),
(42, 3, 9, '680 - 800', 5),
(43, 3, 10, '<=25', 1),
(44, 3, 10, '26 - 44', 2),
(45, 3, 10, '45 - 60', 3),
(46, 3, 10, '61 - 76', 4),
(47, 3, 10, '>=77', 5),
(48, 3, 11, '<=60', 2),
(49, 3, 11, '60 - 75', 3),
(50, 3, 11, '76 - 90', 4),
(51, 3, 11, '>=91', 5),
(52, 3, 12, '<=39', 2),
(53, 3, 12, '40 - 59', 3),
(54, 3, 12, '60 - 79', 4),
(55, 3, 12, '>=80', 5),
(56, 4, 13, '200 - 319', 1),
(57, 4, 13, '320 - 439', 2),
(58, 4, 13, '440 - 559', 3),
(59, 4, 13, '560 - 679', 4),
(60, 4, 13, '680 - 800', 5),
(61, 4, 14, '<=25', 1),
(62, 4, 14, '26 - 44', 2),
(63, 4, 14, '45 - 60', 3),
(64, 4, 14, '61 - 76', 4),
(65, 4, 14, '>=77', 5),
(66, 4, 15, '<=60', 2),
(67, 4, 15, '60 - 75', 3),
(68, 4, 15, '76 - 90', 4),
(69, 4, 15, '>=91', 5),
(70, 4, 16, '<=39', 2),
(71, 4, 16, '40 - 59', 3),
(72, 4, 16, '60 - 79', 4),
(73, 4, 16, '>=80', 5),
(74, 5, 17, '200 - 319', 1),
(75, 5, 17, '320 - 439', 2),
(76, 5, 17, '440 - 559', 3),
(77, 5, 17, '560 - 679', 4),
(78, 5, 17, '680 - 800', 5),
(79, 5, 18, '<=25', 1),
(80, 5, 18, '26 - 44', 2),
(81, 5, 18, '45 - 60', 3),
(82, 5, 18, '61 - 76', 4),
(83, 5, 18, '>=77', 5),
(84, 5, 19, '<=60', 2),
(85, 5, 19, '60 - 75', 3),
(86, 5, 19, '76 - 90', 4),
(87, 5, 19, '>=91', 5),
(88, 5, 20, '<=39', 2),
(89, 5, 20, '40 - 59', 3),
(90, 5, 20, '60 - 79', 4),
(91, 5, 20, '>=80', 5),
(92, 6, 21, '200 - 319', 1),
(93, 6, 21, '320 - 439', 2),
(94, 6, 21, '440 - 559', 3),
(95, 6, 21, '560 - 679', 4),
(96, 6, 21, '680 - 800', 5),
(97, 6, 22, '<=25', 1),
(98, 6, 22, '26 - 44', 2),
(99, 6, 22, '45 - 60', 3),
(100, 6, 22, '61 - 76', 4),
(101, 6, 22, '>=77', 5),
(102, 6, 23, '<=60', 2),
(103, 6, 23, '60 - 75', 3),
(104, 6, 23, '76 - 90', 4),
(105, 6, 23, '>=91', 5),
(106, 6, 24, '<=39', 2),
(107, 6, 24, '40 - 59', 3),
(108, 6, 24, '60 - 79', 4),
(109, 6, 24, '>=80', 5),
(110, 7, 25, '200 - 319', 1),
(111, 7, 25, '320 - 439', 2),
(112, 7, 25, '440 - 559', 3),
(113, 7, 25, '560 - 679', 4),
(114, 7, 25, '680 - 800', 5),
(115, 7, 26, '<=25', 1),
(116, 7, 26, '26 - 44', 2),
(117, 7, 26, '45 - 60', 3),
(118, 7, 26, '61 - 76', 4),
(119, 7, 26, '>=77', 5),
(120, 7, 27, '<=60', 2),
(121, 7, 27, '60 - 75', 3),
(122, 7, 27, '76 - 90', 4),
(123, 7, 27, '>=91', 5),
(124, 7, 28, '<=39', 2),
(125, 7, 28, '40 - 59', 3),
(126, 7, 28, '60 - 79', 4),
(127, 7, 28, '>=80', 5),
(128, 8, 29, '200 - 319', 1),
(129, 8, 29, '320 - 439', 2),
(130, 8, 29, '440 - 559', 3),
(131, 8, 29, '560 - 679', 4),
(132, 8, 29, '680 - 800', 5),
(133, 8, 30, '<=25', 1),
(134, 8, 30, '26 - 44', 2),
(135, 8, 30, '45 - 60', 3),
(136, 8, 30, '61 - 76', 4),
(137, 8, 30, '>=77', 5),
(138, 8, 31, '<=60', 2),
(139, 8, 31, '60 - 75', 3),
(140, 8, 31, '76 - 90', 4),
(141, 8, 31, '>=91', 5),
(142, 8, 32, '<=39', 2),
(143, 8, 32, '40 - 59', 3),
(144, 8, 32, '60 - 79', 4),
(145, 8, 32, '>=80', 5),
(146, 9, 33, '200 - 319', 1),
(147, 9, 33, '320 - 439', 2),
(148, 9, 33, '440 - 559', 3),
(149, 9, 33, '560 - 679', 4),
(150, 9, 33, '680 - 800', 5),
(151, 9, 34, '<=25', 1),
(152, 9, 34, '26 - 44', 2),
(153, 9, 34, '45 - 60', 3),
(154, 9, 34, '61 - 76', 4),
(155, 9, 34, '>=77', 5),
(156, 9, 35, '<=60', 2),
(157, 9, 35, '60 - 75', 3),
(158, 9, 35, '76 - 90', 4),
(159, 9, 35, '>=91', 5),
(160, 9, 36, '<=39', 2),
(161, 9, 36, '40 - 59', 3),
(162, 9, 36, '60 - 79', 4),
(163, 9, 36, '>=80', 5),
(164, 10, 37, '200 - 319', 1),
(165, 10, 37, '320 - 439', 2),
(166, 10, 37, '440 - 559', 3),
(167, 10, 37, '560 - 679', 4),
(168, 10, 37, '680 - 800', 5),
(169, 10, 38, '<=25', 1),
(170, 10, 38, '26 - 44', 2),
(171, 10, 38, '45 - 60', 3),
(172, 10, 38, '61 - 76', 4),
(173, 10, 38, '>=77', 5),
(174, 10, 39, '<=60', 2),
(175, 10, 39, '60 - 75', 3),
(176, 10, 39, '76 - 90', 4),
(177, 10, 39, '>=91', 5),
(178, 10, 40, '<=39', 2),
(179, 10, 40, '40 - 59', 3),
(180, 10, 40, '60 - 79', 4),
(181, 10, 40, '>=80', 5),
(182, 11, 41, '200 - 319', 1),
(183, 11, 41, '320 - 439', 2),
(184, 11, 41, '440 - 559', 3),
(185, 11, 41, '560 - 679', 4),
(186, 11, 41, '680 - 800', 5),
(187, 11, 42, '<=25', 1),
(188, 11, 42, '26 - 44', 2),
(189, 11, 42, '45 - 60', 3),
(190, 11, 42, '61 - 76', 4),
(191, 11, 42, '>=77', 5),
(192, 11, 43, '<=60', 2),
(193, 11, 43, '60 - 75', 3),
(194, 11, 43, '76 - 90', 4),
(195, 11, 43, '>=91', 5),
(196, 11, 44, '<=39', 2),
(197, 11, 44, '40 - 59', 3),
(198, 11, 44, '60 - 79', 4),
(199, 11, 44, '>=80', 5),
(200, 12, 45, '200 - 319', 1),
(201, 12, 45, '320 - 439', 2),
(202, 12, 45, '440 - 559', 3),
(203, 12, 45, '560 - 679', 4),
(204, 12, 45, '680 - 800', 5),
(205, 12, 46, '<=25', 1),
(206, 12, 46, '26 - 44', 2),
(207, 12, 46, '45 - 60', 3),
(208, 12, 46, '61 - 76', 4),
(209, 12, 46, '>=77', 5),
(210, 12, 47, '<=60', 2),
(211, 12, 47, '60 - 75', 3),
(212, 12, 47, '76 - 90', 4),
(213, 12, 47, '>=91', 5),
(214, 12, 48, '<=39', 2),
(215, 12, 48, '40 - 59', 3),
(216, 12, 48, '60 - 79', 4),
(217, 12, 48, '>=80', 5),
(218, 13, 49, '200 - 319', 1),
(219, 13, 49, '320 - 439', 2),
(220, 13, 49, '440 - 559', 3),
(221, 13, 49, '560 - 679', 4),
(222, 13, 49, '680 - 800', 5),
(223, 13, 50, '<=25', 1),
(224, 13, 50, '26 - 44', 2),
(225, 13, 50, '45 - 60', 3),
(226, 13, 50, '61 - 76', 4),
(227, 13, 50, '>=77', 5),
(228, 13, 51, '<=60', 2),
(229, 13, 51, '60 - 75', 3),
(230, 13, 51, '76 - 90', 4),
(231, 13, 51, '>=91', 5),
(232, 13, 52, '<=39', 2),
(233, 13, 52, '40 - 59', 3),
(234, 13, 52, '60 - 79', 4),
(235, 13, 52, '>=80', 5),
(236, 14, 53, '200 - 319', 1),
(237, 14, 53, '320 - 439', 2),
(238, 14, 53, '440 - 559', 3),
(239, 14, 53, '560 - 679', 4),
(240, 14, 53, '680 - 800', 5),
(241, 14, 54, '<=25', 1),
(242, 14, 54, '26 - 44', 2),
(243, 14, 54, '45 - 60', 3),
(244, 14, 54, '61 - 76', 4),
(245, 14, 54, '>=77', 5),
(246, 14, 55, '<=60', 2),
(247, 14, 55, '60 - 75', 3),
(248, 14, 55, '76 - 90', 4),
(249, 14, 55, '>=91', 5),
(250, 14, 56, '<=39', 2),
(251, 14, 56, '40 - 59', 3),
(252, 14, 56, '60 - 79', 4),
(253, 1, 56, '>=80', 5);



--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE IF NOT EXISTS `nilai` (
  `kd_nilai` int(11) NOT NULL AUTO_INCREMENT,
  `kd_prodi` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `no_pendaftaran` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  PRIMARY KEY (`kd_nilai`),
  KEY `fk_kriteria` (`kd_kriteria`),
  KEY `fk_camaba` (`no_pendaftaran`),
  KEY `fk_prodi` (`kd_prodi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_prodi`, `kd_kriteria`, `no_pendaftaran`, `nilai`) VALUES
(1, 1, 1, '125610036', 4),
(2, 1, 2, '125610036', 3),
(3, 1, 3, '125610036', 2),
(4, 1, 4, '125610036', 3),
(5, 6, 21, '125610036', 3),
(6, 6, 22, '125610036', 4),
(7, 6, 23, '125610036', 3),
(8, 6, 24, '125610036', 3),
(9, 2, 5, '125610076', 3),
(10, 2, 6, '125610076', 3),
(11, 2, 7, '125610076', 3),
(12, 2, 8, '125610076', 4),
(13, 10, 37, '125610076', 2),
(14, 10, 38, '125610076', 2),
(15, 10, 39, '125610076', 2),
(16, 10, 40, '125610076', 2),
(17, 3, 9, '125610080', 2),
(18, 3, 10, '125610080', 3),
(19, 3, 11, '125610080', 4),
(20, 3, 12, '125610080', 3),
(21, 11, 41, '125610080', 3),
(22, 11, 42, '125610080', 4),
(23, 11, 43, '125610080', 3),
(24, 11, 44, '125610080', 2),
(25, 4, 13, '125610098', 2),
(26, 4, 14, '125610098', 3),
(27, 4, 15, '125610098', 2),
(28, 4, 16, '125610098', 4),
(29, 12, 45, '125610098', 3),
(30, 12, 46, '125610098', 4),
(31, 12, 47, '125610098', 4),
(32, 12, 48, '125610098', 4);



-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`no_pendaftaran`) REFERENCES `camaba` (`no_pendaftaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_prodi` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bobot kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`no_pendaftaran`) REFERENCES `camaba` (`no_pendaftaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

