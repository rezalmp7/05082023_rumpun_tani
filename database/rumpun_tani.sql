-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2023 at 03:36 PM
-- Server version: 5.7.33
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumpun_tani`
--

-- --------------------------------------------------------

--
-- Table structure for table `benih`
--

CREATE TABLE `benih` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `benih`
--

INSERT INTO `benih` (`id`, `nama`, `gambar`, `deskripsi`, `jumlah`, `satuan`, `harga`, `created_at`, `update_at`) VALUES
(4, 'Benih Jagung Manis Hibrida PARAGON', 'benih-1691226829.jpg', '<p>Isi per pack sekitar 80 benih<br>Tinggi tanaman mencapai 185 \'\'\" 215 cm<br>Biji berwarna kuning dengan jumlah baris 14 \'\'\" 16<br>Rasa manis dengan kadar gula mencapai 12 \" brix.<br>Tongkol silindris ujung tumpul<br>Panjang tongkol 17 \'\'\" 21 cm dengan diameter 5 cm.<br>Berat buah per tongkol 430 gram<br>Potensi hasilnya tinggi 25 ton/Ha.<br>Umur panen 70-75 HST.<br>Tahan simpan selama 4 hari setelah panen.</p>', 90, 'Kilogram', 13000, '2023-05-06 22:46:20', '2023-08-05 09:13:49'),
(5, 'Benih Bibit Jagung Hibrida Bioseed B-54 Kemasan 1KG', 'benih-1691226651.jpg', '<p>Benih Jagung Hibrida - Bioseed B54<br>-------------------------------------------------<br>1. PENANAMAN<br>Gunakan jarak tanam : 70 cm x 20 cm dengan menggunakan 1 biji per lubang<br><br>2.PEMUPUKANN<br>Pupuk Dasar (0 HST) : NPK 250 Kg/ha<br>Pupuk Kedua (20 HST) : NPK 150 Kg/ha &amp; Urea 100kg/ha<br>Pupuk Ketiga (40 HST) : Urea 150 Kg/ha<br>Masukan pupuk 5 cm di samping lubang benih dan tutup lagi dengan tanah<br>----------------------------------------------------------------------------------------------------<br><br>Di Produksi / diimpor oleh :<br>PT SHRIRAM GENETICS</p>', 11, 'Kilogram', 62000, '2023-08-05 09:10:51', '2023-08-05 09:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `type` enum('benih','obat') NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `type` enum('obat','pupuk') NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama`, `type`, `gambar`, `jumlah`, `satuan`, `harga`, `deskripsi`, `created_at`, `update_at`) VALUES
(3, 'Roundup 486 SL 1L Herbisida Pembasmi Rumput 1 lite', 'obat', 'obat-1691227741.jpg', 123, 'liter', 90000, '<p>(TELAH HADIR DALAM KEMASAN BARU)<br><br>Roundup adalah herbisida purna tumbuh dengan bahan aktif glifosat yang diproduksi menggunakan surfaktan yang dipatenkan. 3 kali lebih banyak dan lebih cepat masuk kedalam gulma sehingga tahan hujan 1-2 jam setelah semprot.<br><br>Keunggulan Roundup :<br>• Diserap dan ditranslokasikan ke jaringan gulma tiga kali lebih cepat dan lebih banyak sehingga daya brantas lebih unggul dalam jangka waktu lama.<br>• Jenis gulma yang dapat dikendalikan lebih banyak, sekalipun gulma bandel.<br>• Tahan hujan 1-2 jam setelah aplikasi. Ini akan menghilangkan kekhawatiran akan penyemprotan ulang dan resiko karena hujan.<br>• Lebih fleksibel pada kondisi lapangan<br><br>Aplikasi : Disemprotkan pada saat gulma tumbuh subur<br>Dosis : 5-10ml/ 1 liter air<br><br>Biosorb<br>Gulma umum, persiapan tanam (TOT)<br>A. Alang-alang di tempat terlindung : 3 -6 l/h<br>B. Alang-alang di tempat terbuka : 6-10 l/h<br>Gulma Keras : 4 -6 l/h<br>Gulma Sedang : 2 -3 l/h<br>Gulma Lunak : 1,5 -2 l/h<br><br>Transorb<br>A. Gulma berdaun lebar &amp; sempit : 2,25 – 4,5 L/Ha<br>B. Alang-alang : 3 – 3,75 l/h<br><br>Weedup 480SL adalah herbisida sistemik purna tumbuh berbahan aktif isopropil amina glifosat 480 g/l berbentuk larutan dalam air yang efektif menanggulangi gulma/rumput yang berusia tua pada perkebunan atau lahan pertanian.<br><br>Dosis&amp; Aplikasi:<br>Kelapa sawit (TBM) : gulma berdaun lebar &amp; rumput (Penyemprotan volume tinggi : 1,5 - 3 l/ha)<br><br>Tersedia kemasan:<br>- Biosorb 200ml, 1L, 4L dan 20L<br>- Transorb 1L dan 4L<br>- WeedUp 1L<br><br>Kenapa belanja di Duta Sprayer<br>1. Barang Pasti original dari Pabrikan<br>2. Free Bubble wrap, tidak perlu tambah bayar<br>3. Proses yang cepat, order diterima sebelum jam 3 akan dikirim hari yang sama kecuali hari sabtu, minggu dan hari libur.<br><br>FAQ<br>Apa beda Roundup Biosorb&amp; Transorb?<br>Secara fungsi mereka kurang lebih sama, yang buat beda bahan aktifnya<br>Biosorb - IPA Glifosat<br>Transorb - Kalium Glifosat<br><br>Apa beda Roundup&amp; Weedup?<br>Beda merk, Roundup dari Nufarm sedangkan Weedup dari UPL.</p>', '2023-05-06 22:48:56', '2023-08-05 09:29:01'),
(4, 'antracol fungisida / obat anti jamur tanaman / ant', 'obat', 'obat-1691227257.jpg', 12, 'Bungkus', 90000, '<p>antracol fungisida / obat anti jamur tanaman / antracol</p>', '2023-08-05 09:20:57', '2023-08-05 09:20:57'),
(5, 'Pupuk Bos 123', 'pupuk', 'pupuk-1691318012.jpg', 213, 'Sak', 120000, '<p>&nbsp;1231231 r13213</p>', '2023-08-06 10:33:32', '2023-08-06 10:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `type` enum('benih','obat') NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_transaksi`, `id_produk`, `nama_produk`, `type`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'Benih Bibit Jagung Hibrida Bioseed B-54 Kemasan 1KG', 'benih', 2, 62000, '2023-08-05 12:41:52', '2023-08-05 12:41:52'),
(2, 1, 4, 'Benih Jagung Manis Hibrida PARAGON', 'benih', 2, 13000, '2023-08-05 12:41:52', '2023-08-05 12:41:52'),
(3, 2, 5, 'Pupuk Bos 123', 'obat', 1, 120000, '2023-08-08 11:51:27', '2023-08-08 11:51:27'),
(4, 2, 3, 'Roundup 486 SL 1L Herbisida Pembasmi Rumput 1 lite', 'obat', 2, 90000, '2023-08-08 11:51:27', '2023-08-08 11:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kode_pesanan` bigint(25) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_pengambilan` date NOT NULL,
  `status` enum('1','2','3') NOT NULL COMMENT '1 - menunggu pengambilan, 2 success, 3 gagal',
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_pesanan`, `id_user`, `tgl_pengambilan`, `status`, `total`, `created_at`, `updated_at`) VALUES
(1, 1691239312, 3, '2023-08-10', '2', 150000, '2023-08-05 12:41:52', '2023-08-05 12:43:56'),
(2, 1691495487, 3, '2023-08-24', '2', 300000, '2023-08-08 11:51:27', '2023-08-08 11:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('a','u') NOT NULL COMMENT 'a-admin, u-user',
  `jenis_kelamin` enum('l','p') DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`, `jenis_kelamin`, `no_hp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'a', NULL, NULL, NULL, '2023-05-05 15:18:09', '2023-05-09 12:15:44'),
(3, 'Supri', 'supri', 'd79444495ba8886c397b418227564d3f', 'u', 'l', '087721191226', 'Jl Ahmad Yani 2022 111', '2023-05-05 17:37:01', '2023-05-09 17:43:53'),
(4, 'Adi', 'adi', 'c46335eb267e2e1cde5b017acb4cd799', 'u', 'l', '087721191226', 'asdaf asda', '2023-05-09 17:43:12', '2023-05-09 17:43:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benih`
--
ALTER TABLE `benih`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `benih`
--
ALTER TABLE `benih`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
