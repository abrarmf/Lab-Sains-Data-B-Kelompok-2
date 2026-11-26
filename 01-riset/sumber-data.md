# Inventaris Sumber Data

Penanggung jawab: Abrar Mohammad Fathur · semua tautan dibuka dan dicek 26 Nov 2026 · salinan tabel di Google Sheets "LDS K02 - Inventaris Sumber Data (TK1)" (lihat `HARNESS.md`)

## Data yang dibutuhkan (dari empat pertanyaan)
| Pertanyaan | Data |
|---|---|
| Deskriptif, prediktif | Harga harian/mingguan cabai rawit merah, cabai merah keriting, bawang merah, bawang putih di pasar tradisional Kota Semarang, ≥ 2 tahun |
| Diagnostik | Tanggal hari libur nasional & cuti bersama, periode Ramadan–Idulfitri, bulan musim hujan; inflasi bahan makanan Kota Semarang |
| Preskriptif | Kebutuhan mingguan bumbu, modal belanja, daya simpan cabai di warung (dari pemilik warung) |

## Tabel sumber
| # | Sumber | Cara mengambil | Lisensi atau izin | Frekuensi | Perkiraan baris | Data pribadi | Status |
|---|---|---|---|---|---|---|---|
| 1 | **PIHPS Nasional – Bank Indonesia**, Tabel Harga Berdasarkan Daerah, Jawa Tengah › Kota Semarang, Pasar Tradisional — <https://www.bi.go.id/hargapangan/TabelHarga/PasarTradisionalDaerah> | Tombol *Download* di halaman, atau permintaan JSON yang dipakai halaman itu (`/hargapangan/WebSite/TabelHarga/GetGridDataDaerah?price_type_id=1&province_id=14&regency_id=35&tipe_laporan=1&start_date=…&end_date=…`). Diuji lewat browser 26 Nov 2026. | Halaman hanya mencantumkan "Hak Cipta © PIHPS Nasional – Semua Hak Dilindungi"; **tidak ada lisensi terbuka**. Dipakai untuk tugas kuliah non-komersial dengan atribusi. Sebelum dipublikasikan di luar kelas: konfirmasi tertulis ke BI (BI Bicara 131 / bicara@bi.go.id), catat di `00-admin/izin-data/`. | Harian, hari kerja (dicacah 09.00–11.00, publikasi ±13.00 WIB) | **30.930** harga terisi = 21 komoditas × 1.473 hari kerja (4 Jan 2021 – 26 Nov 2026); **307 minggu**. Untuk 4 bumbu keputusan: 5.892 baris harian | Tidak ada | **Utama — dipakai** |
| 2 | **Panel Harga Pangan – Badan Pangan Nasional** — <https://panelharga.badanpangan.go.id/> | Tampilan web (filter wilayah & periode). Data diambil halaman dari API internal `api-panelhargav2.badanpangan.go.id` yang **tidak terdokumentasi resmi**. | Syarat pakai **tidak ditemukan**; halaman FAQ tampil kosong saat dicek. | Harian | Belum dihitung; histori minimal sejak Jan 2023 (dicek lewat filter periode) | Tidak ada | **Cek** — pembanding untuk memeriksa apakah PIHPS wajar |
| 3 | **SKB 3 Menteri Libur Nasional & Cuti Bersama** (2026: SKB No. 1497/2025, 2/2025, 5/2025, ditetapkan 19 Sep 2025) — <https://www.setneg.go.id/baca/index/inilah_skb_3_menteri_libur_nasional_dan_cuti_bersama_2026> | Diketik dari dokumen SKB resmi tiap tahun 2021–2026 | Dokumen publik pemerintah | Tahunan | ±150 tanggal (2026: 17 libur + 8 cuti bersama); tahun 2021–2025 **belum diketik** | Tidak ada | **Pakai** (diagnostik) |
| 4 | **BMKG – Prakiraan Cuaca** — <https://data.bmkg.go.id/prakiraan-cuaca/> | API publik `api.bmkg.go.id/publik/prakiraan-cuaca?adm4=<kode kelurahan>`, JSON, maks. 60 permintaan/menit | **Wajib mencantumkan BMKG** sebagai sumber | 2× sehari | Hanya **3 hari ke depan**, tanpa riwayat | Tidak ada | **Pelengkap saja** — tidak bisa dipakai untuk diagnostik |
| 5 | **BPS Kota Semarang – IHK dan Inflasi** — <https://semarangkota.bps.go.id/> (publikasi tahunan "Indeks Harga Konsumen dan Inflasi Kota Semarang") | Tabel/publikasi BPS | Ketentuan pakai BPS **belum dibaca** | Bulanan | ±70 bulan (2021–2026) | Tidak ada | **Cek** (diagnostik: inflasi kelompok makanan) |
| 6 | **Catatan belanja warung mitra** (kebutuhan mingguan, harga beli sebenarnya) | Formulir/Sheets yang diisi pemilik warung | **Wajib izin tertulis pemilik**; formulir memuat pemberitahuan (data apa, untuk apa, siapa melihat, kapan dihapus) | Mingguan | Belum ada (baru dimulai setelah izin) | Bisa ada (nama pemasok, nomor HP): **dibuang sebelum masuk repo** | **Belum ada** — pelengkap untuk preskriptif |

## Volume sumber utama (syarat ≥ 500 baris atau ≥ 24 periode)
- PIHPS Kota Semarang: **30.930 baris harian** dan **307 periode mingguan** → syarat terpenuhi jauh di atas minimum, sehingga di TK3 model bisa diuji pada minggu-minggu terpisah (mis. latih 2021–2024, uji 2025–2026).
- Cara menghitung: data harian 2021–2026 diambil per tahun, sel kosong/`-` dibuang, lalu tanggal dikelompokkan per minggu (Senin). Dikerjakan lewat browser oleh harness AI dan dicatat di `LOG-AI.md`.
- Cek kelengkapan: tiap komoditas punya 1.473 hari terisi; minyak goreng 1.472 (1 hari kosong).

## Keterbatasan yang sudah ketemu
- PIHPS hanya **2 pasar sampel** per kota. Harga di pasar langganan warung bisa berbeda. Ulasan pengguna aplikasi PIHPS juga mengeluhkan selisih ini (`bukti/2026-11-26_ulasan-play-harga-pangan-nasional.jpg`).
- Laporan **mingguan** bawaan PIHPS memberi label minggu yang tidak berurutan (mis. "Nov 2026 (V)" muncul sebelum "Nov 2026 (I)"). Karena itu yang diambil adalah data **harian**, lalu dirata-rata per minggu sendiri.
- Cuaca tidak punya riwayat publik di BMKG (hanya prakiraan), sehingga "musim hujan" diuji sebagai bulan kalender.
- Lisensi PIHPS bukan lisensi terbuka: repo hanya memuat **sampel kecil** (`data/sampel/`), bukan seluruh data.

## Usulan AI yang ternyata salah atau perlu dikoreksi
AI mengusulkan 6 sumber; semuanya dibuka sendiri.
- **Tidak ada / tautan mati: 0 dari 6 (0%).**
- **Informasi awal perlu dikoreksi setelah dibuka: 2 dari 6 (33%).**
  1. Panel Harga Bapanas: parameter yang ditebak AI untuk "harga konsumen" ternyata mengembalikan data berlabel *Produsen*.
  2. PIHPS: AI awalnya menyarankan memakai laporan mingguan bawaan, padahal labelnya tidak berurutan.

## Bukti
- `bukti/2026-11-26_pihps-tabel-harga.jpg` — halaman Tabel Harga PIHPS (periode 18–26 Nov 2026)
- `bukti/2026-11-26_panel-harga-bapanas.jpg` — beranda Panel Harga Bapanas (26 Nov 2026)
- `../data/sampel/pihps_semarang_sampel.csv` — 100 baris asli dari sumber #1 (jumlah harga 4.110.750, dicocokkan dengan data di browser)
