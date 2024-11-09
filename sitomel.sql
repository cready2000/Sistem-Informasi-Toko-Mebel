-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jun 2020 pada 06.47
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sitomel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'cready', 'cready2000', 'Cready Celgie Gildbrandsen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Sofa'),
(2, 'Rak'),
(3, 'Meja'),
(4, 'Kursi'),
(5, 'Lemari'),
(6, 'Lampu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Surabaya', 10000),
(2, 'Sidoarjo', 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'freestonsinaga@gmail.com', 'freeston', 'Freeston Hamonagan Sinaga', '0895338229123', '0'),
(2, 'primandikahakiki@gmail.com', 'primandika', 'Primandika Hakiki', '082333811976', '0'),
(3, 'andika@gmail.com', 'andika', 'andikasinaga', '081330998123', '0'),
(5, 'bujankku@yahoo.coid', '123', 'Bujank', '6969', 'ketapang'),
(6, 'Wibunekopoi@gmail.com', '123123123', 'Wibu', '123123123', 'ASDASDASD'),
(7, 'yemima@gmail.com', 'anaktuhan', 'yemima', '081238712831', 'Rungkut Medokan Asri IV-12 Surabaya'),
(8, 'Adi', 'Adi', 'Adi', '123', 'Test'),
(9, 'Adi10@gmail.com', 'Adi', 'Adi', '123', 'Tes'),
(10, 'ibrahim23@gmail.com', 'ibrahim23', 'Ibrahim', '081987654321', 'Jl. Bangil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(13, 19, 'Ibrahim', 'BCA', 2510000, '2020-06-07', '20200607154246sinterklas.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(19, 10, 1, '2020-06-07', 2510000, 'Surabaya', 10000, 'Gunung Anyar (60293)', 'sudah kirim pembayaran', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`) VALUES
(56, 0, 1, 1),
(57, 0, 3, 3),
(58, 0, 6, 2),
(59, 0, 5, 1),
(60, 0, 1, 1),
(61, 0, 3, 1),
(62, 0, 1, 1),
(63, 19, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`) VALUES
(1, 1, 'Sofa A1', 2500000, 50, 'sofa1.jpg', 'Dikenal memiliki konsep yang mewah dan elegan, nuansa ruang tamu klasik ala Eropa bisa anda wujudkan sebagai inspirasi rumah dengan kesan klasik nan elegan.\r\n\r\nKeunggulan :\r\n- Sofa Seater ini memiliki bahan High Quality\r\n- Mudah dibersihkan hanya dengan penyedot debu\r\n\r\nDeskripsi Produk:\r\n- Dimensi panjang : 170 cm, tinggi 90 cm, Lebar : 75 cm\r\n- Warna : Hitam\r\n- Bahan : Midili High Quality Grade A + kaki kayu fabric'),
(2, 1, 'Sofa A2', 1850000, 60, 'sofa(2).jpg', 'Merupakan sofa yang dirancang multi fungsi , dapat dijadikan sebagai sofa dan dapat dijadikan sofabed sesuai kemauan anda. Dengan design yang simple minimalis modern sangat cocok ditempatkan diruangan santai anda .\r\n\r\nKeunggulan :\r\n- Sofa yang Multi fungsi\r\n- Tidak mudah kotor\r\n- Bahan Sofa Oscar Kulit Shintetis dan Kaki Stainless Steel\r\n- Mudah dibersihkan hanya dengan LAP Kain Saja\r\n\r\nDeskripsi Produk :\r\n• Dimensi Bentuk Sofa: P 180cm x L 50cm x T 75cm\r\n• Dimensi Bentuk Sofa bed : P 180cm x L 100cm x T 42cm (Posisi Terbuka)\r\n• Warna : Hitam\r\n• Bahan : Oscar Myo - Kaki : Stainless Steel'),
(3, 1, 'Sofa A3', 2900000, 55, 'sofa3.jpg', 'Dikenal memiliki konsep yang mewah dan elegan, nuansa ruang tamu klasik ala Eropa bisa anda wujudkan sebagai inspirasi rumah dengan kesan klasik nan elegan.\r\n\r\nKeunggulan :\r\n- Sofa L bed putus yang Multi fungsi, bisa dijadikan sofa L kanan dan kiri, karna puff nya putus, sehingga gampang di pindahkan sesuai bentuk ruangan dan sesuai selera anda\r\n- Mudah dibersihkan hanya dengan Lap kain basah\r\n\r\nDeskripsi Produk:\r\n- Dimensi panjang : 210 cm, tinggi 95 cm, Lebar : 100 cm\r\n- Warna : Coklat\r\n- Bahan : kain oscar + kaki kayu fabric'),
(4, 1, 'Sofa A4', 2900000, 60, 'sofa4.jpg', 'Merupakan sofa L yang terbuat dari bahan fabric yang ramah lingkungan dan kaki yang dilapisi dengan kayu, dipadu dengan warna grey mocca yang bisa membuat ruang tamu atau ruang keluarga anda makin berwarna, cocok untuk menambah furniture di rumah anda\r\n\r\nKeunggulan :\r\n- Sofa L model minimalis modern\r\n- Mudah dibersihkan hanya dengan vacuum\r\n\r\nDeskripsi Produk:\r\nDimensi : P 200cm x L 175cm x T 75cm\r\nWarna : Abu-abu\r\nBahan : Kain - Kaki : Kayu fiber'),
(5, 1, 'Sofa A5', 1500000, 15, 'sofa5.jpg', 'Dikenal memiliki konsep yang mewah dan elegan, nuansa ruang tamu klasik ala Eropa bisa anda wujudkan sebagai inspirasi rumah dengan kesan klasik nan elegan.\r\n\r\nKeunggulan :\r\n- Sofa Seater ini memiliki bahan High Quality\r\n- Mudah dibersihkan hanya dengan penyedot debu\r\n\r\nDeskripsi Produk:\r\n- Dimensi: panjang : 60 cm, tinggi 75 cm, Lebar : 60 cm\r\n- Warna : Merah\r\n- Bahan : Oscar High Quality Grade A + kaki kayu fabric'),
(6, 1, 'Sofa A6', 1600000, 25, 'sofa6.jpg', 'Sofa Puff ini memiliki banyak fungsi, selain sebagai puff atau meja. Sofa puff ini memiliki desain yang elegan dan terlihat modern\r\n\r\nKeunggulan :\r\n- Mudah dibersihkan hanya dengan lap basah\r\n\r\nDeskripsi Produk:\r\n- Dimensi  anjang : 120 cm, tinggi 45 cm, Lebar : 50 cm\r\n- Warna : Coklat\r\n- Bahan : Midili'),
(7, 1, 'Sofa A7', 2500000, 40, 'sofa7.jpg', 'Saat akhir pekan biasanya kita mengisinya dengan menyalurkan hobi, seperti bermain musik atau bahkan sekedar mendengarkan playlist musik favorit sambil berbaring. Bayangkan nyamannya bermain musik atau berbaring mendengarkan playlist favorit ditemani dengan Sofa Muffin 2 Seater.\r\n\r\nKeunggulan :\r\n- Sofa minimalis modern\r\n- Mudah dibersihkan hanya dengan vacum\r\n\r\nDeskripsi Produk:\r\n- Dimensi panjang : 145 cm, tinggi 85 cm, Lebar : 75 cm\r\n- Warna : Merah\r\n- Bahan : kain suede/midili - Kaki : kayu scandivian'),
(8, 1, 'Sofa A8', 1250000, 12, 'sofa8.jpg', 'Dikenal memiliki konsep yang mewah dan elegan, nuansa ruang tamu klasik ala Eropa bisa anda wujudkan sebagai inspirasi rumah dengan kesan klasik nan elegan.\r\n\r\nKeunggulan :\r\n- Sofa Seater ini memiliki bahan High Quality\r\n- Mudah dibersihkan hanya dengan penyedot debu\r\n\r\nDeskripsi Produk:\r\n- Dimensi panjang : 100 cm, tinggi 90 cm, Lebar : 75 cm\r\n- Warna : Merah\r\n- Bahan : Daphnie/Kiera  + kaki kayu fabric'),
(9, 1, 'Sofa A9', 2250000, 55, 'sofa9.jpg', 'Dikenal memiliki konsep yang mewah dan elegan, nuansa ruang tamu klasik ala Eropa bisa anda wujudkan sebagai inspirasi rumah dengan kesan klasik nan elegan.\r\n\r\nKeunggulan :\r\n- Sofa Seater ini memiliki bahan High Quality\r\n- Mudah dibersihkan hanya dengan penyedot debu\r\n\r\nDeskripsi Produk:\r\n- Dimensi panjang : 160 cm, tinggi 85 cm, Lebar : 75 cm\r\n- Warna : Abu-abu\r\n- Bahan : Daphnie/Kagawa High Quality Grade A + kaki kayu fabric'),
(10, 1, 'Sofa A10', 4500000, 70, 'sofa10.jpg', 'Dikenal memiliki konsep yang mewah dan elegan, nuansa ruang tamu klasik ala scandinavian bisa anda wujudkan sebagai inspirasi rumah dengan kesan klasik nan elegan.\r\n\r\nKeunggulan :\r\n- Sofa L model modern\r\n- Mudah dibersihkan hanya dengan vacuum\r\n\r\nDeskripsi Produk:\r\n- Dimensi panjang : 180cm, tinggi 85 cm, lebar dudukan 75, Lebar L selonjoran: 160 cm\r\n- Warna : Biru'),
(11, 2, 'Rak B1', 120000, 10, 'rak1.jpg', 'Rak serbaguna terdiri dari 3 susun. Cocok digunakan untuk menyimpan buku atau pajangan anda, serta ideal pula digunakan sebagai tempat penyimpanan mainan kesayangan anak anda\r\n\r\nMaterial : Particle board\r\nDimensi : 40 x 29.5 x 87.1 cm'),
(12, 2, 'Rak B2', 18000, 1, 'rak2.jpg', 'Tempat Telur / Rak Telur susun 3 berbahan dasar kayu Pinus ini sangat cocok untuk digunakan di dapur, kesan alami sangat kental terasa, karena seluruhnya terbuat dari kayu, yang hobby melukis bisa juga digunakan untuk media lukis.\r\n\r\nUKURAN\r\nPanjang 28 cm\r\nLebar 6 cm\r\nTinggi 18 cm\r\nIsi 15 lubang telur\r\n'),
(13, 2, 'Rak B3', 150000, 2, 'rak3.jpg', 'Rak TV\r\nDidesain minimalis dan elegan\r\nDirancang anti jamur & bebas rayap\r\nIdeal untuk melengkapi furniture di rumah Anda\r\nMaterial : Partikel board, Dimensi : 58 x 40 x 56 cm'),
(14, 2, 'Rak B4', 125000, 3, 'rak4.jpg', 'Rak kayu bumbu dapur dari kayu jati belanda (pinus) susun 3 dilengkapi dengan kapstok gantungan. Bukan dari triplek, mdf atau particle board sehingga lebih kuat dan memiliki serat alami. Bukan pula terbuat dari WPC (wood plastic composite) seperti produk china yang harganya murah tetapi gampang patah. Produk ini asli produksi UKM, Karya anak bangsa.\r\n\r\nDifinishing dengan politur warna transparan sehingga masih terlihat keindahan serat kayunya. Kami selalu melakukan finishing dengan politur karena politur dapat berfungsi sebagai pelindung kayu agar lebih awet, bebas dari gangguan rayap sekaligus memperindah tampilan kayu.\r\n\r\nSelain itu kami juga sudah menggunakan \"politur berbahan dasar air\" sehingga lebih aman untuk kesehatan. Tidak berbahaya untuk peralatan dapur yang sering bersentuhan dengan bahan makanan. Kami tidak menggunakan vinishing vernish, politur atau melamin karena mengandung zat yang berbahaya untuk makanan, cek saja di google\r\n\r\nDikirim sudah dalam keadaan dirakit, tinggal pasang saja. Dilengkapi dengan 6 hook gantungan perkakas dapur serta rak yang dapat digunakan untuk menyimpan berbagai barang bumbu dapur. Pemasangan menggunakan sekrup dan fisher atau paku beton (Sudah Termasuk)\r\n\r\nUkuran panjang 37 cm x lebar 9 cm x tinggi 50 cm\r\n'),
(15, 2, 'Rak B5', 287000, 5, 'rak5.jpg', 'Size: 80 x 25 x 50 cm (H)\r\nTerbuat dari kayu white oak wood\r\nsolid wood - knock down - easy assembly - tanpa tools\r\nfinish: Sanding only/Unfinished/Minimalis\r\n\r\nKelebihannya:\r\n1. Bahan KAYU ASLI 100 %- BUKAN engineered wood/mdf/partikel board\r\n2. Tidak berbau kimia/bau plastik (contoh rak sepatu plastik)\r\n'),
(16, 2, 'Rak B6', 128000, 1, 'rak6.jpg', 'Rak sudut 3 susun kayu Dekorasi interior pajangan furniture dinding vintage klasik minimalis shabby chic\r\n\r\nProduk berkualitas buatan Mesin, bukan produk buatan tangan sehingga terjamin akurasi dan juga furnishing yang jauh lebih rapi sehingga membuat ruangan rumah anda lebih indah terlihat.\r\n\r\nApa itu wpc? Wpc adalah kepanjangan dari wood plastic composite, yang secara bahasa dapat diartikan komposit kayu-plastik. Composite bisa diartikan campuran, jadi wpc adalah campuran antara kayu dan plastik. Sebuah material baru yang tersusun dari elemen kayu dan plastik yang dilebur menjadi satu dan membentuk sebuah material baru, wpc. Bahan anti air, tidak gampang terbakar, mudah dibersihkan.\r\n\r\nKetebalan : 0,8cm\r\n'),
(17, 2, 'Rak B7', 80000, 1, 'rak7.jpg', 'Rak dinding multifungsi yang terbuat dari kayu komposit dengan desain vintage yang modern akan memberikan kesan elegan juga membuat dekorasi rumah memiliki kesan yang mewah.\r\n\r\nProduk berkualitas buatan Mesin, bukan produk buatan tangan sehingga terjamin akurasi dan akan terlihat lebih rapi sehingga membuat ruangan rumah anda lebih indah terlihat.\r\n\r\nMaterial : Wood Plastic Composite\r\nDimension : 8.5 Cm x 12 Cm x 7 Cm x 45 Cm'),
(18, 2, 'Rak B8', 35000, 1, 'rak8.jpg', 'Ready warna :\r\n#1 - kaktus\r\n#2 - biru strowberry\r\n#3 - pink strowberry\r\n#4 - putih flamingo\r\n#5 - biru flamingo\r\n\r\nPouch gantung terdiri dari 3 sekat. Berfungsi untuk tempat aksesoris, pernak pernik rumah dan dapur seperti kosmetik, alat rias, ikat rambut, remote, buku resep, pulpen, smartphone dan sejenisnya. Dilengkapi tali dan kayu, bisa digantung di tembok ruang tamu, kamar tidur atau di belakang pintu\r\n\r\nSize : 21 X 59 CM'),
(19, 2, 'Rak B9', 49000, 1, 'rak9.jpg', 'Bahan Kayu\r\nWarna Natural\r\nTerdiri dari 3 susun (24 lubang anting)\r\nUkuran 13 x 7 x 21 cm'),
(20, 2, 'Rak B10', 105000, 1, 'rak10.jpg', 'MATERIAL BERKUALITAS :\r\n1. HPL(hight press laminate) lapisan furniture\r\nterbaik dan terawet\r\n2. PLYWOOD GRADE A (lapisan kayu pilihan)\r\n\r\nAda banyak keuntungan yang akan kamu dapatkan.\r\n10 DIANTARANYA :\r\n1. PALING AWET BERTAHUN-TAHUN\r\n2. ANTI AIR\r\n3. TAHAN TERHADAP PANAS JIKA DIPASANG DILUAR RUANGAN\r\n4. TIDAK BISA ROBEK\r\n5. KUAT MENAHAN BEBAN SAMPAI 15KG\r\n6. PERMUKAAN SANGAT HALUS DAN TIDAK MENGGELEMBUNG\r\n7. KUAT TERHADAP GORESAN\r\n8. BAHAN KAYU LAPIS GRADE A\r\n9. LAPISAN FURNITURE TERBAIK (HIGTH PRESS LAMINATE)\r\n10. LENGKAP DENGAN SKRUP/BESI KOKOH DIDALAMNYA'),
(21, 3, 'Meja C1', 240000, 12, 'meja1.jpg', 'Deskripsi Meja makan jati belanda - 80x45, kayu natural\r\nMeja makan , kuat, kokoh dan awet dari kayu jati belanda. Menampilkan detail SERAT KAYU ASLI bukan stiker tempel yang bisa mengelupas.\r\n\r\nUkuran Panjang : 80cm dan 100cm\r\nLebar : 45 cm dan 50cm\r\nTinggi : 75cm\r\n\r\nTersedia warna natural dan hitam salak'),
(22, 3, 'Meja C2', 185000, 7, 'meja2.jpg', 'Deskripsi Meja lesehan kayu jati Belanda - Natural\r\nCocok taruh di kamar, Teras rumah buat belajar/ main Latop/ meja TV/ dispenser/ tempat kompor gas / tempat aquarium dan sebagainya\r\n\r\nSpesifikasi:\r\nMeja Terbuat dari kayu jati belanda yang bagus\r\nTinggi 30cm/ Panjang 80cm/ Lebar 45cm'),
(23, 3, 'Meja C3', 275000, 13, 'meja3.jpg', 'Deskripsi Meja Lipat 100x50x40 /Meja Laptop / Meja Makan / Meja Kayu Jati B\r\nMEJA LIPAT KAYU\r\n\r\nBAHAN :\r\nRangka Full kayu Jati Benda, bagian atas Triplek jerman\r\n\r\nUkuran : P100 X L50 X T40'),
(24, 3, 'Meja C4', 2000000, 15, 'meja4.jpg', 'Perabot mebel ini terbuat dari Material bahan Kayu Jati dengan Finishing Natural yang menonjolkan warna serat kayu Jati.\r\n\r\n- Praktis dan tidak memakan banyak ruang.\r\n- Awet kuat dan tahan lama karena terbuat dari kayu jati.\r\n- Sangat cocok untuk meja makan cafe resto dll.\r\n\r\nDimensi : P 180cm, L 110cm, T 75cm\r\nBahan : Kayu Jati\r\nFinishing : Natural Teak Oil'),
(25, 3, 'Meja C5', 800000, 15, 'meja5.jpg', 'Meja meeting lipat atau bisa di gunakan sebagai meja makan\r\nBahan rangka dari besi yg sangat kuat menggunakan besi holo 3x3\r\nTop tabel dari kayu solid jati Belanda\r\nBukan dari kayu olahan seperti multiplek / mdf\r\n\r\nUkuran meja\r\nPanjang : 100 cm\r\nLebar : 50 cm\r\nTinggi. : 75 cm'),
(26, 4, 'Kursi D1', 250000, 13, 'kursi1.jpg', 'Kursi Kantor atau Kursi Sekretaris (pakai tangan)\r\nSudah Dikondisikan Total Sehingga Tampilan dan Fungsi Kembali Normal dan Baik\r\n\r\nSpesifikasi : Sistem Hidrolic (naik turun)'),
(27, 4, 'Kursi D2', 185000, 8, 'kursi2.jpg', 'Menjual peralatan dan perlengkapan kantor kualitas baik harga bersahabat\r\nKondisi siap pakai\r\nKualitas baik'),
(28, 4, 'Kursi D3', 159000, 27, 'kursi3.jpg', 'Modern minimalis\r\nDimensi produk : 32 x 32 x 46 cm\r\nMaterial : metal, PVC\r\nFinishing : powder coating\r\n\r\nBangku merupakan salah satu alternatif tempat duduk yang sering digunakan di berbagai kesempatan. Selain bentuknya yang minimalis, bangku juga cenderung lebih ringan untuk dipindahkan. Dengan Timmy Bangku, duduk pun semakin nyaman kapan pun dan dimana pun. Bangku bergaya modern ini terbuat dari material berkualitas dengan konstruksi kokoh. Cocok digunakan di rumah, perkantoran hingga kafe.'),
(29, 4, 'Kursi D4', 100000, 10, 'kursi4.jpg', 'Bangku serbaguna\r\nDapat dilipat\r\nDimensi produk : 30 x 34 x 48.5 cm\r\nMaterial : metal dan PU\r\nFinishing : powder coating\r\n\r\nBangku dengan desain minimalis ini praktis dibawa kemana pun. Dudukannya empuk, nyaman digunakan untuk duduk santai. Untuk bagian kaki bangku, terbuat dari metal berkualitas dengan lapisan powder coating agar lebih tahan karat.'),
(30, 4, 'Kursi D5', 359000, 7, 'kursi5.jpg', 'Desain minimalis\r\nTinggi dudukan dapat diatur\r\nDimensi produk : 46 x 46 x (44 - 46 cm)\r\nMateriak : metal, polypropylene\r\n\r\nBangku serbaguna untuk di berbagai kesempatan. Dixie Bangku hadir dengan desain minimalis yang praktis digunakan. Anda bisa menggunakan tuas di bawah bangku untuk mengatur tinggi dudukan sesuai kenyamanan. Rangka bangku terbuat dari material berkualitas, dengan 4 kaki yang kuat menopang.'),
(31, 4, 'Kursi D6', 359000, 7, 'kursi6.jpg', 'Desain minimalis\r\nTinggi dudukan dapat diatur\r\nKaki dengan roda\r\nDimensi produk : 46 x 46 x (44 - 66 cm)\r\nMateriak : metal, polypropylene\r\n\r\nBangku serbaguna untuk di berbagai kesempatan. Dixie Bangku hadir dengan desain minimalis yang praktis digunakan. Anda bisa menggunakan tuas di bawah bangku untuk mengatur tinggi dudukan sesuai kenyamanan. Rangka bangku terbuat dari material berkualitas, dengan kaki beroda agar bangku mudah dipindah.'),
(32, 4, 'Kursi D7', 50000, 18, 'kursi7.jpg', 'Desain minimalis\r\nCocok untuk kebutuhan pribadi maupun bisnis seperti restoran dan kantin\r\nDapat ditumpuk\r\nMaterial : metal\r\nFinishing : powder coating\r\nDimensi produk : D.29.5 x T.44.5 cm\r\n\r\nRingan, minimalis dan tahan lama, Xinzo Bangku dapat digunakan untuk berbagai kebutuhan di rumah ataupun tempat usaha. Lapisan pada dasar kaki bangku mencegah timbulnya goresan atau merusak permukaan lantai. Bangku ini juga dapat ditumpuk sehingga menghemat ruang penyimpanan.'),
(33, 4, 'Kursi D8', 309000, 17, 'kursi8.jpg', 'Desain minimalis\r\nUkuran produk : 44x48x51 cm\r\nMaterial : polypropylene, logam\r\nFinishing : coating powder\r\nKuat dan tahan karat\r\nDapat ditumpuk\r\n\r\nNew Ibiza Kursi bergaya minimalis ini cocok digunakan untuk berbagai keperluan. Kursi ini terbuat dari material polypropylene dan logam, dengan struktur rangka yang kuat dan kokoh. Dudukan dan sandaran yang lebar dapat menopang tubuh dengan nyaman dan rileks. New Ibiza Kursi cocok untuk area kantin, restoran, aula dan lainnya.'),
(34, 4, 'Kursi D9', 2500000, 30, 'kursi9.jpg', 'Tuas hidrolik untuk mengatur tinggi dudukan\r\nRoda pada bagian kaki\r\nPenopang lengan\r\nDimensi produk : 62 x 50 x 116 cm\r\nMaterial : metal, polyurethane\r\n\r\nCouncil Kursi Kantor menjadi pilihan yang tepat untuk melengkapi kebutuhan ruang kerja Anda. Hadir dalam material berkualitas serta warna hitam yang elegan memberikan nilai presisi pada interior kantor. Tubuh akan terasa lebih nyaman dan rileks berkat desainnya yang ergonomis serta dudukan dan sandaran yang empuk. Gunakan tuas hidrolik untuk mengatur tinggi dudukan.'),
(35, 4, 'Kursi D10', 200000, 4, 'kursi10.jpg', 'Praktis dan serbaguna\r\nKuat dan tahan lama\r\nDimensi produk : 54 x 57 x77.5 cm\r\nMaterial : polyethene\r\n\r\nPraktis dan serbaguna untuk dipakai di berbagai kesempatan merupakan keunggulan dari kursi susun ini. Kursi ini terbuat dari material berkualitas dengan rangka yang kokoh. Dapat ditumpuk / disusun saat tidak digunakan sehingga hemat ruang penyimpanan. '),
(36, 5, 'Lemari E1', 900000, 16, 'lemari1.jpg', 'Pintu dilengkapi kunci\r\nBisa digunakan untuk kebutuhan kantor, sekolah, perpustakaan, rumah\r\nDimensi produk : 60 x 40 x 101.5 cm\r\nMaterial : metal\r\nFinishing : powder coating\r\n\r\nLemari kantor memberikan kemudahan untuk menyimpan dokumen, perlengkapan kantor hingga kebutuhan pribadi. Lemari ini memiliki 2 tingkat penyimpanan, dengan pintu berkunci agar barang-barang tersimpan dengan lebih aman. Lemari ini dibuat dari material metal yang kokoh berlapis powder coating agar tahan karat. Cocok digunakan di kantor, sekolah, perpustakaan umum dan rumah pribadi.'),
(37, 5, 'Lemari E2', 600000, 12, 'lemari2.jpg', 'Pintu dilengkapi kunci\r\nBisa digunakan untuk kebutuhan kantor, sekolah, perpustakaan, rumah\r\nDimensi produk : 42.5 x 40 x 101.5 cm\r\nMaterial : metal\r\nFinishing : powder coating\r\n\r\nLemari dari memberikan kemudahan untuk menyimpan dokumen, perlengkapan kantor hingga kebutuhan pribadi. Bagian dalam lemari dilengkapi rak tingkat, dengan pintu berkunci agar barang-barang tersimpan dengan lebih aman. Lemari ini dibuat dari material metal yang kokoh berlapis powder coating agar tahan karat. Cocok digunakan di kantor, sekolah, perpustakaan umum dan rumah pribadi.'),
(38, 5, 'Lemari E3', 560000, 9, 'lemari3.jpg', 'Dilengkapi kunci\r\nBisa digunakan di kantor, sekolah, perpustakaan, rumah, dll\r\nDimensi produk : 40 x 40 x 75 cm\r\nMaterial : metal\r\nFinishing : powder coating\r\n\r\nOrla Lemari Arsip memberikan kemudahan bagi Anda untuk menyimpan arsip, dokumen, buku dan barang lainnya. Selain praktis, lemari ini juga didesain dengan kunci agar lebih aman ketika menyimpan benda-benda berharga. Lemari Arsip Orla terbuat dari material metal berkualitas dengan finishing powder coating agar lebih tahan karat.'),
(39, 5, 'Lemari E4', 910000, 16, 'lemari4.jpg', 'Dilengkapi kunci\r\nBisa digunakan di kantor, sekolah, perpustakaan, rumah, dll\r\nDimensi produk : 40 x 40 x 120 cm\r\nMaterial : metal\r\nFinishing : powder coating\r\n\r\nMenggunakan lemari arsip merupakan salah satu solusi untuk menyimpan dokumen, buku dan perlengkapan kantor lainnya agar lebih terorganisir. Selain praktis, lemari ini juga didesain dengan kunci agar lebih aman ketika menyimpan benda-benda berharga. Lemari Arsip Orla terbuat dari material metal berkualitas dengan finishing powder coating agar lebih tahan karat.'),
(40, 5, 'Lemari E5', 840000, 16, 'lemari5.jpg', 'Dilengkapi kunci\r\nBisa digunakan di kantor, sekolah, perpustakaan, rumah, dll\r\nDimensi produk : 38 x 60 x 75 cm\r\nMaterial : metal\r\nFinishing : powder coating\r\n\r\nGunakan Orla Lemari Arsip untuk menyimpan arsip, dokumen, buku dan barang lainnya. Selain praktis, lemari ini juga didesain dengan kunci agar lebih aman ketika menyimpan benda-benda berharga. Lemari arsip Orla terbuat dari material metal berkualitas dengan finishing powder coating agar lebih tahan karat.'),
(41, 5, 'Lemari E6', 1500000, 20, 'lemari6.jpg', 'Lemari pakaian fleksibel\r\nMaterial rangka : besi\r\nMaterial cover : polyester\r\nKapasitas beban : 40 - 70 kg\r\nDilengkapi dengan 4 buah roda\r\nDimensi produk : 90.7 x 45.7 x 192 cm\r\nDapat dilipat saat tidak digunakan\r\nDilengkapi 2 tiang gantung\r\n\r\nLemari pakaian lipat persembahan dari Kris merupakan salah satu lemari penyimpanan yang praktis digunakan untuk hunian minimalis. Lemari pakaian ini dapat dilipat dengan mudah ketika akan dipindahkan ke tempat lain. Dilengkapi dengan 2 buah tiang gantung pakaian untuk kapasitas muatan yang lebih banyak. Rangka lemari pakaian ini kokoh dan kuat sehingga tidak akan roboh selama muatan di dalamnya tidak berlebihan. Dilengkapi dengan roda agar mudah saat hendak dipindahkan.'),
(42, 5, 'Lemari E7', 230000, 6, 'lemari7.jpg', 'Dapat dilipat saat tidak digunakan\r\nDilengkapi tiang gantung dan wadah pakaian lipat\r\nMaterial : besi dan kain\r\nDimensi produk : 90 x 45 x 178 cm\r\n\r\nHadirkan Krishome Lemari Pakaian Lipat sebagai solusi tempat penyimpanan pakaian yang fleksibel dan praktis. Lemari pakaian ini dapat dilipat dengan mudah ketika akan dipindahkan ke tempat lain. Selain itu, bagian penyimpanannya tersedia dalam 2 pilihan yaitu, digantung dan dilipat.'),
(43, 5, 'Lemari E8', 14800000, 215, 'lemari8.jpg', 'Dimensi produk : 193.5 x 62 x 220 cm\r\nFinishing : melamine\r\nMaterial : MDF\r\nDesain simpel klasik\r\nMenggunakan 4 pintu tarik\r\n\r\nSimpan berbagai jenis pakaian serta aksesoris fashion Anda dengan menggunakan lemari yang berukuran besar seperti Lemari Roketron 4 pintu ini. Lemari dengan desain simpel klasik ini akan menampung banyak pakaian dengan dilipat ataupun digantung. Terdapat laci dan rak tingkat di dalam lemari sehingga Anda bisa menyusun pakaian sesuai dengan kebutuhan. Terbuat dari material MDF dengan finishing melamine yang membuat tampilan lemari lebih rapi.'),
(44, 5, 'Lemari E9', 10150000, 159, 'lemari9.jpg', 'Material : particle board\r\nDimensi produk : 149.4 x 59.2 x 200 cm\r\nDesain minimalis dengan nuansa warna kayu\r\nCermin pada satu pintu\r\n\r\nUntuk kamar yang minimalis, penggunaan lemari dengan pintu geser adalah solusi yang tepat. Anda bisa menggunakan Malta Lemari 2 Pintu yang memakai fitur slide atau geser pada pintunya sehingga tidak memakan ruang di kamar Anda. Lemari ini juga dilengkapi dengan rak baju serta laci penyimpanan yang cukup besar untuk menampung berbagai pakaian dan barang pribadi Anda.'),
(45, 5, 'Lemari E10', 4400000, 119, 'lemari10.jpg', 'Desain minimalis\r\nDimensi produk : 115.3 x 60 x 202.3 cm\r\nMaterial : particle board\r\nFinishing : paper foil\r\nTerdiri dari 1 pintu sliding dan 1 pintu swing\r\nDilengkapi dengan kunci pintu\r\ndilengkapi dengan kaca cermin\r\n\r\nSimpan dengan rapi pakaian serta koleksi fashion Anda dengan menggunakan Madelon lemari pakaian persembahan dari Informa. Lemari ini memiliki kapasitas ruang yang cukup luas, dengan laci dan gantungan di dalam lemari untuk memaksimalkan penyimpanan. Hadir dengan desin modern minimalis yang cocok untuk berbagai tema ruangan. Terdapat pula cermin pada pintu lemari.'),
(46, 6, 'Lampu F1', 10000, 1, 'lampu1.jpg', 'Daya : 5 Watt\r\nIntensitas cahaya : 360 lumens\r\nTemperatur warna : 6500 Kelvin\r\nWarna lampu : putih kebiruan/cool daylight\r\nUsia lampu : 30.000 jam\r\n\r\nAPA Bohlam LED merupakan bohlam hemat energi dengan jangka waktu pemakaian yang lebih lama. Bohlam ini mengonsumsi daya 5 Watt, dengan kekuatan cahaya 360 lumen. Temperatur warna 6500 Kelvin menghasilkan cahaya putih kebiruan yang cocok untuk ruangan yang membutuhkan pencahayaan terang.'),
(47, 6, 'Lampu F2', 245000, 1, 'lampu2.jpg', 'Brand dari Austria\r\nLampu interior\r\nTipe soket : E27\r\nDaya maks. : 60 Watt\r\nMaterial : plastik, steel\r\nDimensi produk : 32.5 x 32.5 x 110 cm\r\nTidak termasuk bohlam\r\n\r\nNuansa modern di ruangan terasa lebih sempurna dengan sentuhan Eglo Tarbes Lampu Gantung Hias. Kap bergaya unik pada lampu dapat menjadi titik fokus yang cantik di dalam ruangan. Cocok untuk ruang tamu, ruang keluarga hingga ruang makan untuk memberikan pencahayaan fokus yang membantu aktivitas Anda.'),
(48, 6, 'Lampu F3', 350000, 2, 'lampu3.jpg', 'Desain industrial\r\nMaterial : metal\r\nDimensi produk : 27.5 x 16 x 46.5 cm\r\nTidak termasuk bohlam\r\n\r\nLampu merupakan salah satu elemen dekorasi yang cantik menghiasi ruangan. Pemilihan model dan ukuran lampu pun bisa Anda sesuaikan dengan tema ruangan. Untuk ruangan bernuansa industrial, Eglare Retro Lampu Meja merupakan pilihan tepat. Lampu gantung ini dibuat dari material metal yang kokoh, dengan warna putih yang natural. Cocok untuk rumah pribadi, apartemen, hingga hotel.'),
(49, 6, 'Lampu F4', 2300000, 9, 'lampu4.jpg', 'Desain elegan\r\nDengan 9 fitting lampu\r\nDimensi produk : Dia. 79 x 59 cm\r\nTipe soket : E14\r\nMaterial : iron, champagne color glass\r\nTidak termasuk bohlam\r\n\r\nDekorasikan ruangan Anda agar tampak lebih mewah dan berkelas menggunakan Lampu Gantung Hias dari Eglare. Selain sebagai sumber pencahayaan dalam ruangan, lampu gantung ini memiliki desain yang elegan sebagai dekorasi ruangan. Cocok ditempatkan pada ruang keluarga atau ruang tamu.'),
(50, 6, 'Lampu F5', 2800000, 12, 'lampu5.jpg', 'Dimensi produk : 76 x 76 x 58 cm  \r\nMemberikan aksen dekoratif untuk ruangan  \r\nTidak termasuk bohlam  \r\nDengan 8 fitting lampu\r\nTipe soket : E14\r\nDaya maksimal : 8 x 40 Watt\r\nMaterial : steel, kaca\r\n\r\nLampu tidak hanya dapat menjadi sumber cahaya di ruangan, namun juga dapat memberikan aksen tertentu. Dengan Lampu Gantung Hias dari Eglo, ruangan akan memiliki kesan modern yang memesona. Lampu ini dapat memberikan efek cahaya dekoratif di dalam ruangan. Berbagai lokasi ruangan dapat menjadi tempat ideal untuk menggantung lampu ini, seperti ruang tamu, ruang keluarga atau ruang makan.');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
