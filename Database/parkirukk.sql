-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2026 at 05:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkirukk`
--

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id_form` int(11) NOT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL,
  `jenis_form` varchar(50) DEFAULT NULL,
  `status_delete` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id_form`, `deskripsi`, `route`, `jenis_form`, `status_delete`, `icon`) VALUES
(1, 'Parkir Masuk', 'transaksi/masuk', 'input', 0, 'fa-solid fa-right-to-bracket'),
(3, 'Hak Akses', 'hak-akses', 'input', 0, 'fas fa-key'),
(14, 'My Logs', 'my-logs', 'input', 0, 'fas fa-user-clock'),
(15, 'Log Activity', 'log-activity', 'table', 0, 'fas fa-history'),
(16, 'All Data', 'tampildata', 'table', 0, 'fa-solid fa-table'),
(17, 'Input Data', 'formdata', 'input', 0, 'fa-solid fa-pen'),
(18, 'Laporan', 'transaksi/laporan', 'table', 0, 'fa-solid fa-file-pdf'),
(19, 'Parkir Keluar', 'transaksi/keluar', 'input', 0, 'fa-solid fa-right-from-bracket'),
(20, 'Parkir', 'transaksi', 'table', 0, 'fa-solid fa-square-parking'),
(21, 'Settings', 'settings', 'input', 0, 'fa-solid fa-gear');

-- --------------------------------------------------------

--
-- Table structure for table `group_form`
--

CREATE TABLE `group_form` (
  `id_form` varchar(50) NOT NULL,
  `id_level` varchar(50) NOT NULL,
  `can_read` bit(1) DEFAULT NULL,
  `can_create` bit(1) DEFAULT NULL,
  `can_approve` bit(1) DEFAULT NULL,
  `status_delete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `group_form`
--

INSERT INTO `group_form` (`id_form`, `id_level`, `can_read`, `can_create`, `can_approve`, `status_delete`) VALUES
('1', '13', b'0', b'0', b'0', 0),
('1', '14', b'0', b'0', b'0', 0),
('1', '3', b'0', b'0', b'0', 0),
('14', '11', b'1', b'1', b'1', 0),
('14', '13', b'0', b'0', b'0', 0),
('14', '14', b'1', b'1', b'1', 0),
('14', '2', b'1', b'1', b'1', 0),
('14', '3', b'1', b'1', b'1', 0),
('15', '1', b'1', b'1', b'1', 0),
('15', '13', b'1', b'1', b'1', 0),
('16', '1', b'1', b'1', b'1', 0),
('16', '13', b'1', b'1', b'1', 0),
('17', '1', b'0', b'0', b'0', 0),
('17', '13', b'0', b'0', b'0', 0),
('18', '11', b'1', b'1', b'1', 0),
('18', '13', b'1', b'1', b'1', 0),
('18', '15', b'1', b'1', b'1', 0),
('18', '2', b'1', b'1', b'0', 0),
('19', '13', b'0', b'0', b'0', 0),
('19', '14', b'0', b'0', b'0', 0),
('20', '13', b'1', b'1', b'1', 0),
('20', '14', b'1', b'1', b'1', 0),
('21', '13', b'0', b'0', b'0', 0),
('3', '13', b'0', b'0', b'0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses_user`
--

CREATE TABLE `hak_akses_user` (
  `id_hak_akses` int(11) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `id_level` varchar(50) NOT NULL,
  `status_delete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `hak_akses_user`
--

INSERT INTO `hak_akses_user` (`id_hak_akses`, `id_user`, `id_level`, `status_delete`) VALUES
(1, '51', '13', 0),
(10, '58', '1', 0),
(11, '59', '14', 0),
(12, '60', '15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `nama_level`) VALUES
(1, 'Admin'),
(13, 'SuperAdmin'),
(14, 'Petugas'),
(15, 'Owner');

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `what_happen` text NOT NULL,
  `happens_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_activity`
--

INSERT INTO `log_activity` (`id_log`, `id_user`, `what_happen`, `happens_at`, `ip_address`) VALUES
(116, 51, 'Membuat level baru: Test dengan permissions', '2026-02-25 10:21:03', '::1'),
(117, 51, 'Hapus level: Test', '2026-02-25 10:21:08', '::1'),
(118, 51, 'Edit level 1: Admin dengan permissions', '2026-02-25 10:21:40', '::1'),
(119, 51, 'Edit form 1: Transaksi', '2026-02-25 10:31:13', '::1'),
(120, 51, 'Edit form 1: Transaksi', '2026-02-25 10:32:40', '::1'),
(121, 51, 'Edit form 1: Parkir Masuk', '2026-02-25 10:35:39', '::1'),
(122, 51, 'Edit form 1: Parkir Masuk', '2026-02-25 10:36:36', '::1'),
(123, 51, 'Menambahkan form baru: Parkir Keluar', '2026-02-25 10:37:19', '::1'),
(124, 51, 'Edit level 1: Admin dengan permissions', '2026-02-25 10:37:31', '::1'),
(125, 51, 'Edit form 18: Laporan', '2026-02-25 10:38:47', '::1'),
(126, 51, 'User KF logged in successfully', '2026-02-25 10:51:02', '::1'),
(127, 51, 'Menambahkan form baru: Parkir', '2026-02-25 10:51:57', '::1'),
(128, 51, 'Edit level 1: Admin dengan permissions', '2026-02-25 10:52:08', '::1'),
(129, 51, 'Edit form 1: Parkir Masuk', '2026-02-25 11:01:04', '::1'),
(130, 51, 'Edit form 19: Parkir Keluar', '2026-02-25 11:01:32', '::1'),
(131, 51, 'Hapus form: List Pengaduan', '2026-02-25 11:05:06', '::1'),
(132, 51, 'Membuat level baru: SuperAdmin dengan permissions', '2026-02-25 11:13:43', '::1'),
(133, 51, 'Assign level 13 ke user 51', '2026-02-25 11:13:47', '::1'),
(134, 51, 'Edit level 1: Admin dengan permissions', '2026-02-25 11:14:40', '::1'),
(135, 51, 'Assign level 1 ke user 51', '2026-02-25 11:18:59', '::1'),
(136, 51, 'Assign level 13 ke user 51', '2026-02-25 11:19:05', '::1'),
(137, 51, 'Assign level 1 ke user 51', '2026-02-25 11:20:25', '::1'),
(138, 51, 'Assign level 13 ke user 51', '2026-02-25 11:20:46', '::1'),
(139, 51, 'User KF logged out', '2026-02-25 11:20:48', '::1'),
(140, 51, 'User KF logged in successfully', '2026-02-25 11:20:57', '::1'),
(141, 51, 'Membuat level baru: Petugas dengan permissions', '2026-02-25 11:23:15', '::1'),
(142, 51, 'Edit form 14: My Logs', '2026-02-25 11:23:35', '::1'),
(143, 51, 'Membuat level baru: Owner dengan permissions', '2026-02-25 11:23:49', '::1'),
(144, 51, 'User KF created new user: Admin', '2026-02-25 11:24:33', '::1'),
(145, 51, 'Assign level 1 ke user 58', '2026-02-25 11:24:44', '::1'),
(146, 51, 'User KF created new user: Petugas1', '2026-02-25 11:25:08', '::1'),
(147, 51, 'User KF created new user: Owner', '2026-02-25 11:25:17', '::1'),
(148, 51, 'Assign level 14 ke user 59', '2026-02-25 11:25:24', '::1'),
(149, 51, 'Assign level 15 ke user 60', '2026-02-25 11:25:28', '::1'),
(150, 51, 'User KF logged out', '2026-02-25 11:25:32', '::1'),
(151, 60, 'User Owner logged in successfully', '2026-02-25 11:25:40', '::1'),
(152, 60, 'User Owner logged out', '2026-02-25 11:29:38', '::1'),
(153, 51, 'User KF logged in successfully', '2026-02-25 11:29:45', '::1'),
(154, 51, 'Menambahkan form baru: Settings', '2026-02-25 11:31:38', '::1'),
(155, 51, 'Edit level 13: SuperAdmin dengan permissions', '2026-02-25 11:31:47', '::1'),
(156, 51, 'User KF logged out', '2026-02-25 11:53:11', '::1'),
(157, 51, 'User KF logged in successfully', '2026-02-25 13:15:29', '::1'),
(158, 51, 'User KF logged out', '2026-02-25 13:23:11', '::1'),
(159, 51, 'User KF logged in successfully', '2026-02-25 13:23:22', '::1'),
(160, 51, 'User KF logged out', '2026-02-25 14:07:40', '::1'),
(161, 51, 'User KF logged in successfully', '2026-02-25 14:08:43', '::1'),
(162, 51, 'User KF logged out', '2026-02-25 14:23:59', '::1'),
(163, 51, 'User KF logged in successfully', '2026-02-25 14:38:51', '::1'),
(164, 51, 'Edit level 13: SuperAdmin dengan permissions', '2026-02-25 14:39:35', '::1'),
(165, 51, 'User KF logged out', '2026-02-25 14:43:28', '::1'),
(166, 51, 'User KF logged in successfully', '2026-02-25 15:05:45', '::1'),
(167, 51, 'User KF logged in successfully', '2026-02-26 08:02:16', '::1'),
(168, 51, 'User KF logged out', '2026-02-26 08:04:18', '::1'),
(169, 51, 'User KF logged in successfully', '2026-02-26 08:04:29', '::1'),
(170, 51, 'User KF logged out', '2026-02-26 08:10:48', '::1'),
(171, 51, 'User KF logged in successfully', '2026-02-26 08:11:04', '::1'),
(172, 51, 'User KF logged out', '2026-02-26 08:12:41', '::1'),
(173, 51, 'User KF logged in successfully', '2026-02-26 08:12:51', '::1'),
(174, 51, 'User KF logged out', '2026-02-26 08:22:41', '::1'),
(175, 51, 'User KF logged in successfully', '2026-02-26 08:23:53', '::1'),
(176, 51, 'User KF logged out', '2026-02-26 08:30:56', '::1'),
(177, 51, 'User KF logged in successfully', '2026-02-26 08:31:21', '::1'),
(178, 51, 'User KF logged out', '2026-02-26 08:49:47', '::1'),
(179, 58, 'User Admin logged in successfully', '2026-02-26 08:49:59', '::1'),
(180, 58, 'User Admin created new user: test', '2026-02-26 08:50:25', '::1'),
(181, 58, 'User Admin updated user ID: 61', '2026-02-26 08:50:37', '::1'),
(182, 58, 'User Admin updated user ID: 61', '2026-02-26 08:51:14', '::1'),
(183, 58, 'User Admin deleted user ID: 61', '2026-02-26 08:51:19', '::1'),
(184, 58, 'User Admin created new user: test', '2026-02-26 08:53:10', '::1'),
(185, 58, 'User Admin updated user ID: 62', '2026-02-26 08:53:15', '::1'),
(186, 58, 'User Admin updated user ID: 62', '2026-02-26 08:53:51', '::1'),
(187, 58, 'User Admin updated user ID: 62', '2026-02-26 08:54:36', '::1'),
(188, 58, 'User Admin deleted user ID: 62', '2026-02-26 08:54:43', '::1'),
(189, 58, 'User Admin logged out', '2026-02-26 08:56:59', '::1'),
(190, 60, 'User Owner logged in successfully', '2026-02-26 08:57:45', '::1'),
(191, 60, 'User Owner logged out', '2026-02-26 09:22:07', '::1'),
(192, 59, 'User Petugas1 logged in successfully', '2026-02-26 09:22:38', '::1'),
(193, 59, 'User Petugas1 logged out', '2026-02-26 09:43:41', '::1'),
(194, 51, 'User KF logged in successfully', '2026-02-26 09:43:50', '::1'),
(195, 51, 'User KF logged out', '2026-02-26 10:17:38', '::1'),
(196, 51, 'User KF logged in successfully', '2026-02-26 10:17:49', '::1'),
(197, 51, 'User KF logged out', '2026-02-26 10:27:46', '::1'),
(198, 51, 'User KF logged in successfully', '2026-02-26 10:28:49', '::1'),
(199, 51, 'User KF logged in successfully', '2026-02-26 10:29:45', '::1'),
(200, 51, 'User KF logged out', '2026-02-26 10:38:44', '::1'),
(201, 58, 'User Admin logged in successfully', '2026-02-26 10:39:00', '::1'),
(202, 58, 'User Admin logged out', '2026-02-26 10:39:19', '::1'),
(203, 60, 'User Owner logged in successfully', '2026-02-26 10:39:29', '::1'),
(204, 60, 'User Owner logged out', '2026-02-26 10:39:42', '::1'),
(205, 59, 'User Petugas1 logged in successfully', '2026-02-26 10:39:48', '::1'),
(206, 59, 'User Petugas1 logged out', '2026-02-26 10:40:03', '::1'),
(207, 51, 'User KF logged in successfully', '2026-02-26 10:40:18', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_area_parkir`
--

CREATE TABLE `tb_area_parkir` (
  `id_area` int(11) NOT NULL,
  `nama_area` varchar(50) NOT NULL,
  `kapasitas` int(5) NOT NULL,
  `terisi` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_area_parkir`
--

INSERT INTO `tb_area_parkir` (`id_area`, `nama_area`, `kapasitas`, `terisi`) VALUES
(1, 'Basement', 1, 1),
(2, 'Rooftop', 50, 0),
(3, 'Area A - Lantai 1', 50, 23),
(4, 'Area B - Lantai 2', 60, 45),
(5, 'Area C - Lantai 3', 40, 18),
(6, 'Area D - Lantai 4', 80, 67),
(7, 'Area E - Lantai 5', 35, 12),
(8, 'Area F - Lantai 1', 45, 34),
(9, 'Area G - Lantai 2', 55, 28),
(10, 'Area H - Lantai 3', 70, 51),
(11, 'Area I - Lantai 4', 30, 15),
(12, 'Area J - Lantai 5', 65, 42),
(13, 'Area K - Lantai 1', 40, 22),
(14, 'Area L - Lantai 2', 75, 58),
(15, 'Area M - Lantai 3', 50, 31),
(16, 'Area N - Lantai 4', 45, 19),
(17, 'Area O - Lantai 5', 60, 47),
(18, 'Area P - Lantai 1', 55, 38),
(19, 'Area Q - Lantai 2', 35, 21),
(20, 'Area R - Lantai 3', 80, 69),
(21, 'Area S - Lantai 4', 42, 26),
(22, 'Area T - Lantai 5', 48, 33),
(23, 'Area U - Lantai 1', 65, 52),
(24, 'Area V - Lantai 2', 38, 17),
(25, 'Area W - Lantai 3', 52, 41),
(26, 'Area X - Lantai 4', 58, 43),
(27, 'Area Y - Lantai 5', 33, 14),
(28, 'Area Z - Lantai 1', 47, 35),
(29, 'Area AA - Lantai 2', 62, 48),
(30, 'Area BB - Lantai 3', 41, 29),
(31, 'Area CC - Lantai 4', 56, 37),
(32, 'Area DD - Lantai 5', 39, 22),
(33, 'Area EE - Lantai 1', 68, 54),
(34, 'Area FF - Lantai 2', 44, 31),
(35, 'Area GG - Lantai 3', 51, 38),
(36, 'Area HH - Lantai 4', 37, 24),
(37, 'Area II - Lantai 5', 73, 61),
(38, 'Area JJ - Lantai 1', 46, 32),
(39, 'Area KK - Lantai 2', 59, 44),
(40, 'Area LL - Lantai 3', 34, 18),
(41, 'Area MM - Lantai 4', 67, 49),
(42, 'Area NN - Lantai 5', 43, 27),
(43, 'Area OO - Lantai 1', 54, 41),
(44, 'Area PP - Lantai 2', 36, 20),
(45, 'Area QQ - Lantai 3', 61, 46),
(46, 'Area RR - Lantai 4', 49, 35),
(47, 'Area SS - Lantai 5', 57, 39),
(48, 'Area TT - Lantai 1', 32, 16),
(49, 'Area UU - Lantai 2', 71, 58),
(50, 'Area VV - Lantai 3', 45, 33),
(51, 'Area WW - Lantai 4', 53, 40),
(52, 'Area XX - Lantai 5', 38, 25),
(53, 'Area YY - Lantai 1', 64, 51),
(54, 'Area ZZ - Lantai 2', 41, 28),
(55, 'Area AAA - Lantai 3', 48, 34),
(56, 'Area BBB - Lantai 4', 56, 42),
(57, 'Area CCC - Lantai 5', 35, 19),
(58, 'Area DDD - Lantai 1', 69, 57),
(59, 'Area EEE - Lantai 2', 33, 15),
(60, 'Area FFF - Lantai 3', 52, 39),
(61, 'Area GGG - Lantai 4', 47, 31),
(62, 'Area HHH - Lantai 5', 60, 48),
(63, 'Area III - Lantai 1', 44, 29),
(64, 'Area JJJ - Lantai 2', 58, 45),
(65, 'Area KKK - Lantai 3', 37, 23),
(66, 'Area LLL - Lantai 4', 66, 53),
(67, 'Area MMM - Lantai 5', 42, 30),
(68, 'Area NNN - Lantai 1', 55, 41),
(69, 'Area OOO - Lantai 2', 39, 24),
(70, 'Area PPP - Lantai 3', 63, 50),
(71, 'Area QQQ - Lantai 4', 31, 17),
(72, 'Area RRR - Lantai 5', 50, 36),
(73, 'Area SSS - Lantai 1', 46, 32),
(74, 'Area TTT - Lantai 2', 72, 59),
(75, 'Area UUU - Lantai 3', 40, 26),
(76, 'Area VVV - Lantai 4', 54, 41),
(77, 'Area WWW - Lantai 5', 38, 25),
(78, 'Area XXX - Lantai 1', 65, 52),
(79, 'Area YYY - Lantai 2', 43, 30),
(80, 'Area ZZZ - Lantai 3', 57, 44),
(81, 'Area AAAA - Lantai 4', 36, 21),
(82, 'Area BBBB - Lantai 5', 61, 47),
(83, 'Area CCCC - Lantai 1', 49, 35),
(84, 'Area DDDD - Lantai 2', 68, 55),
(85, 'Area EEEE - Lantai 3', 34, 18),
(86, 'Area FFFF - Lantai 4', 53, 40),
(87, 'Area GGGG - Lantai 5', 45, 32),
(88, 'Area HHHH - Lantai 1', 59, 46),
(89, 'Area IIII - Lantai 2', 41, 27),
(90, 'Area JJJJ - Lantai 3', 62, 49),
(91, 'Area KKKK - Lantai 4', 37, 22),
(92, 'Area LLLL - Lantai 5', 51, 38),
(93, 'Area MMMM - Lantai 1', 48, 34),
(94, 'Area NNNN - Lantai 2', 70, 56),
(95, 'Area OOOO - Lantai 3', 33, 16),
(96, 'Area PPPP - Lantai 4', 56, 43),
(97, 'Area QQQQ - Lantai 5', 44, 31),
(98, 'Area RRRR - Lantai 1', 64, 51),
(99, 'Area SSSS - Lantai 2', 39, 25),
(100, 'Area TTTT - Lantai 3', 58, 45),
(101, 'Area UUUU - Lantai 4', 47, 33),
(102, 'Area VVVV - Lantai 5', 52, 39),
(103, 'Area WWWW - Lantai 1', 42, 28),
(104, 'Area XXXX - Lantai 2', 67, 54),
(105, 'Area YYYY - Lantai 3', 35, 19),
(106, 'Area ZZZZ - Lantai 4', 55, 42),
(107, 'Area AAAAA - Lantai 5', 46, 32);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kendaraan`
--

CREATE TABLE `tb_kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `plat_nomor` varchar(15) DEFAULT NULL,
  `jenis_kendaraan` varchar(20) DEFAULT NULL,
  `warna` varchar(20) DEFAULT NULL,
  `pemilik` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kendaraan`
--

INSERT INTO `tb_kendaraan` (`id_kendaraan`, `plat_nomor`, `jenis_kendaraan`, `warna`, `pemilik`, `id_user`) VALUES
(1, 'BP 1751 KF', 'motor', 'merah', 'Kevin Fernando', 51),
(2, 'BP 4169 AF', 'motor', 'Toska', 'Engeline Charine', 51),
(3, 'BP 1493 HI', 'mobil', 'Silver', 'Tjoea Yu Hwa', 51),
(5, 'BP 1234AB', 'Motor', 'Merah', 'Ahmad Sutrisno', 2),
(6, 'BP 5678CD', 'Mobil', 'Biru', 'Budi Wahyudi', 3),
(7, 'BP 9012EF', 'Bus', 'Hijau', 'Cahyo Hidayat', 4),
(8, 'BP 3456GH', 'Truk', 'Kuning', 'Dedi Prabowo', 5),
(9, 'BP 7890IJ', 'Pickup', 'Hitam', 'Eko Santoso', 6),
(10, 'BP 2345KL', 'Van', 'Putih', 'Fajar Gunawan', 7),
(11, 'BP 6789MN', 'Minibus', 'Abu-abu', 'Gani Saputra', 8),
(12, 'BP 0123OP', 'Sedan', 'Silver', 'Hadi Hidayatullah', 9),
(13, 'BP 4567QR', 'SUV', 'Coklat', 'Iwan Rahman', 10),
(14, 'BP 8901ST', 'Jeep', 'Orange', 'Joko Siregar', 11),
(15, 'BP 1357UV', 'Motor', 'Ungu', 'Kusumo Lubis', 12),
(16, 'BP 2468WX', 'Mobil', 'Pink', 'Lukman Nasution', 13),
(17, 'BP 3579YZ', 'Bus', 'Tosca', 'Muhammad Harahap', 14),
(18, 'BP 4680AB', 'Truk', 'Navy', 'Nur Siregar', 15),
(19, 'BP 5791CD', 'Pickup', 'Maroon', 'Omar Panggabean', 16),
(20, 'BP 6802EF', 'Van', 'Cream', 'Prabowo Sitorus', 17),
(21, 'BP 7913GH', 'Minibus', 'Beige', 'Qori Pardede', 18),
(22, 'BP 8024IJ', 'Sedan', 'Gold', 'Rudi Sinaga', 19),
(23, 'BP 9135KL', 'SUV', 'Bronze', 'Sukma Hutagalung', 20),
(24, 'BP 0246MN', 'Jeep', 'Coklat Muda', 'Toni Hutapea', 21),
(25, 'BP 1357OP', 'Motor', 'Merah', 'Umar Nababan', 22),
(26, 'BP 2468QR', 'Mobil', 'Biru', 'Victor Simanjuntak', 23),
(27, 'BP 3579ST', 'Bus', 'Hijau', 'Wahyu Sihombing', 24),
(28, 'BP 4680UV', 'Truk', 'Kuning', 'Yanto Simbolon', 25),
(29, 'BP 5791WX', 'Pickup', 'Hitam', 'Zainal Samosir', 26),
(30, 'BP 6802YZ', 'Van', 'Putih', 'Adi Ginting', 27),
(31, 'BP 7913AB', 'Minibus', 'Abu-abu', 'Bagus Karokaro', 28),
(32, 'BP 8024CD', 'Sedan', 'Silver', 'Chandra Barus', 29),
(33, 'BP 9135EF', 'SUV', 'Coklat', 'Doni Damanik', 30),
(34, 'BP 0246GH', 'Jeep', 'Orange', 'Eka Saragih', 31),
(35, 'BP 1357IJ', 'Motor', 'Ungu', 'Fikri Purba', 32),
(36, 'BP 2468KL', 'Mobil', 'Pink', 'Gilang Sembiring', 33),
(37, 'BP 3579MN', 'Bus', 'Tosca', 'Hendra Gurning', 34),
(38, 'BP 4680OP', 'Truk', 'Navy', 'Irfan Munte', 35),
(39, 'BP 5791QR', 'Pickup', 'Maroon', 'Jamil Tumanggor', 36),
(40, 'BP 6802ST', 'Van', 'Cream', 'Kurniawan Sukamto', 37),
(41, 'BP 7913UV', 'Minibus', 'Beige', 'Lukman Wijaya', 38),
(42, 'BP 8024WX', 'Sedan', 'Gold', 'Mahmud Kusumo', 39),
(43, 'BP 9135YZ', 'SUV', 'Bronze', 'Nanda Prakoso', 40),
(44, 'BP 0246AB', 'Jeep', 'Coklat Muda', 'Opik Wibowo', 41),
(45, 'BP 1357CD', 'Motor', 'Merah', 'Panji Setiawan', 42),
(46, 'BP 2468EF', 'Mobil', 'Biru', 'Qasim Firmansyah', 43),
(47, 'BP 3579GH', 'Bus', 'Hijau', 'Rizki Saputro', 44),
(48, 'BP 4680IJ', 'Truk', 'Kuning', 'Samsul Anggoro', 45),
(49, 'BP 5791KL', 'Pickup', 'Hitam', 'Taufik Mustofa', 46),
(50, 'BP 6802MN', 'Van', 'Putih', 'Usman Rahmadi', 47),
(51, 'BP 7913OP', 'Minibus', 'Abu-abu', 'Vino Fadillah', 48),
(52, 'BP 8024QR', 'Sedan', 'Silver', 'Wawan Maulana', 49),
(53, 'BP 9135ST', 'SUV', 'Coklat', 'Yoga Hakim', 50),
(54, 'BP 0246UV', 'Jeep', 'Orange', 'Zaki Siddiq', 51),
(55, 'BP 1357WX', 'Motor', 'Ungu', 'Abdul Farhan', 52),
(56, 'BP 2468YZ', 'Mobil', 'Pink', 'Bambang Rizky', 53),
(57, 'BP 3579AB', 'Bus', 'Tosca', 'Cipto Pratama', 54),
(58, 'BP 4680CD', 'Truk', 'Navy', 'Darmawan Surya', 55),
(59, 'BP 5791EF', 'Pickup', 'Maroon', 'Edi Maulana', 56),
(60, 'BP 6802GH', 'Van', 'Cream', 'Fauzi Hakim', 57),
(61, 'BP 7913IJ', 'Minibus', 'Beige', 'Gunawan Fadillah', 58),
(62, 'BP 8024KL', 'Sedan', 'Gold', 'Hidayat Siddiq', 59),
(63, 'BP 9135MN', 'SUV', 'Bronze', 'Imam Farhan', 60),
(64, 'BP 0246OP', 'Jeep', 'Coklat Muda', 'Jaka Rizky', 61),
(65, 'BP 1357QR', 'Motor', 'Merah', 'Khalid Pratama', 62),
(66, 'BP 2468ST', 'Mobil', 'Biru', 'Lutfi Surya', 63),
(67, 'BP 3579UV', 'Bus', 'Hijau', 'Maman Maulana', 64),
(68, 'BP 4680WX', 'Truk', 'Kuning', 'Nanda Hakim', 65),
(69, 'BP 5791YZ', 'Pickup', 'Hitam', 'Opik Siddiq', 66),
(70, 'BP 6802AB', 'Van', 'Putih', 'Putra Farhan', 67),
(71, 'BP 7913CD', 'Minibus', 'Abu-abu', 'Qodar Rizky', 68),
(72, 'BP 8024EF', 'Sedan', 'Silver', 'Rahmat Pratama', 69),
(73, 'BP 9135GH', 'SUV', 'Coklat', 'Sigit Surya', 70),
(74, 'BP 0246IJ', 'Jeep', 'Orange', 'Teguh Maulana', 71),
(75, 'BP 1357KL', 'Motor', 'Ungu', 'Ujang Hakim', 72),
(76, 'BP 2468MN', 'Mobil', 'Pink', 'Verdi Siddiq', 73),
(77, 'BP 3579OP', 'Bus', 'Tosca', 'Wahid Farhan', 74),
(78, 'BP 4680QR', 'Truk', 'Navy', 'Yusuf Rizky', 75),
(79, 'BP 5791ST', 'Pickup', 'Maroon', 'Zulham Pratama', 76),
(80, 'BP 6802UV', 'Van', 'Cream', 'Amin Surya', 77),
(81, 'BP 7913WX', 'Minibus', 'Beige', 'Bayu Maulana', 78),
(82, 'BP 8024YZ', 'Sedan', 'Gold', 'Chandra Hakim', 79),
(83, 'BP 9135AB', 'SUV', 'Bronze', 'Diki Siddiq', 80),
(84, 'BP 0246CD', 'Jeep', 'Coklat Muda', 'Erik Farhan', 81),
(85, 'BP 1357EF', 'Motor', 'Merah', 'Fajar Rizky', 82),
(86, 'BP 2468GH', 'Mobil', 'Biru', 'Gani Pratama', 83),
(87, 'BP 3579IJ', 'Bus', 'Hijau', 'Hadi Surya', 84),
(88, 'BP 4680KL', 'Truk', 'Kuning', 'Irfan Maulana', 85),
(89, 'BP 5791MN', 'Pickup', 'Hitam', 'Joko Hakim', 86),
(90, 'BP 6802OP', 'Van', 'Putih', 'Kusumo Siddiq', 87),
(91, 'BP 7913QR', 'Minibus', 'Abu-abu', 'Lukman Farhan', 88),
(92, 'BP 8024ST', 'Sedan', 'Silver', 'Mahmud Rizky', 89),
(93, 'BP 9135UV', 'SUV', 'Coklat', 'Nur Pratama', 90),
(94, 'BP 0246WX', 'Jeep', 'Orange', 'Omar Surya', 91),
(95, 'BP 1357YZ', 'Motor', 'Ungu', 'Prabowo Maulana', 92),
(96, 'BP 2468AB', 'Mobil', 'Pink', 'Qori Hakim', 93),
(97, 'BP 3579CD', 'Bus', 'Tosca', 'Rudi Siddiq', 94),
(98, 'BP 4680EF', 'Truk', 'Navy', 'Sukma Farhan', 95),
(99, 'BP 5791GH', 'Pickup', 'Maroon', 'Toni Rizky', 96),
(100, 'BP 6802IJ', 'Van', 'Cream', 'Umar Pratama', 97),
(101, 'BP 7913KL', 'Minibus', 'Beige', 'Victor Surya', 98),
(102, 'BP 8024MN', 'Sedan', 'Gold', 'Wahyu Maulana', 99),
(103, 'BP 9135OP', 'SUV', 'Bronze', 'Yanto Hakim', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tarif`
--

CREATE TABLE `tb_tarif` (
  `id_tarif` int(11) NOT NULL,
  `jenis_kendaraan` enum('motor','mobil','lainnya','') NOT NULL,
  `tarif_per_jam` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_tarif`
--

INSERT INTO `tb_tarif` (`id_tarif`, `jenis_kendaraan`, `tarif_per_jam`) VALUES
(1, 'motor', 2000),
(2, 'mobil', 5000),
(3, 'lainnya', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_parkir` int(11) NOT NULL,
  `id_kendaraan` int(11) DEFAULT NULL,
  `waktu_masuk` datetime DEFAULT NULL,
  `waktu_keluar` datetime DEFAULT NULL,
  `id_tarif` int(11) DEFAULT NULL,
  `durasi_jam` int(5) DEFAULT NULL,
  `biaya_total` decimal(10,0) DEFAULT NULL,
  `status` enum('masuk','keluar','.') DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_parkir`, `id_kendaraan`, `waktu_masuk`, `waktu_keluar`, `id_tarif`, `durasi_jam`, `biaya_total`, `status`, `id_user`, `id_area`) VALUES
(2, 1, '2026-02-25 09:06:00', '2026-02-25 11:10:00', 1, 3, 6000, 'keluar', 51, 1),
(3, 2, '2026-02-25 13:42:00', '2026-02-25 13:46:00', 1, 1, 2000, 'keluar', 51, 1),
(4, 2, '2026-02-25 13:42:00', '2026-02-25 13:46:00', 1, 1, 2000, 'keluar', 51, 1),
(5, 3, '2026-02-25 13:45:00', '2026-02-25 13:50:00', 2, 1, 5000, 'keluar', 51, 1),
(6, 3, '2026-02-26 08:17:00', NULL, 2, NULL, NULL, 'masuk', 51, 1),
(7, 1, '2025-01-26 08:30:00', NULL, 1, NULL, NULL, 'masuk', 2, 1),
(8, 2, '2025-01-26 09:15:00', '2026-02-26 10:33:00', 2, 9506, 47530000, 'keluar', 3, 2),
(9, 3, '2025-01-26 10:00:00', NULL, 3, NULL, NULL, 'masuk', 4, 3),
(10, 4, '2025-01-26 11:30:00', NULL, 4, NULL, NULL, 'masuk', 5, 4),
(11, 5, '2025-01-26 12:45:00', NULL, 5, NULL, NULL, 'masuk', 6, 5),
(12, 6, '2025-01-26 13:20:00', NULL, 6, NULL, NULL, 'masuk', 7, 6),
(13, 7, '2025-01-26 14:10:00', NULL, 7, NULL, NULL, 'masuk', 8, 7),
(14, 8, '2025-01-26 15:00:00', NULL, 8, NULL, NULL, 'masuk', 9, 8),
(15, 9, '2025-01-26 16:30:00', NULL, 9, NULL, NULL, 'masuk', 10, 9),
(16, 10, '2025-01-26 17:45:00', NULL, 10, NULL, NULL, 'masuk', 11, 10),
(17, 11, '2025-01-25 08:00:00', NULL, 11, NULL, NULL, 'masuk', 12, 11),
(18, 12, '2025-01-25 09:30:00', NULL, 12, NULL, NULL, 'masuk', 13, 12),
(19, 13, '2025-01-25 10:15:00', NULL, 13, NULL, NULL, 'masuk', 14, 13),
(20, 14, '2025-01-25 11:45:00', NULL, 14, NULL, NULL, 'masuk', 15, 14),
(21, 15, '2025-01-25 12:30:00', NULL, 15, NULL, NULL, 'masuk', 16, 15),
(22, 16, '2025-01-25 13:15:00', NULL, 16, NULL, NULL, 'masuk', 17, 16),
(23, 17, '2025-01-25 14:00:00', NULL, 17, NULL, NULL, 'masuk', 18, 17),
(24, 18, '2025-01-25 15:30:00', NULL, 18, NULL, NULL, 'masuk', 19, 18),
(25, 19, '2025-01-25 16:15:00', NULL, 19, NULL, NULL, 'masuk', 20, 19),
(26, 20, '2025-01-25 17:00:00', NULL, 20, NULL, NULL, 'masuk', 21, 20),
(27, 21, '2025-01-24 08:45:00', NULL, 21, NULL, NULL, 'masuk', 22, 21),
(28, 22, '2025-01-24 09:20:00', NULL, 22, NULL, NULL, 'masuk', 23, 22),
(29, 23, '2025-01-24 10:30:00', NULL, 23, NULL, NULL, 'masuk', 24, 23),
(30, 24, '2025-01-24 11:15:00', NULL, 24, NULL, NULL, 'masuk', 25, 24),
(31, 25, '2025-01-24 12:00:00', NULL, 25, NULL, NULL, 'masuk', 26, 25),
(32, 26, '2025-01-24 13:45:00', NULL, 26, NULL, NULL, 'masuk', 27, 26),
(33, 27, '2025-01-24 14:30:00', NULL, 27, NULL, NULL, 'masuk', 28, 27),
(34, 28, '2025-01-24 15:15:00', NULL, 28, NULL, NULL, 'masuk', 29, 28),
(35, 29, '2025-01-24 16:00:00', NULL, 29, NULL, NULL, 'masuk', 30, 29),
(36, 30, '2025-01-24 17:30:00', NULL, 30, NULL, NULL, 'masuk', 31, 30),
(37, 31, '2025-01-23 08:15:00', NULL, 31, NULL, NULL, 'masuk', 32, 31),
(38, 32, '2025-01-23 09:00:00', NULL, 32, NULL, NULL, 'masuk', 33, 32),
(39, 33, '2025-01-23 10:45:00', NULL, 33, NULL, NULL, 'masuk', 34, 33),
(40, 34, '2025-01-23 11:30:00', NULL, 34, NULL, NULL, 'masuk', 35, 34),
(41, 35, '2025-01-23 12:15:00', NULL, 35, NULL, NULL, 'masuk', 36, 35),
(42, 36, '2025-01-23 13:00:00', NULL, 36, NULL, NULL, 'masuk', 37, 36),
(43, 37, '2025-01-23 14:45:00', NULL, 37, NULL, NULL, 'masuk', 38, 37),
(44, 38, '2025-01-23 15:30:00', NULL, 38, NULL, NULL, 'masuk', 39, 38),
(45, 39, '2025-01-23 16:15:00', NULL, 39, NULL, NULL, 'masuk', 40, 39),
(46, 40, '2025-01-23 17:00:00', NULL, 40, NULL, NULL, 'masuk', 41, 40),
(47, 41, '2025-01-22 08:30:00', NULL, 41, NULL, NULL, 'masuk', 42, 41),
(48, 42, '2025-01-22 09:15:00', NULL, 42, NULL, NULL, 'masuk', 43, 42),
(49, 43, '2025-01-22 10:00:00', NULL, 43, NULL, NULL, 'masuk', 44, 43),
(50, 44, '2025-01-22 11:45:00', NULL, 44, NULL, NULL, 'masuk', 45, 44),
(51, 45, '2025-01-22 12:30:00', NULL, 45, NULL, NULL, 'masuk', 46, 45),
(52, 46, '2025-01-22 13:15:00', NULL, 46, NULL, NULL, 'masuk', 47, 46),
(53, 47, '2025-01-22 14:00:00', NULL, 47, NULL, NULL, 'masuk', 48, 47),
(54, 48, '2025-01-22 15:45:00', NULL, 48, NULL, NULL, 'masuk', 49, 48),
(55, 49, '2025-01-22 16:30:00', NULL, 49, NULL, NULL, 'masuk', 50, 49),
(56, 50, '2025-01-22 17:15:00', NULL, 50, NULL, NULL, 'masuk', 51, 50),
(57, 51, '2025-01-21 08:00:00', NULL, 51, NULL, NULL, 'masuk', 52, 51),
(58, 52, '2025-01-21 09:30:00', NULL, 52, NULL, NULL, 'masuk', 53, 52),
(59, 53, '2025-01-21 10:15:00', NULL, 53, NULL, NULL, 'masuk', 54, 53),
(60, 54, '2025-01-21 11:00:00', NULL, 54, NULL, NULL, 'masuk', 55, 54),
(61, 55, '2025-01-21 12:45:00', NULL, 55, NULL, NULL, 'masuk', 56, 55),
(62, 56, '2025-01-21 13:30:00', NULL, 56, NULL, NULL, 'masuk', 57, 56),
(63, 57, '2025-01-21 14:15:00', NULL, 57, NULL, NULL, 'masuk', 58, 57),
(64, 58, '2025-01-21 15:00:00', NULL, 58, NULL, NULL, 'masuk', 59, 58),
(65, 59, '2025-01-21 16:45:00', NULL, 59, NULL, NULL, 'masuk', 60, 59),
(66, 60, '2025-01-21 17:30:00', NULL, 60, NULL, NULL, 'masuk', 61, 60),
(67, 61, '2025-01-20 08:00:00', '2025-01-20 12:00:00', 61, 4, 28800, 'keluar', 62, 61),
(68, 62, '2025-01-20 09:30:00', '2025-01-20 14:30:00', 62, 5, 32000, 'keluar', 63, 62),
(69, 63, '2025-01-20 10:15:00', '2025-01-20 15:15:00', 63, 5, 61000, 'keluar', 64, 63),
(70, 64, '2025-01-20 11:45:00', '2025-01-20 16:45:00', 64, 5, 92000, 'keluar', 65, 64),
(71, 65, '2025-01-20 12:30:00', '2025-01-20 15:30:00', 65, 3, 24600, 'keluar', 66, 65),
(72, 66, '2025-01-20 13:15:00', '2025-01-20 18:15:00', 66, 5, 36000, 'keluar', 67, 66),
(73, 67, '2025-01-20 14:00:00', '2025-01-20 19:00:00', 67, 5, 46000, 'keluar', 68, 67),
(74, 68, '2025-01-20 15:30:00', '2025-01-20 18:30:00', 68, 3, 20700, 'keluar', 69, 68),
(75, 69, '2025-01-20 16:15:00', '2025-01-20 20:15:00', 69, 4, 30000, 'keluar', 70, 69),
(76, 70, '2025-01-20 17:00:00', '2025-01-20 21:00:00', 70, 4, 34000, 'keluar', 71, 70),
(77, 71, '2025-01-19 08:45:00', '2025-01-19 13:45:00', 71, 5, 17000, 'keluar', 72, 71),
(78, 72, '2025-01-19 09:20:00', '2025-01-19 14:20:00', 72, 5, 33000, 'keluar', 73, 72),
(79, 73, '2025-01-19 10:30:00', '2025-01-19 15:30:00', 73, 5, 47000, 'keluar', 74, 73),
(80, 74, '2025-01-19 11:15:00', '2025-01-19 16:15:00', 74, 5, 93000, 'keluar', 75, 74),
(81, 75, '2025-01-19 12:00:00', '2025-01-19 16:00:00', 75, 4, 33600, 'keluar', 76, 75),
(82, 76, '2025-01-19 13:45:00', '2025-01-19 18:45:00', 76, 5, 37000, 'keluar', 77, 76),
(83, 77, '2025-01-19 14:30:00', '2025-01-19 19:30:00', 77, 5, 47000, 'keluar', 78, 77),
(84, 78, '2025-01-19 15:15:00', '2025-01-19 18:15:00', 78, 3, 27600, 'keluar', 79, 78),
(85, 79, '2025-01-19 16:00:00', '2025-01-19 20:00:00', 79, 4, 27600, 'keluar', 80, 79),
(86, 80, '2025-01-19 17:30:00', '2025-01-19 21:30:00', 80, 4, 30800, 'keluar', 81, 80),
(87, 81, '2025-01-18 08:15:00', '2025-01-18 12:15:00', 81, 4, 13600, 'keluar', 82, 81),
(88, 82, '2025-01-18 09:00:00', '2025-01-18 14:00:00', 82, 5, 37000, 'keluar', 83, 82),
(89, 83, '2025-01-18 10:45:00', '2025-01-18 15:45:00', 83, 5, 47000, 'keluar', 84, 83),
(90, 84, '2025-01-18 11:30:00', '2025-01-18 16:30:00', 84, 5, 93000, 'keluar', 85, 84),
(91, 85, '2025-01-18 12:15:00', '2025-01-18 15:15:00', 85, 3, 25200, 'keluar', 86, 85),
(92, 86, '2025-01-18 13:00:00', '2025-01-18 18:00:00', 86, 5, 37000, 'keluar', 87, 86),
(93, 87, '2025-01-18 14:45:00', '2025-01-18 19:45:00', 87, 5, 57000, 'keluar', 88, 87),
(94, 88, '2025-01-18 15:30:00', '2025-01-18 18:30:00', 88, 3, 28200, 'keluar', 89, 88),
(95, 89, '2025-01-18 16:15:00', '2025-01-18 20:15:00', 89, 4, 27600, 'keluar', 90, 89),
(96, 90, '2025-01-18 17:00:00', '2025-01-18 21:00:00', 90, 4, 31600, 'keluar', 91, 90),
(97, 91, '2025-01-17 08:30:00', '2025-01-17 13:30:00', 91, 5, 17000, 'keluar', 92, 91),
(98, 92, '2025-01-17 09:15:00', '2025-01-17 14:15:00', 92, 5, 33000, 'keluar', 93, 92),
(99, 93, '2025-01-17 10:00:00', '2025-01-17 15:00:00', 93, 5, 62000, 'keluar', 94, 93),
(100, 94, '2025-01-17 11:45:00', '2025-01-17 16:45:00', 94, 5, 93000, 'keluar', 95, 94),
(101, 95, '2025-01-17 12:30:00', '2025-01-17 16:30:00', 95, 4, 33600, 'keluar', 96, 95),
(102, 96, '2025-01-17 13:15:00', '2025-01-17 18:15:00', 96, 5, 37000, 'keluar', 97, 96),
(103, 97, '2025-01-17 14:00:00', '2025-01-17 19:00:00', 97, 5, 42000, 'keluar', 98, 97),
(104, 98, '2025-01-17 15:45:00', '2025-01-17 18:45:00', 98, 3, 20700, 'keluar', 99, 98),
(105, 99, '2025-01-17 16:30:00', '2025-01-17 20:30:00', 99, 4, 27600, 'keluar', 100, 99),
(106, 100, '2025-01-17 17:15:00', '2025-01-17 21:15:00', 100, 4, 49600, 'keluar', 2, 100);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `email`, `password`, `level`, `foto`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `token`, `expiry`) VALUES
(51, 'Fernando', 'KF', 'KF@gmail.com', 'f457c545a9ded88f18ecee47145a72c0', 13, NULL, '2026-01-20 13:07:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'Chichi', 'Admin', 'Admin@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1, NULL, '2026-02-25 11:24:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Chloe', 'Petugas1', 'petugas1@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 14, NULL, '2026-02-25 11:25:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Hartono', 'Owner', 'Owner@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 15, NULL, '2026-02-25 11:25:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Ahmad Sutrisno', 'ahmad1', 'ahmad1@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(64, 'Budi Wahyudi', 'budi2', 'budi2@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(65, 'Cahyo Hidayat', 'cahyo3', 'cahyo3@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(66, 'Dedi Prabowo', 'dedi4', 'dedi4@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(67, 'Eko Santoso', 'eko5', 'eko5@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(68, 'Fajar Gunawan', 'fajar6', 'fajar6@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(69, 'Gani Saputra', 'gani7', 'gani7@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(70, 'Hadi Hidayatullah', 'hadi8', 'hadi8@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(71, 'Iwan Rahman', 'iwan9', 'iwan9@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(72, 'Joko Siregar', 'joko10', 'joko10@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(73, 'Kusumo Lubis', 'kusumo11', 'kusumo11@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(74, 'Lukman Nasution', 'lukman12', 'lukman12@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(75, 'Muhammad Harahap', 'muhammad13', 'muhammad13@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(76, 'Nur Siregar', 'nur14', 'nur14@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(77, 'Omar Panggabean', 'omar15', 'omar15@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(78, 'Prabowo Sitorus', 'prabowo16', 'prabowo16@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(79, 'Qori Pardede', 'qori17', 'qori17@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(80, 'Rudi Sinaga', 'rudi18', 'rudi18@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(81, 'Sukma Hutagalung', 'sukma19', 'sukma19@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(82, 'Toni Hutapea', 'toni20', 'toni20@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(83, 'Umar Nababan', 'umar21', 'umar21@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(84, 'Victor Simanjuntak', 'victor22', 'victor22@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(85, 'Wahyu Sihombing', 'wahyu23', 'wahyu23@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(86, 'Yanto Simbolon', 'yanto24', 'yanto24@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(87, 'Zainal Samosir', 'zainal25', 'zainal25@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(88, 'Adi Ginting', 'adi26', 'adi26@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(89, 'Bagus Karokaro', 'bagus27', 'bagus27@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(90, 'Chandra Barus', 'chandra28', 'chandra28@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(91, 'Doni Damanik', 'doni29', 'doni29@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(92, 'Eka Saragih', 'eka30', 'eka30@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(93, 'Fikri Purba', 'fikri31', 'fikri31@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(94, 'Gilang Sembiring', 'gilang32', 'gilang32@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(95, 'Hendra Gurning', 'hendra33', 'hendra33@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(96, 'Irfan Munte', 'irfan34', 'irfan34@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(97, 'Jamil Tumanggor', 'jamil35', 'jamil35@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(98, 'Kurniawan Sukamto', 'kurniawan36', 'kurniawan36@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(99, 'Lukman Wijaya', 'lukman37', 'lukman37@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(100, 'Mahmud Kusumo', 'mahmud38', 'mahmud38@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(101, 'Nanda Prakoso', 'nanda39', 'nanda39@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(102, 'Opik Wibowo', 'opik40', 'opik40@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(103, 'Panji Setiawan', 'panji41', 'panji41@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(104, 'Qasim Firmansyah', 'qasim42', 'qasim42@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(105, 'Rizki Saputro', 'rizki43', 'rizki43@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(106, 'Samsul Anggoro', 'samsul44', 'samsul44@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(107, 'Taufik Mustofa', 'taufik45', 'taufik45@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(108, 'Usman Rahmadi', 'usman46', 'usman46@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(109, 'Vino Fadillah', 'vino47', 'vino47@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(110, 'Wawan Maulana', 'wawan48', 'wawan48@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(111, 'Yoga Hakim', 'yoga49', 'yoga49@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(112, 'Zaki Siddiq', 'zaki50', 'zaki50@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(113, 'Abdul Farhan', 'abdul51', 'abdul51@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(114, 'Bambang Rizky', 'bambang52', 'bambang52@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(115, 'Cipto Pratama', 'cipto53', 'cipto53@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(116, 'Darmawan Surya', 'darmawan54', 'darmawan54@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(117, 'Edi Maulana', 'edi55', 'edi55@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(118, 'Fauzi Hakim', 'fauzi56', 'fauzi56@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(119, 'Gunawan Fadillah', 'gunawan57', 'gunawan57@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(120, 'Hidayat Siddiq', 'hidayat58', 'hidayat58@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(121, 'Imam Farhan', 'imam59', 'imam59@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(122, 'Jaka Rizky', 'jaka60', 'jaka60@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(123, 'Khalid Pratama', 'khalid61', 'khalid61@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(124, 'Lutfi Surya', 'lutfi62', 'lutfi62@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(125, 'Maman Maulana', 'maman63', 'maman63@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(126, 'Nanda Hakim', 'nanda64', 'nanda64@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(127, 'Opik Siddiq', 'opik65', 'opik65@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(128, 'Putra Farhan', 'putra66', 'putra66@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(129, 'Qodar Rizky', 'qodar67', 'qodar67@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(130, 'Rahmat Pratama', 'rahmat68', 'rahmat68@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(131, 'Sigit Surya', 'sigit69', 'sigit69@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(132, 'Teguh Maulana', 'teguh70', 'teguh70@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(133, 'Ujang Hakim', 'ujang71', 'ujang71@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(134, 'Verdi Siddiq', 'verdi72', 'verdi72@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(135, 'Wahid Farhan', 'wahid73', 'wahid73@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(136, 'Yusuf Rizky', 'yusuf74', 'yusuf74@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(137, 'Zulham Pratama', 'zulham75', 'zulham75@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(138, 'Amin Surya', 'amin76', 'amin76@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(139, 'Bayu Maulana', 'bayu77', 'bayu77@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(140, 'Chandra Hakim', 'chandra78', 'chandra78@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(141, 'Diki Siddiq', 'diki79', 'diki79@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(142, 'Erik Farhan', 'erik80', 'erik80@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(143, 'Fajar Rizky', 'fajar81', 'fajar81@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(144, 'Gani Pratama', 'gani82', 'gani82@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(145, 'Hadi Surya', 'hadi83', 'hadi83@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(146, 'Irfan Maulana', 'irfan84', 'irfan84@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(147, 'Joko Hakim', 'joko85', 'joko85@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(148, 'Kusumo Siddiq', 'kusumo86', 'kusumo86@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(149, 'Lukman Farhan', 'lukman87', 'lukman87@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(150, 'Mahmud Rizky', 'mahmud88', 'mahmud88@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(151, 'Nur Pratama', 'nur89', 'nur89@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(152, 'Omar Surya', 'omar90', 'omar90@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(153, 'Prabowo Maulana', 'prabowo91', 'prabowo91@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(154, 'Qori Hakim', 'qori92', 'qori92@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(155, 'Rudi Siddiq', 'rudi93', 'rudi93@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(156, 'Sukma Farhan', 'sukma94', 'sukma94@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(157, 'Toni Rizky', 'toni95', 'toni95@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(158, 'Umar Pratama', 'umar96', 'umar96@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(159, 'Victor Surya', 'victor97', 'victor97@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(160, 'Wahyu Maulana', 'wahyu98', 'wahyu98@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(161, 'Yanto Hakim', 'yanto99', 'yanto99@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL),
(162, 'Zainal Siddiq', 'zainal100', 'zainal100@parkir.com', '5d41402abc4b2a76b9719d911017c592', 14, NULL, '2026-02-26 09:31:46', NULL, '2026-02-26 09:31:46', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `web_detail`
--

CREATE TABLE `web_detail` (
  `id_detail` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `autentikasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `web_detail`
--

INSERT INTO `web_detail` (`id_detail`, `title`, `logo`, `autentikasi`) VALUES
(1, 'One Batam Mall || Parking Management', '1771995163_c931f46371221f21d315.png', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id_form`) USING BTREE,
  ADD KEY `jenis_form` (`jenis_form`),
  ADD KEY `status_delete` (`status_delete`);

--
-- Indexes for table `group_form`
--
ALTER TABLE `group_form`
  ADD PRIMARY KEY (`id_form`,`id_level`) USING BTREE,
  ADD KEY `id_level` (`id_level`),
  ADD KEY `status_delete` (`status_delete`);

--
-- Indexes for table `hak_akses_user`
--
ALTER TABLE `hak_akses_user`
  ADD PRIMARY KEY (`id_hak_akses`) USING BTREE,
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `status_delete` (`status_delete`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`) USING BTREE;

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_area_parkir`
--
ALTER TABLE `tb_area_parkir`
  ADD PRIMARY KEY (`id_area`);

--
-- Indexes for table `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `warna` (`warna`),
  ADD KEY `jenis_kendaraan` (`jenis_kendaraan`);

--
-- Indexes for table `tb_tarif`
--
ALTER TABLE `tb_tarif`
  ADD PRIMARY KEY (`id_tarif`),
  ADD KEY `jenis_kendaraan` (`jenis_kendaraan`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_parkir`),
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `id_tarif` (`id_tarif`),
  ADD KEY `status` (`status`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_area` (`id_area`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`) USING BTREE,
  ADD KEY `level` (`level`);

--
-- Indexes for table `web_detail`
--
ALTER TABLE `web_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id_form` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `hak_akses_user`
--
ALTER TABLE `hak_akses_user`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `tb_area_parkir`
--
ALTER TABLE `tb_area_parkir`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tb_tarif`
--
ALTER TABLE `tb_tarif`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_parkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `web_detail`
--
ALTER TABLE `web_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
