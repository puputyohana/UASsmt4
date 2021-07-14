-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jul 2021 pada 10.56
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penilaian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nik` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nik`, `nama`, `alamat`, `foto`, `username`, `password`, `level`) VALUES
('1230987654', 'Rizky', 'Jl Mojorejo', 'admin.jpg', '1230987654', '1230987654', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `level_user`
--

CREATE TABLE `level_user` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level_user`
--

INSERT INTO `level_user` (`id_level`, `nama_level`) VALUES
(1, 'admin'),
(2, 'guru'),
(3, 'siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `Id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `bobot` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggaran`
--

INSERT INTO `pelanggaran` (`Id`, `nama`, `bobot`) VALUES
(5, 'A', '90'),
(6, 'A-', '85'),
(7, 'B', '80'),
(8, 'B-', '75'),
(9, 'C', '65'),
(10, 'C-', '60'),
(11, 'D', '50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `foto`, `level`, `nama`) VALUES
(1, 'admin', 'admin', 'admin', 1, 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id_nilai` int(11) NOT NULL,
  `id_pelanggaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nis` varchar(30) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id_nilai`, `id_pelanggaran`, `tanggal`, `nis`, `keterangan`) VALUES
(12, 7, '2021-07-27', '1000234098', 'Semnagat Terus ya belajarnya'),
(13, 6, '2021-07-27', '10002345679', 'NIlai motorik sudah bagus'),
(14, 5, '2021-07-27', '1000654321789', 'Semangat Terus belajarnya ya'),
(15, 9, '2021-07-27', '1000987234765', 'Jangan sering bolos lo ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `no_hp_ortu` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `alamat`, `nik`, `no_hp_ortu`, `foto`, `username`, `password`) VALUES
('1000234098', 'Jerry', 'Leban', '1230987654', '087653421345', 'admin7.jpg', '1000234098', '1000234098'),
('10002345679', 'Hari', 'Leban', '1230987654', '08962315332', 'admin6.jpg', '10002345679', '10002345679'),
('1000654321789', 'Yuyun', 'Ngudi', '1230987654', '087654321456', 'admin8.jpg', '1000654321789', '1000654321789'),
('1000987234765', 'Nike', 'Lajar', '1230987654', '08765432167', 'admin9.jpg', '1000987234765', '1000987234765');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_nilai`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_nilai` (
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_nilai`
--
DROP TABLE IF EXISTS `v_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nilai`  AS SELECT `p`.`id_nilai` AS `id_nilai`, `s`.`alamat` AS `alamat`, `s`.`nama` AS `nama`, `s`.`kelas` AS `kelas`, `p`.`tanggal` AS `tanggal`, `pl`.`bobot` AS `bobot`, `s`.`nis` AS `nis`, `p`.`keterangan` AS `keterangan`, `s`.`no_hp_ortu` AS `no_hp_ortu`, `pl`.`nama` AS `tingakt_kenakalan` FROM ((`penilaian` `p` join `siswa` `s`) join `pelanggaran` `pl`) WHERE `p`.`id_pelanggaran` = `pl`.`Id` AND `p`.`nis` = `s`.`nis` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`Id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
