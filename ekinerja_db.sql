-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2022 at 10:28 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekinerja_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tharian`
--

CREATE TABLE `tharian` (
  `id_harian` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `lama_pengerjaan` int(5) NOT NULL,
  `kegiatan` text NOT NULL,
  `output` varchar(200) NOT NULL,
  `deskripsi_pekerjaan` text NOT NULL,
  `file_pekerjaan` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Proses',
  `nilai` int(4) NOT NULL,
  `keterangan` varchar(128) NOT NULL,
  `id_korektor` int(11) NOT NULL,
  `id_satuan` int(4) NOT NULL,
  `tgl_simpan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tharian`
--

INSERT INTO `tharian` (`id_harian`, `id_karyawan`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `lama_pengerjaan`, `kegiatan`, `output`, `deskripsi_pekerjaan`, `file_pekerjaan`, `status`, `nilai`, `keterangan`, `id_korektor`, `id_satuan`, `tgl_simpan`) VALUES
(933, 54, '2022-07-01', '21:33:00', '06:33:00', 0, 'tidur', 'badan jadi fresh lagi', '<p>tidur nyenyak di kasur yang empuk</p>\r\n', '8 Sep, Maintenance mikrotik.png', 'Diterima', 30, 'Kerja jangan tidur Jancok', 55, 8, '2022-07-01 14:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `tjabatan`
--

CREATE TABLE `tjabatan` (
  `id_jabatan` int(11) NOT NULL,
  `jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tjabatan`
--

INSERT INTO `tjabatan` (`id_jabatan`, `jabatan`) VALUES
(26, 'Ketua Yayasan'),
(27, 'Ketua BPH'),
(28, 'Wakil Ketua BPH'),
(30, 'Kabid PMP Yayasan At Taqwa'),
(31, 'Kabid Pembangunan'),
(32, 'Kabid Advokasi'),
(33, 'Kabid Umum '),
(34, 'Kabid. Keuangan.'),
(35, 'Kabag HRD'),
(36, 'Kabag Humas'),
(37, 'Kabag Sarpra'),
(38, 'Kepala Sekolah'),
(39, 'Waka Kurikulum'),
(40, 'Waka.Kesiswaan'),
(41, 'Waka. Sarpra'),
(42, 'Bimbingan Konseling/Piket'),
(43, 'Staff IT'),
(44, 'Kaprog RPL'),
(45, 'Kaprog MM'),
(46, 'Kaprog TKJ'),
(47, 'Kaprog BDP'),
(48, 'Kaprog OTKP'),
(49, 'Tim Disiplin'),
(50, 'Pembina Rohis'),
(51, 'Bendahara Bos'),
(52, 'Teknisi'),
(53, 'Keamanan'),
(54, 'Kebersihan'),
(55, 'Tata Usaha'),
(56, 'Bendahara'),
(57, 'Tata Usaha Keuangan'),
(58, 'Administrasi Umum'),
(59, 'Admin Keuangan'),
(60, 'Pembina Osis'),
(61, 'Operator Sekolah'),
(62, 'Pustakawati');

-- --------------------------------------------------------

--
-- Table structure for table `tkaryawan`
--

CREATE TABLE `tkaryawan` (
  `id_karyawan` int(11) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `jabatan` int(2) NOT NULL,
  `atasan1` int(2) NOT NULL,
  `atasan2` int(2) NOT NULL,
  `password` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `level` varchar(8) NOT NULL DEFAULT 'karyawan',
  `foto` varchar(200) NOT NULL,
  `tgl_simpan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tkaryawan`
--

INSERT INTO `tkaryawan` (`id_karyawan`, `nip`, `nama_lengkap`, `jabatan`, `atasan1`, `atasan2`, `password`, `status`, `level`, `foto`, `tgl_simpan`) VALUES
(54, '201943502573', 'Ahmad Yasyallah', 43, 55, 55, '180648603db8f8bfb580d555398e22c8', 'Aktif', 'Karyawan', 'noimages1.jpg', '2022-07-02 10:35:46'),
(55, '201943502574', 'Drs.H.Daniel Alvindhiyatun.S.Tr.,S.Ag.,M.Kom.', 26, 0, 0, '6a9a69da6e3b91db76da270a195dec5e', 'Aktif', 'Karyawan', 'noimage.jpg', '2022-07-01 14:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `tsatuan`
--

CREATE TABLE `tsatuan` (
  `id_satuan` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsatuan`
--

INSERT INTO `tsatuan` (`id_satuan`, `satuan`) VALUES
(1, 'Dokumen'),
(2, 'Berkas'),
(3, 'Foto'),
(6, 'Surat'),
(7, 'Kegiatan acara'),
(8, 'Arsip');

-- --------------------------------------------------------

--
-- Table structure for table `tuser`
--

CREATE TABLE `tuser` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `level` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `foto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tuser`
--

INSERT INTO `tuser` (`id_user`, `username`, `password`, `nama_pengguna`, `level`, `status`, `foto`) VALUES
(6, 'yasa', '21232f297a57a5a743894a0e4a801fc3', 'Yasya', 'Operator', 'Aktif', 'noimage.jpg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_datakaryawan`
-- (See below for the actual view)
--
CREATE TABLE `v_datakaryawan` (
`id_karyawan` int(11)
,`nip` varchar(25)
,`nama_lengkap` varchar(150)
,`jabatan` int(2)
,`atasan1` int(2)
,`atasan2` int(2)
,`password` text
,`status` varchar(10)
,`level` varchar(8)
,`foto` varchar(200)
,`tgl_simpan` timestamp
,`jabatan1` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_lapharian`
-- (See below for the actual view)
--
CREATE TABLE `v_lapharian` (
`id_harian` int(11)
,`id_karyawan` int(11)
,`tanggal` date
,`waktu_mulai` time
,`waktu_selesai` time
,`lama_pengerjaan` int(5)
,`kegiatan` text
,`output` varchar(200)
,`deskripsi_pekerjaan` text
,`file_pekerjaan` text
,`status` varchar(10)
,`nilai` int(4)
,`keterangan` varchar(128)
,`id_korektor` int(11)
,`id_satuan` int(4)
,`tgl_simpan` timestamp
,`nama_lengkap` varchar(150)
,`atasan1` int(2)
,`atasan2` int(2)
,`satuan` varchar(20)
,`jabatan` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `v_datakaryawan`
--
DROP TABLE IF EXISTS `v_datakaryawan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_datakaryawan`  AS SELECT `tkaryawan`.`id_karyawan` AS `id_karyawan`, `tkaryawan`.`nip` AS `nip`, `tkaryawan`.`nama_lengkap` AS `nama_lengkap`, `tkaryawan`.`jabatan` AS `jabatan`, `tkaryawan`.`atasan1` AS `atasan1`, `tkaryawan`.`atasan2` AS `atasan2`, `tkaryawan`.`password` AS `password`, `tkaryawan`.`status` AS `status`, `tkaryawan`.`level` AS `level`, `tkaryawan`.`foto` AS `foto`, `tkaryawan`.`tgl_simpan` AS `tgl_simpan`, `tjabatan`.`jabatan` AS `jabatan1` FROM (`tkaryawan` join `tjabatan`) WHERE `tkaryawan`.`jabatan` = `tjabatan`.`id_jabatan` ;

-- --------------------------------------------------------

--
-- Structure for view `v_lapharian`
--
DROP TABLE IF EXISTS `v_lapharian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lapharian`  AS SELECT `tharian`.`id_harian` AS `id_harian`, `tharian`.`id_karyawan` AS `id_karyawan`, `tharian`.`tanggal` AS `tanggal`, `tharian`.`waktu_mulai` AS `waktu_mulai`, `tharian`.`waktu_selesai` AS `waktu_selesai`, `tharian`.`lama_pengerjaan` AS `lama_pengerjaan`, `tharian`.`kegiatan` AS `kegiatan`, `tharian`.`output` AS `output`, `tharian`.`deskripsi_pekerjaan` AS `deskripsi_pekerjaan`, `tharian`.`file_pekerjaan` AS `file_pekerjaan`, `tharian`.`status` AS `status`, `tharian`.`nilai` AS `nilai`, `tharian`.`keterangan` AS `keterangan`, `tharian`.`id_korektor` AS `id_korektor`, `tharian`.`id_satuan` AS `id_satuan`, `tharian`.`tgl_simpan` AS `tgl_simpan`, `tkaryawan`.`nama_lengkap` AS `nama_lengkap`, `tkaryawan`.`atasan1` AS `atasan1`, `tkaryawan`.`atasan2` AS `atasan2`, `tsatuan`.`satuan` AS `satuan`, `tjabatan`.`jabatan` AS `jabatan` FROM (((`tharian` join `tkaryawan`) join `tsatuan`) join `tjabatan`) WHERE `tharian`.`id_karyawan` = `tkaryawan`.`id_karyawan` AND `tharian`.`id_satuan` = `tsatuan`.`id_satuan` AND `tkaryawan`.`jabatan` = `tjabatan`.`id_jabatan` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tharian`
--
ALTER TABLE `tharian`
  ADD PRIMARY KEY (`id_harian`);

--
-- Indexes for table `tjabatan`
--
ALTER TABLE `tjabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `tkaryawan`
--
ALTER TABLE `tkaryawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `tsatuan`
--
ALTER TABLE `tsatuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tharian`
--
ALTER TABLE `tharian`
  MODIFY `id_harian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=934;

--
-- AUTO_INCREMENT for table `tjabatan`
--
ALTER TABLE `tjabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tkaryawan`
--
ALTER TABLE `tkaryawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tsatuan`
--
ALTER TABLE `tsatuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tuser`
--
ALTER TABLE `tuser`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
