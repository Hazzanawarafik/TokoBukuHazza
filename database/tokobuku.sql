-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 13, 2022 at 09:31 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'Admin', ''),
(2, 'Keryawan', '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 1),
(2, 2),
(2, 4),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'karyawanbaru@gmail.com', 5, '2022-07-25 00:45:31', 1),
(2, '::1', 'karyawanbaru@gmail.com', 5, '2022-07-25 00:46:18', 1),
(3, '::1', 'admin@gmail.com', 5, '2022-07-25 01:03:58', 1),
(4, '::1', 'karyawanbaru@gmail.com', 6, '2022-07-25 01:13:17', 1),
(5, '::1', 'admin@gmail.com', 5, '2022-07-25 01:39:51', 1),
(6, '::1', 'karyawanbaru@gmail.com', 6, '2022-07-25 03:05:01', 1),
(7, '::1', 'admin@gmail.com', 5, '2022-07-25 03:05:14', 1),
(8, '::1', 'admin@gmail.com', 5, '2022-07-25 21:54:00', 1),
(9, '::1', 'admin@gmail.com', 5, '2022-07-26 19:40:21', 1),
(10, '::1', 'admin@gmail.com', 5, '2022-07-28 07:40:51', 1),
(11, '::1', 'admin@gmail.com', 5, '2022-07-28 08:39:23', 1),
(12, '::1', 'admin@gmail.com', 5, '2022-07-29 08:54:19', 1),
(13, '::1', 'admin@gmail.com', 5, '2022-07-29 12:35:01', 1),
(14, '::1', 'admin@gmail.com', 5, '2022-08-04 09:57:52', 1),
(15, '::1', 'admin@gmail.com', 5, '2022-08-05 08:43:16', 1),
(16, '::1', 'admin@gmail.com', 5, '2022-08-05 13:10:02', 1),
(17, '::1', 'admin@gmail.com', 5, '2022-08-05 22:41:15', 1),
(18, '::1', 'admin@gmail.com', 5, '2022-08-06 10:11:22', 1),
(19, '::1', 'admin@gmail.com', 5, '2022-08-06 22:07:30', 1),
(20, '::1', 'admin@gmail.com', 5, '2022-08-07 01:42:07', 1),
(21, '::1', 'admin@gmail.com', 5, '2022-08-07 18:50:54', 1),
(22, '::1', 'admin@gmail.com', 5, '2022-08-08 07:23:53', 1),
(23, '::1', 'admin@gmail.com', 5, '2022-08-08 13:13:41', 1),
(24, '::1', 'admin@gmail.com', 5, '2022-08-08 21:24:26', 1),
(25, '::1', 'admin@gmail.com', 5, '2022-08-09 07:28:48', 1),
(26, '::1', 'admin@gmail.com', 5, '2022-08-09 12:22:33', 1),
(27, '::1', 'admin@gmail.com', 5, '2022-08-09 19:40:50', 1),
(28, '::1', 'admin@gmail.com', 5, '2022-08-10 07:28:49', 1),
(29, '::1', 'admin@gmail.com', 5, '2022-08-10 12:47:13', 1),
(30, '::1', 'admin@gmail.com', 5, '2022-08-11 08:10:48', 1),
(31, '::1', 'admin@gmail.com', 5, '2022-08-11 20:42:40', 1),
(32, '::1', 'admin@gmail.com', 5, '2022-08-12 07:37:41', 1),
(33, '::1', 'admin@gmail.com', 5, '2022-08-13 12:45:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'beranda', 'Menu Beranda'),
(2, 'data-buku', 'Menu Data Buku'),
(3, 'tambah-buku', 'Tambah Data Buku'),
(4, 'detail-buku', 'Detail Data Buku'),
(5, 'ubah-buku', 'Ubah Data Buku'),
(6, 'hapus-buku', 'Hapus Data Buku'),
(7, 'data-galeri', 'Menu Data Galeri'),
(8, 'data-customer', 'Menu Data Customer'),
(9, 'data-supplier', 'Menu Data Supplier'),
(10, 'create-users', 'Tambah Data Users'),
(11, 'read-users', 'List Data Users'),
(12, 'update-users', 'Edit Data Users'),
(13, 'delete-users', 'Hapus Data User'),
(14, 'reset-password', 'Reset Password User');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_users_permissions`
--

INSERT INTO `auth_users_permissions` (`user_id`, `permission_id`) VALUES
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(6, 1),
(6, 2),
(6, 4),
(6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `release_year` smallint(4) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `discount` decimal(4,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `book_category_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `slug`, `release_year`, `author`, `price`, `discount`, `stock`, `cover`, `book_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mencari Cahaya', 'mencari-cahaya', 2014, 'Hazza Nawarafi Khairullah', 85000, '1', 100, '', 4, '2022-07-11 08:51:32', '2022-07-13 20:43:03', '2022-07-13 20:43:03'),
(2, 'Sang Pejuang 2', 'sang-pejuang-2', 2015, 'Rafi KhairullahRafi Khairullah', 55000, '0', 32, 'default.png', 1, '2022-07-11 08:55:03', '2022-08-12 07:51:03', NULL),
(3, 'Sejarah Indonesia', 'sejarah-indonesia', 2010, 'Khairullah', 100000, '0', 70, '1657773182_13d9dacba56100b02381.jpg', 4, '2022-07-11 08:55:03', '2022-07-14 00:24:03', '2022-07-14 00:24:03'),
(9, '', '', 0, '', 0, '0', 0, '', 0, '2022-07-12 03:03:02', '2022-07-12 03:03:02', NULL),
(14, 'Laskar Pelangi', 'laskar-pelangi', 32767, 'Rafiiiii', 234234, '9999', 543456, '', 1, '2022-07-13 01:36:20', '2022-07-13 20:46:17', '2022-07-13 20:46:17'),
(15, 'fasdf', 'fasdf', 3242, 'fasdfa', 234, '423', 4234, '', 4, '2022-07-13 21:53:36', '2022-07-14 00:30:29', '2022-07-14 00:30:29'),
(16, 'afsdfasd', 'afsdfasd', 32767, 'fsafsf', 4234320, '9999', 2147483647, 'fasdfa.jpeg', 2, '2022-07-13 21:56:12', '2022-07-14 00:24:13', '2022-07-14 00:24:13'),
(17, 'fagadgdag', 'fagadgdag', 32767, 'gdgsfgs', 879789, '9999', 867868, '1657767542_b031beb66b8be4dba0a1.jpeg', 4, '2022-07-13 21:59:02', '2022-07-14 00:24:20', '2022-07-14 00:24:20'),
(18, 'fasdfasdfasdfgf', 'fasdfasdfasdfgf', 32767, 'gsdfgsdfg', 213564, '9999', 654897, '1657769277_5d652ce0e3beca03da17.jpg', 3, '2022-07-13 22:27:57', '2022-07-14 00:23:57', '2022-07-14 00:23:57'),
(19, 'gsdgdfhhgjmkgjhmfymy', 'gsdgdfhhgjmkgjhmfymy', 32767, 'nfynfytnjy', 75865, '9999', 143453, 'default.png', 2, '2022-07-13 22:30:08', '2022-07-14 00:30:26', '2022-07-14 00:30:26'),
(20, 'fafeewf', 'fafeewf', 4234, 'feawfefa', 34243, '9999', 24234, '1657776885_93d7c87a363cf6b143fe.jpeg', 4, '2022-07-14 00:34:45', '2022-07-26 22:30:11', '2022-07-26 22:30:11'),
(21, 'Buku 1 ', 'buku-1', 4234, 'Hazza', 50000, '0', 25, '1658993425_1ecf2b8e574a330a86f6.png', 4, '2022-07-25 22:41:58', '2022-08-05 13:20:55', NULL),
(22, 'Laptop Alien', 'laptop-alien', 1, 'Alien', 90000, '0', 35, '1658993400_a071affec7ba730f57e9.jpeg', 4, '2022-07-26 22:32:08', '2022-08-05 13:20:55', NULL),
(23, 'Laptop Dell', 'laptop-dell', 2000, 'Dell', 80000, '0', 43, '1658993388_3a8d9250eabed1a28723.png', 1, '2022-07-26 22:32:48', '2022-08-05 13:20:55', NULL),
(24, 'Naurto 1', 'naurto-1', 2000, 'Kisimoto', 50000, '2', 100, '1659968902_52529dda12de4a9c60c0.jpeg', 2, '2022-08-08 21:27:55', '2022-08-08 21:28:22', NULL),
(25, 'Naruto 2', 'naruto-2', 2001, 'Kisimoto', 50000, '2', 99, 'default.png', 2, '2022-08-08 21:27:55', '2022-08-13 14:11:06', NULL),
(26, 'Naurto 3', 'naurto-3', 2002, 'Kisimoto', 50000, '2', 99, 'default.png', 2, '2022-08-08 21:27:55', '2022-08-13 14:11:06', NULL),
(27, 'dscsdffasd', 'dscsdffasd', 32423, 'dfaga', 435, '9999', 323, '1660267546_2fb53dac262c726fdec2.png', 3, '2022-08-12 08:25:46', '2022-08-13 14:11:06', NULL),
(28, 'pokfpaokwe', 'pokfpaokwe', 3424, 'pofkaspdfk', 23423, '3424', 546, 'default.png', 3, '2022-08-12 08:26:21', '2022-08-12 08:34:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `book_category_id` int(5) NOT NULL,
  `name_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`book_category_id`, `name_category`) VALUES
(1, 'Novel'),
(2, 'Komik'),
(3, 'Buku Pelajaran'),
(4, 'Buku Sejarah'),
(5, 'Majalah');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `no_customer` varchar(100) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `no_customer`, `gender`, `address`, `email`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kunthara Prayoga S.E.', '8208747105937491', 'L', 'Gg. Jagakarsa No. 878, Palu 24913, Lampung', 'sudiati.rama@gmail.co.id', '0979 1071 0221', '1978-10-31 16:31:10', '1999-04-05 06:39:27', NULL),
(2, 'Gaman Wasita', '3326492904097475', 'L', 'Jln. Astana Anyar No. 386, Sabang 73098, Lampung', 'kmanullang@yahoo.co.id', '0685 3722 8815', '2022-07-09 15:43:12', '1971-07-06 18:37:50', NULL),
(3, 'Diah Jamalia Pratiwi S.Psi', '2171734709966594', 'L', 'Jln. Pahlawan No. 564, Bontang 14795, Sulbar', 'salman85@gmail.com', '(+62) 716 0875 9468', '1998-10-16 18:59:27', '2014-04-02 18:05:21', NULL),
(4, 'Martaka Baktianto Widodo M.Pd', '3317655010975012', 'L', 'Gg. Flora No. 816, Tangerang 84679, DIY', 'darmanto64@budiman.biz', '0684 7192 3799', '2017-06-28 23:32:19', '1990-08-10 08:13:00', NULL),
(5, 'Teddy Ardianto', '1607455207030140', 'L', 'Dk. Antapani Lama No. 351, Palembang 72682, Kalteng', 'maida93@gmail.co.id', '(+62) 952 7903 550', '1993-09-09 15:03:57', '2015-03-22 21:31:49', NULL),
(6, 'Jasmin Sabrina Puspasari', '5308547112058671', 'L', 'Kpg. Zamrud No. 358, Padang 37756, Riau', 'gandewa.anggriawan@namaga.web.id', '(+62) 20 1153 1079', '1977-06-25 05:50:25', '1990-06-09 19:32:38', NULL),
(7, 'Jumari Rizki Prabowo', '7316076508190456', 'L', 'Kpg. Honggowongso No. 84, Tebing Tinggi 35580, Babel', 'bahuwirya98@lestari.sch.id', '0663 4941 7293', '1979-03-16 03:39:56', '2019-08-10 16:08:14', NULL),
(8, 'Tugiman Erik Putra S.Pt', '1801075410120493', 'L', 'Kpg. Urip Sumoharjo No. 900, Medan 98232, Pabar', 'jamal01@gmail.co.id', '0381 1064 110', '1986-11-15 02:30:00', '1995-06-25 03:33:08', NULL),
(9, 'Iriana Salwa Yolanda', '1173454103010572', 'L', 'Kpg. Pahlawan No. 164, Padang 37119, Sulsel', 'luhung.kurniawan@safitri.name', '(+62) 816 812 956', '1976-06-23 19:31:32', '1981-08-27 07:35:42', NULL),
(10, 'Ulya Halimah', '1771666005956391', 'L', 'Jr. Bahagia No. 548, Banjar 60421, Kalsel', 'michelle10@handayani.go.id', '0990 1339 4650', '1973-10-23 06:00:47', '2014-03-18 08:29:36', NULL),
(11, 'Raina Aryani', '6309770911933579', 'L', 'Ds. Setia Budi No. 179, Samarinda 90261, Maluku', 'prakasa.tira@simanjuntak.org', '0425 9724 499', '1998-08-19 21:31:54', '1982-07-03 11:39:42', NULL),
(12, 'Wulan Hasanah', '1701001202946418', 'L', 'Ki. Ters. Jakarta No. 738, Tanjungbalai 83683, Papua', 'dabukke.mutia@yahoo.co.id', '023 7101 3334', '2020-10-22 22:13:53', '1973-04-20 03:28:58', NULL),
(13, 'Pandu Prasasta S.Psi', '1608420911980541', 'L', 'Jln. Bata Putih No. 738, Gunungsitoli 36046, Aceh', 'damar28@yahoo.com', '(+62) 286 7057 0149', '1972-11-12 21:21:08', '1980-08-27 05:20:06', NULL),
(14, 'Bakiman Sihombing', '1373213011214736', 'L', 'Ds. Hasanuddin No. 600, Palopo 68578, Jatim', 'kamila.pradipta@wijayanti.sch.id', '(+62) 541 5147 2430', '1974-11-20 17:25:48', '1982-07-20 13:55:52', NULL),
(15, 'Ajimat Hutagalung', '3273444910028960', 'L', 'Gg. Babakan No. 758, Bima 18830, Kalsel', 'brajata@yahoo.com', '(+62) 658 2162 214', '1975-05-10 01:36:34', '2000-09-15 05:16:05', NULL),
(16, 'Aurora Wulandari', '7403832705043602', 'L', 'Jln. Babadan No. 952, Banda Aceh 86202, Sultra', 'ian.damanik@gmail.com', '025 9297 1921', '2006-01-12 19:49:54', '1979-09-20 01:29:30', NULL),
(17, 'Uchita Susanti', '1805004305185909', 'L', 'Ki. Abdul Rahmat No. 890, Tangerang 61925, Sulteng', 'silvia.hartati@kusmawati.id', '(+62) 356 0589 7076', '1988-12-15 19:23:49', '1982-08-10 05:25:39', NULL),
(18, 'Halima Kuswandari S.E.I', '9104470906106910', 'L', 'Jln. Diponegoro No. 184, Pekalongan 95354, Gorontalo', 'ella.kuswandari@nugroho.tv', '0654 0031 4749', '2012-03-30 01:02:02', '1996-01-01 22:07:21', NULL),
(19, 'Diana Anastasia Rahayu S.Psi', '9120007105962447', 'L', 'Ki. B.Agam 1 No. 824, Administrasi Jakarta Pusat 20625, Kaltim', 'lailasari.bambang@kusumo.go.id', '020 0310 636', '1986-02-28 14:02:06', '1995-09-04 12:32:32', NULL),
(20, 'Natalia Puspasari S.E.', '1203400304137441', 'L', 'Jr. Jamika No. 295, Palu 63548, Jatim', 'amalia62@yahoo.com', '(+62) 444 1056 791', '2006-04-11 09:47:44', '1972-06-01 02:23:33', NULL),
(21, 'Maida Puti Zulaika', '9120320209205057', 'L', 'Jr. Yohanes No. 93, Solok 92300, Kalsel', 'jnugroho@mandasari.go.id', '(+62) 21 0094 5191', '2000-06-21 07:07:49', '1996-05-23 17:36:25', NULL),
(22, 'Safina Novitasari', '1308484112083736', 'L', 'Ki. Jagakarsa No. 417, Solok 38449, Maluku', 'tarihoran.cemeti@simanjuntak.in', '0701 7863 8434', '2002-12-27 02:48:25', '1986-06-03 07:53:46', NULL),
(23, 'Vivi Padmi Hariyah', '9207414608091127', 'L', 'Gg. Bawal No. 844, Tegal 14629, Bali', 'puti.latupono@kusmawati.in', '0703 6675 501', '1991-04-30 08:40:22', '1970-05-04 01:29:11', NULL),
(24, 'Kasiyah Ira Pratiwi', '3371210701022151', 'L', 'Ki. Kyai Gede No. 450, Salatiga 71631, Kepri', 'pratiwi.emong@gmail.com', '(+62) 648 3813 549', '2017-06-10 22:21:45', '1997-12-20 10:58:08', NULL),
(25, 'Puji Belinda Wastuti S.I.Kom', '5302232303054122', 'L', 'Dk. Baja Raya No. 528, Mataram 18433, Kalteng', 'aris07@palastri.co', '0217 9576 9306', '1979-12-21 12:05:47', '2000-11-14 14:14:00', NULL),
(26, 'Agus Maulana', '1571350810931491', 'L', 'Ds. Pasir Koja No. 279, Tarakan 75888, Bengkulu', 'gasti84@yahoo.co.id', '(+62) 948 3796 485', '2013-01-05 06:39:05', '1995-01-30 22:54:47', NULL),
(27, 'Safina Yulianti', '5314431301116456', 'L', 'Gg. Imam Bonjol No. 295, Balikpapan 93649, Jambi', 'bsiregar@riyanti.info', '0906 4023 236', '1993-09-14 11:56:22', '1985-04-25 07:56:33', NULL),
(28, 'Jaya Hidayat', '6209584607119960', 'L', 'Kpg. Camar No. 324, Pagar Alam 98963, Kepri', 'hardi.maryadi@gmail.com', '0587 6346 714', '2000-12-12 06:57:08', '2007-01-12 22:52:20', NULL),
(29, 'Ganep Pardi Lazuardi', '3517300809217091', 'L', 'Jln. Yosodipuro No. 791, Parepare 32683, Kepri', 'padmi.sitorus@yahoo.co.id', '(+62) 700 8829 927', '1976-06-25 22:07:52', '2020-03-17 13:23:02', NULL),
(30, 'Cindy Mayasari', '6571090201024961', 'L', 'Jln. Bata Putih No. 718, Surakarta 88015, Kepri', 'qutami@widiastuti.net', '(+62) 516 1465 567', '2006-03-18 17:56:28', '1976-03-26 11:29:25', NULL),
(31, 'Ajimin Oskar Habibi', '6206083005202297', 'L', 'Ki. Sudirman No. 167, Subulussalam 53100, Kalbar', 'riyanti.nrima@gmail.com', '0314 4258 9468', '1994-04-03 09:03:39', '2019-09-07 07:14:03', NULL),
(32, 'Dina Kani Wahyuni', '9210965909946618', 'L', 'Dk. Barat No. 492, Batu 89155, Malut', 'fsudiati@suryono.co', '0285 1071 0594', '1977-11-07 11:49:52', '2011-05-25 16:31:16', NULL),
(33, 'Eluh Sidiq Nainggolan S.Kom', '1812212412939407', 'L', 'Dk. Cikutra Timur No. 501, Bekasi 32206, Sulteng', 'xharyanti@suwarno.sch.id', '0828 966 085', '1977-04-28 14:28:17', '1995-06-15 14:23:43', NULL),
(34, 'Dono Iswahyudi', '3302522809929921', 'L', 'Dk. Kyai Mojo No. 820, Pekalongan 59118, Lampung', 'znamaga@suartini.asia', '(+62) 679 2257 6461', '1997-12-08 00:06:21', '2002-07-20 09:15:48', NULL),
(35, 'Vera Aryani', '6309073003114340', 'L', 'Gg. Bagas Pati No. 172, Tasikmalaya 86642, Sulteng', 'wdabukke@widodo.mil.id', '(+62) 449 8813 831', '2011-02-20 10:16:36', '1999-08-26 23:30:45', NULL),
(36, 'Hari Darmaji Widodo', '7605272705054375', 'L', 'Kpg. Otto No. 652, Banjarbaru 27541, Sumut', 'naradi51@mangunsong.sch.id', '(+62) 491 0786 4694', '1980-03-03 23:01:35', '1984-08-31 14:43:31', NULL),
(37, 'Ratna Cici Permata', '3503235104029095', 'L', 'Kpg. Moch. Yamin No. 869, Palopo 44510, Sulut', 'kayla10@yahoo.com', '0829 1013 5939', '1987-05-15 20:35:46', '1970-07-30 13:16:33', NULL),
(38, 'Paramita Hamima Rahayu', '1405156308017597', 'L', 'Gg. Raya Ujungberung No. 306, Jayapura 58450, Lampung', 'lpermadi@gmail.co.id', '0760 5905 7226', '2005-11-11 13:16:54', '1989-05-29 05:48:28', NULL),
(39, 'Vero Prasasta', '3579716811050643', 'L', 'Kpg. Kebonjati No. 776, Palu 24939, Jatim', 'gina.thamrin@wacana.in', '(+62) 929 2357 169', '1988-06-26 20:15:31', '2004-12-11 15:14:04', NULL),
(40, 'Hasna Yuliarti', '3272901804940752', 'L', 'Ki. Baan No. 907, Denpasar 20271, Sultra', 'ade.marbun@dongoran.tv', '0209 5854 1028', '1976-12-05 14:17:14', '1983-06-24 21:57:05', NULL),
(41, 'Ifa Anggraini M.TI.', '8102462702052349', 'L', 'Ds. Basket No. 878, Padangsidempuan 42590, Pabar', 'anggriawan.oni@mulyani.go.id', '(+62) 453 2805 9998', '2008-10-19 19:23:52', '1975-02-06 09:46:32', NULL),
(42, 'Nrima Wahyudin', '3527491605186053', 'L', 'Gg. Diponegoro No. 555, Palu 70105, Kalbar', 'hartati.limar@gmail.co.id', '025 0762 372', '1990-11-08 02:40:23', '2010-09-08 16:39:35', NULL),
(43, 'Ciaobella Astuti S.Gz', '7110606712098645', 'L', 'Jln. Babadak No. 34, Jayapura 18215, Babel', 'irfan.suryatmi@firmansyah.info', '0944 0781 500', '2015-10-24 14:56:58', '2000-03-03 16:09:15', NULL),
(44, 'Mursita Soleh Hardiansyah S.Psi', '8272511412959197', 'L', 'Gg. Tentara Pelajar No. 348, Padangpanjang 94423, Jateng', 'utama.jaiman@yahoo.co.id', '0860 7458 4428', '2006-05-14 06:04:39', '1978-05-11 12:01:35', NULL),
(45, 'Ulya Purwanti', '1111405409111079', 'L', 'Ki. Peta No. 168, Gunungsitoli 84181, Pabar', 'omelani@gmail.com', '0504 9497 8553', '2014-02-28 13:19:27', '1979-01-11 20:18:12', NULL),
(46, 'Mahmud Najmudin', '3314624108097237', 'L', 'Gg. PHH. Mustofa No. 700, Surabaya 33855, Malut', 'lidya32@purnawati.biz', '(+62) 27 1940 1242', '1999-03-28 23:35:42', '1981-09-16 08:14:34', NULL),
(47, 'Prakosa Hidayat', '7371266108212064', 'L', 'Jln. Gajah Mada No. 652, Padangsidempuan 95083, Maluku', 'suwarno.vera@yahoo.com', '(+62) 905 0220 175', '2003-05-14 02:19:16', '2006-10-04 02:23:09', NULL),
(48, 'Banawa Vega Mandala M.M.', '5307610902951684', 'L', 'Dk. Baranangsiang No. 486, Tidore Kepulauan 72338, Kalteng', 'uyainah.oskar@gmail.co.id', '(+62) 865 532 939', '1977-07-11 10:35:25', '1994-09-07 09:24:54', NULL),
(49, 'Michelle Hastuti', '3516484405969336', 'L', 'Dk. Baladewa No. 404, Jayapura 71380, Sulsel', 'ganda.pangestu@gmail.co.id', '0576 2330 6977', '2001-07-24 15:53:43', '1975-11-17 15:13:17', NULL),
(50, 'Luthfi Kusumo', '3212246208104955', 'L', 'Dk. Panjaitan No. 545, Langsa 87691, Sumsel', 'tprastuti@gmail.com', '(+62) 469 8472 232', '1991-08-13 13:19:21', '1995-02-25 13:17:50', NULL),
(51, 'Queen Riyanti', '9105800803155892', 'L', 'Jr. Yoga No. 160, Bau-Bau 13231, Lampung', 'wsusanti@puspita.biz', '(+62) 371 6961 8307', '1982-05-23 18:23:54', '1999-12-05 08:58:15', NULL),
(52, 'Putu Hutapea', '9108534801183130', 'L', 'Ds. Wahid No. 260, Bandar Lampung 42152, Jateng', 'azalea.farida@yahoo.com', '(+62) 467 9334 2408', '2018-04-06 20:40:00', '1999-03-29 17:26:49', NULL),
(53, 'Puji Safitri', '1218991912151892', 'L', 'Gg. Zamrud No. 948, Pekanbaru 23736, Riau', 'carla11@gmail.com', '0721 9553 9757', '1975-01-10 20:01:34', '1996-07-24 12:51:48', NULL),
(54, 'Natalia Nurdiyanti', '6209661408944773', 'L', 'Ds. Pacuan Kuda No. 766, Makassar 60316, Sumut', 'usamah.yulia@yahoo.com', '(+62) 388 4073 314', '1974-04-08 01:49:38', '1998-10-01 02:23:42', NULL),
(55, 'Raina Susanti', '3302475308077690', 'L', 'Ki. Taman No. 946, Solok 75016, Sumbar', 'prasetya.nadine@anggraini.biz.id', '(+62) 454 9550 891', '1995-01-14 20:18:12', '1972-11-04 22:01:28', NULL),
(56, 'Mustofa Wahyudin', '3516345507044696', 'L', 'Jln. Bagas Pati No. 136, Ternate 86265, Lampung', 'galiono.susanti@yahoo.com', '(+62) 644 2637 098', '1972-06-05 07:26:23', '2015-03-18 08:58:48', NULL),
(57, 'Yance Rahmawati', '3573535203087734', 'L', 'Jr. Pattimura No. 229, Palangka Raya 44214, Sumut', 'maimunah18@nainggolan.web.id', '0323 9045 5077', '1988-11-20 17:19:30', '2014-03-22 21:10:36', NULL),
(58, 'Raina Mayasari M.Kom.', '7405994303101054', 'L', 'Gg. Basuki No. 522, Kendari 20907, Sulteng', 'najam.kuswandari@gmail.co.id', '(+62) 832 509 466', '2005-01-16 16:12:56', '2001-01-15 22:36:30', NULL),
(59, 'Agnes Wijayanti', '8208221612158713', 'L', 'Gg. Mahakam No. 961, Samarinda 28970, DIY', 'kanggraini@gmail.co.id', '0473 0279 9569', '2020-09-20 04:16:01', '2013-08-25 20:08:20', NULL),
(60, 'Lukman Nardi Tampubolon', '1571897004010400', 'L', 'Psr. Salam No. 471, Solok 23005, Riau', 'pertiwi.hani@gunawan.biz.id', '0524 7828 8336', '1973-12-22 03:52:42', '2006-02-03 18:02:17', NULL),
(61, 'Lutfan Waskita', '9127512811968373', 'L', 'Jr. K.H. Wahid Hasyim (Kopo) No. 211, Palu 33256, Kaltim', 'kawaya.novitasari@gmail.co.id', '0328 8697 895', '2008-09-26 15:43:58', '2015-01-26 18:04:41', NULL),
(62, 'Maryanto Capa Waskita', '9101110410025759', 'L', 'Dk. Babakan No. 994, Sibolga 92615, Bali', 'pprasasta@gmail.com', '0854 9628 106', '1981-04-01 03:33:58', '2012-12-02 00:40:08', NULL),
(63, 'Adhiarja Mandala', '9107871306172380', 'L', 'Ds. Lembong No. 107, Medan 57632, Banten', 'maheswara.hadi@yahoo.com', '020 7430 793', '1976-06-07 03:00:05', '1984-01-23 11:51:30', NULL),
(64, 'Makuta Umaya Waskita S.H.', '1706034410067121', 'L', 'Ki. Dipenogoro No. 937, Semarang 51157, Sulbar', 'smandala@yahoo.co.id', '(+62) 407 6918 9927', '1985-01-04 08:33:34', '2002-03-11 13:12:13', NULL),
(65, 'Hasna Handayani', '7211716909008258', 'L', 'Gg. Suryo No. 901, Kendari 51572, Sumut', 'lanjar28@hasanah.co', '0234 2593 2251', '1979-08-26 09:54:33', '1995-11-17 17:04:07', NULL),
(66, 'Ratna Mulyani', '1703024109951610', 'L', 'Gg. Supono No. 304, Pekanbaru 88805, Riau', 'cakrabirawa.wastuti@gmail.co.id', '0605 7539 013', '2020-04-18 17:09:07', '2015-01-31 03:29:30', NULL),
(67, 'Janet Farida S.Ked', '1225151705038507', 'L', 'Psr. Barat No. 90, Subulussalam 60154, Sumut', 'wijayanti.enteng@kusumo.web.id', '(+62) 674 3764 4590', '1988-02-20 21:06:32', '1977-02-07 10:45:06', NULL),
(68, 'Rini Uyainah', '6401867011138244', 'L', 'Ki. Raya Ujungberung No. 562, Balikpapan 51342, Kalsel', 'hasanah.emong@nuraini.com', '0917 8965 3894', '1974-02-23 03:19:03', '1986-03-30 20:03:31', NULL),
(69, 'Ida Handayani', '7326536711191025', 'L', 'Jr. Flora No. 600, Magelang 78410, Jateng', 'latika67@gmail.co.id', '0883 8428 781', '1994-02-25 06:28:36', '2009-06-17 00:54:53', NULL),
(70, 'Tira Prastuti', '5307040604168833', 'L', 'Psr. Baranangsiang No. 662, Medan 19081, Pabar', 'aurora.prasetya@wasita.co.id', '(+62) 874 4672 666', '2005-03-29 05:20:52', '2008-12-08 13:06:07', NULL),
(71, 'Janet Carla Nasyidah', '1206246810974035', 'L', 'Gg. Lada No. 787, Parepare 48630, Banten', 'winda.astuti@yahoo.co.id', '0307 3743 5221', '1996-08-12 07:51:04', '1973-05-15 15:02:35', NULL),
(72, 'Prabawa Galih Budiman M.TI.', '9113731805139848', 'L', 'Ds. Samanhudi No. 639, Dumai 90778, Sumut', 'opan07@yahoo.co.id', '0326 9470 870', '2009-10-03 21:53:24', '2007-07-21 03:33:54', NULL),
(73, 'Purwanto Ramadan', '3514852102072174', 'L', 'Ki. Abdul Muis No. 180, Gunungsitoli 92725, Bengkulu', 'jkurniawan@yahoo.co.id', '0317 0025 374', '2004-03-11 21:38:05', '1970-07-03 21:45:15', NULL),
(74, 'Keisha Lintang Kusmawati', '9116462503175356', 'L', 'Ki. Babadak No. 754, Bandung 21588, Bali', 'yani.nasyidah@gmail.co.id', '(+62) 216 3458 344', '2022-02-17 08:48:38', '2005-04-24 02:55:56', NULL),
(75, 'Danu Putra', '3308235207996981', 'L', 'Jr. Bacang No. 356, Banda Aceh 73608, DIY', 'hamzah.maheswara@gmail.co.id', '(+62) 805 1889 5642', '1991-10-29 15:18:36', '1996-12-10 15:04:04', NULL),
(76, 'Mursita Suryono', '3204042710975566', 'L', 'Dk. Gardujati No. 944, Gunungsitoli 42555, Banten', 'balamantri39@yahoo.co.id', '(+62) 226 5711 8830', '2011-10-07 02:24:53', '1988-01-05 00:09:37', NULL),
(77, 'Galuh Budiyanto', '3216560503097501', 'L', 'Psr. Abang No. 180, Tarakan 55395, Kaltara', 'harimurti.rahayu@setiawan.tv', '0557 0834 3719', '1981-01-05 23:06:00', '1988-10-20 13:23:23', NULL),
(78, 'Padma Andriani', '1371655208016780', 'L', 'Jln. Bambu No. 115, Gunungsitoli 38257, Kaltara', 'suartini.zaenab@safitri.in', '0905 0812 2649', '1981-02-22 11:12:29', '1980-02-29 09:55:45', NULL),
(79, 'Jamil Harsanto Dabukke', '3402820602136479', 'L', 'Psr. Lembong No. 29, Tomohon 58318, Jatim', 'haryanti.gamanto@yahoo.com', '(+62) 953 1392 608', '2000-03-16 16:13:36', '1981-10-05 08:43:36', NULL),
(80, 'Maya Kania Widiastuti S.IP', '3512675110089320', 'L', 'Gg. Thamrin No. 833, Cimahi 27100, DKI', 'dartono.melani@maryadi.web.id', '(+62) 433 4878 0076', '2001-11-18 02:33:23', '2005-03-24 14:02:55', NULL),
(81, 'Bakianto Wibisono', '6111522502195288', 'L', 'Psr. Gremet No. 300, Bengkulu 69035, Bali', 'rahmat.pranowo@halimah.co', '0863 4186 4425', '2002-01-31 05:36:31', '1990-12-02 16:00:15', NULL),
(82, 'Bagya Waskita', '1218462309951224', 'L', 'Psr. Cikutra Barat No. 242, Sorong 75911, NTT', 'vanya40@rahmawati.my.id', '(+62) 949 7793 225', '1995-11-11 11:32:34', '2016-09-26 04:04:24', NULL),
(83, 'Nyoman Salahudin', '9111682109966236', 'L', 'Psr. Sunaryo No. 854, Padang 24117, Banten', 'jharyanti@yahoo.co.id', '0578 9999 1134', '1973-06-04 03:47:02', '1994-08-19 19:01:11', NULL),
(84, 'Gilda Belinda Anggraini S.Ked', '1471275504972959', 'L', 'Dk. Gading No. 530, Makassar 22395, Maluku', 'wahyu.prayoga@purwanti.web.id', '(+62) 944 9796 290', '2009-09-17 22:54:23', '2011-03-14 13:07:22', NULL),
(85, 'Ratna Rahimah', '5106125910119410', 'L', 'Kpg. Baranang No. 833, Sukabumi 82313, Sumut', 'vsihombing@gmail.com', '(+62) 812 9416 484', '1994-12-15 13:05:25', '1978-06-07 23:40:50', NULL),
(86, 'Winda Hassanah', '1701416105047238', 'L', 'Psr. Ters. Jakarta No. 738, Balikpapan 60298, Aceh', 'nababan.eva@saragih.info', '(+62) 826 271 723', '1988-09-05 20:43:09', '2013-08-07 22:59:49', NULL),
(87, 'Ilsa Mandasari S.E.', '1220425812084099', 'L', 'Kpg. Pasirkoja No. 49, Cirebon 99227, Aceh', 'zulaikha71@riyanti.web.id', '0259 9696 055', '1998-12-11 13:30:44', '2012-02-13 04:25:17', NULL),
(88, 'Gilang Waskita', '7502705508143197', 'L', 'Kpg. Krakatau No. 839, Pematangsiantar 37749, Riau', 'wmegantara@widodo.biz', '0697 8110 722', '2002-03-31 00:22:09', '1978-09-02 16:06:08', NULL),
(89, 'Raditya Hutapea', '9104211212940511', 'L', 'Kpg. R.M. Said No. 331, Palu 65284, Sumut', 'prakasa.victoria@gmail.com', '0939 9743 5478', '2013-05-03 22:29:55', '2003-01-30 02:40:50', NULL),
(90, 'Damar Pratama', '6311770602943420', 'L', 'Jr. Kusmanto No. 704, Sabang 68635, Malut', 'kurniawan.bella@yahoo.com', '(+62) 799 7193 0799', '1991-08-25 08:25:49', '2021-05-05 22:33:20', NULL),
(91, 'Indah Pratiwi M.Kom.', '1571384703011711', 'L', 'Ki. Tentara Pelajar No. 375, Pekanbaru 99507, Kepri', 'bella25@kuswandari.name', '0674 7434 041', '2019-03-13 17:55:51', '1993-06-25 23:56:14', NULL),
(92, 'Vinsen Wahyudin', '8171140306125241', 'L', 'Gg. Juanda No. 55, Bogor 48715, DKI', 'puspa97@gmail.co.id', '(+62) 822 020 873', '2010-12-05 03:56:15', '2003-12-12 14:41:01', NULL),
(93, 'Halima Mayasari', '3277752404172746', 'L', 'Psr. Basoka Raya No. 619, Padangsidempuan 35290, Kalbar', 'gadang.iswahyudi@yolanda.org', '0808 5336 434', '2018-09-30 01:25:46', '1977-05-16 08:55:52', NULL),
(94, 'Raharja Hidayanto', '1112621512076971', 'L', 'Ds. Dewi Sartika No. 122, Tasikmalaya 76763, Sulsel', 'bmardhiyah@sitompul.asia', '024 2405 3057', '2010-04-11 15:31:05', '1979-05-22 11:35:01', NULL),
(95, 'Gatot Waskita', '3601676808991357', 'L', 'Ki. Barat No. 143, Banjar 32020, NTT', 'zelaya55@usamah.co.id', '0731 3826 1912', '2007-01-08 12:42:05', '2001-11-28 23:35:48', NULL),
(96, 'Faizah Wijayanti', '3201814501078066', 'L', 'Jr. Baladewa No. 680, Prabumulih 51049, Kalteng', 'chelsea.firmansyah@pertiwi.biz', '(+62) 242 9533 077', '1999-04-24 15:08:08', '1994-07-10 13:50:06', NULL),
(97, 'Amelia Widiastuti', '5318125207143054', 'L', 'Ki. Daan No. 787, Bima 38302, Kalteng', 'bramadan@prasasta.id', '(+62) 211 1940 7794', '1985-07-02 02:22:48', '1975-11-01 15:04:37', NULL),
(98, 'Maria Salsabila Susanti M.M.', '1704675108046211', 'L', 'Ds. Wora Wari No. 644, Cimahi 48098, NTB', 'cinta04@gmail.co.id', '0943 6162 981', '1998-04-11 18:34:27', '2004-09-24 10:01:51', NULL),
(99, 'Soleh Saefullah', '7315170411952346', 'L', 'Kpg. Tentara Pelajar No. 852, Tangerang Selatan 75236, Malut', 'michelle78@hariyah.or.id', '0808 593 384', '1998-02-02 15:06:48', '1990-01-29 18:32:18', NULL),
(100, 'Wirda Hastuti', '9110392504989559', 'L', 'Ds. Badak No. 822, Langsa 98463, Aceh', 'wulandari.kanda@gmail.com', '(+62) 28 8242 848', '2007-06-21 05:51:21', '1997-09-24 18:43:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  `type_file` varchar(100) NOT NULL,
  `path` varchar(255) NOT NULL,
  `size` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `nama_file`, `type_file`, `path`, `size`) VALUES
(2, '1657853941_d4e328531a49e86766df.png', 'image/png', 'img/galeri/1657853941_d4e328531a49e86766df.png', 288110),
(5, '1660268254_6624814bd2dd5f2699f7.png', 'image/png', 'img/galeri/1660268254_6624814bd2dd5f2699f7.png', 1128);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(29, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1658722241, 1),
(30, '2022-07-18-031613', 'App\\Database\\Migrations\\Customer', 'default', 'App', 1658722241, 1),
(31, '2022-07-25-032924', 'App\\Database\\Migrations\\Sale', 'default', 'App', 1658722242, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
('J1658992711', 5, 1, '2022-07-28 14:18:31', '2022-07-28 14:18:31'),
('J1658993489', 5, 2, '2022-07-28 14:31:29', '2022-07-28 14:31:29'),
('J1659582637', 5, 0, '2022-08-04 10:10:37', '2022-08-04 10:10:37'),
('J1659582662', 5, 0, '2022-08-04 10:11:02', '2022-08-04 10:11:02'),
('J1659583804', 5, 3, '2022-08-04 10:30:04', '2022-08-04 10:30:04'),
('J1659680455', 5, 4, '2022-08-05 13:20:55', '2022-08-05 13:20:55'),
('J1660374666', 5, 1, '2022-08-13 14:11:06', '2022-08-13 14:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `sale_detail`
--

CREATE TABLE `sale_detail` (
  `sale_id` varchar(15) NOT NULL,
  `book_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sale_detail`
--

INSERT INTO `sale_detail` (`sale_id`, `book_id`, `amount`, `price`, `discount`, `total_price`) VALUES
('J1658992711', 2, 1, 55000, 0, 55000),
('J1658992711', 21, 1, 4234, 84.68, 4149.32),
('J1658992711', 22, 1, 90000, 10800, 79200),
('J1658992711', 23, 1, 80000, 40000, 40000),
('J1658993489', 2, 1, 55000, 0, 55000),
('J1658993489', 21, 1, 50000, 0, 50000),
('J1658993489', 22, 1, 90000, 0, 90000),
('J1659582637', 21, 1, 50000, 0, 50000),
('J1659582637', 2, 1, 55000, 0, 55000),
('J1659582637', 22, 1, 90000, 0, 90000),
('J1659582637', 23, 1, 80000, 0, 80000),
('J1659582662', 2, 1, 55000, 0, 55000),
('J1659582662', 21, 1, 50000, 0, 50000),
('J1659582662', 22, 1, 90000, 0, 90000),
('J1659583804', 2, 1, 55000, 0, 55000),
('J1659583804', 21, 1, 50000, 0, 50000),
('J1659583804', 22, 1, 90000, 0, 90000),
('J1659583804', 23, 3, 80000, 0, 240000),
('J1659680455', 23, 3, 80000, 0, 240000),
('J1659680455', 22, 1, 90000, 0, 90000),
('J1659680455', 21, 1, 50000, 0, 50000),
('J1660374666', 27, 1, 435, 43495.6, -43060.6),
('J1660374666', 26, 1, 50000, 1000, 49000),
('J1660374666', 25, 1, 50000, 1000, 49000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `address`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(3, 'masuk ok', 'masuk ok', 'mantap ok', '1323123', '2022-07-15 01:39:42', '2022-07-17 20:59:59'),
(4, 'okay', 'okay', 'foaksofka', 'mantap', '2022-07-15 01:39:52', '2022-07-15 01:39:52'),
(5, 'fasdfasdf', 'fadafsfoka', 'fewafwe', '0120310', '2022-07-15 01:40:07', '2022-07-15 01:40:16'),
(7, 'fasdfa', '234234', 'fasdf', '4234', '2022-07-17 20:45:27', '2022-07-17 20:45:27'),
(8, 'FFFFFFFF', 'FFFFFFF', 'FFFFFFF', '535345', '2022-07-17 20:54:18', '2022-07-17 21:17:25'),
(9, 'KKKKKKK', 'KKKKKKKK', 'kkkkkk', '89797', '2022-07-17 21:18:08', '2022-07-17 21:55:13'),
(10, 'DDDDDDDDDDDDDDD', 'DDDDDDDDDDDDDD', 'yyyyyyyyyyy', '8888', '2022-07-17 21:55:37', '2022-07-17 22:08:39'),
(11, 'RRRRRR', 'TTTTTTT', 'OOOOOOOO', '645645', '2022-07-17 21:56:24', '2022-07-17 22:07:41'),
(12, 'fasdfadf', 'fffffffffffffffgggg', 'ggggggggg', '6666666', '2022-07-17 22:06:51', '2022-07-17 22:06:51'),
(14, 'fafa', 'faewfa', '', '', '2022-07-25 01:14:54', '2022-07-25 01:14:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'Administrator', 'Toko Buku', 'admin@gmail.com', 'admin', '$2y$10$E8SZzIJrBhBaOlm7niiG3uxd7YfoadIc5E5vGBdGWjA10i/v4aOCm', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-07-25 00:44:58', '2022-07-25 01:03:51', NULL),
(6, 'Karyawan', 'Baru', 'karyawanbaru@gmail.com', 'Karyawan1', '$2y$10$BR4oZAD4Sk5A1OdzTLVtr.nSSXSeqR8IWkUfaYKq6id/S8PupCubS', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-07-25 01:09:52', '2022-07-25 01:09:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`book_category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `book_category_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
