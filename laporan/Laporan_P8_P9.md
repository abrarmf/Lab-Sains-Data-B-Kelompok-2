# Lab Sains Data P8–P9 — Kelompok 2

Kelas B · 6 November 2026 · Abrar Mohammad Fathur (12010223140022) · Muhammad Dezra Aria (12010223140038) · Samuel Pinondang Simanjuntak (12010223140072)

Produk Lab Pemrograman: **aplikasi toko pakaian preloved/thrift**.

## 1. Lembar Rencana Data (P8)

| Isian | Rencana Kelompok 2 |
|---|---|
| **KEPUTUSAN** | Tim pengembang aplikasi toko thrift (Kelompok 2) memutuskan, **sebelum fitur dikunci di P12**, bagaimana kolom "sentimen ulasan" di dasbor penjual diisi. |
| **PILIHAN** | **A** — AI (jalur gratis) melabel setiap ulasan secara otomatis, dengan audit sampel berkala. **B** — AI melabel, manusia memeriksa ulasan berlabel negatif/netral sebelum tampil. **C** — tetap seperti sekarang: penjual membaca ulasan satu per satu tanpa label. |
| **ANGKA PEMBEDA** | (1) **Akurasi** label AI dibanding label manusia. (2) **Recall negatif**: persentase keluhan (barang cacat, bau apek, ukuran tidak sesuai, telat kirim) yang tertangkap AI. Keluhan yang lolos paling merugikan toko thrift karena tiap barang hanya ada satu. |
| **AMBANG** (ditetapkan sebelum pelabelan) | **A** jika akurasi ≥ 85% **dan** recall negatif ≥ 80%. **B** jika akurasi 70–85% (atau akurasi ≥ 85% tetapi recall negatif < 80%). **C** jika akurasi < 70%. |
| **DATA** | ≥ 300 teks ulasan berbahasa Indonesia yang sudah berlabel sentimen oleh manusia/pakar, ditambah 50 label yang kami cek sendiri. |
| **SUMBER KANDIDAT** | (1) NusaX-senti Indonesia — dipakai. (2) PRDECT-ID (ulasan Tokopedia, 29 kategori) — cadangan. (3) IndoNLU SmSA — cek lisensi. |
| **UBAH PILIHAN?** | **Ya.** Akurasi < 70% membuat kami tetap di C, 70–85% membuat kami pilih B. ~~Survei "apakah orang suka belanja thrift"~~ dan ~~jumlah follower Instagram toko~~ dicoret: angka itu tidak mengubah cara melabel ulasan. |
| **LAMPU DATA** | **Kuning → hijau.** Dataset berlisensi terbuka, tetapi beberapa ulasan masih memuat nama orang, jadi dianonimkan dulu (21 nama di 18 baris diganti `[NAMA]`) sebelum dikirim ke AI. |
| **JIKA TIDAK ADA** | PRDECT-ID (CC BY 4.0) disaring ke kategori pakaian; atau 100 ulasan toko kami sendiri setelah aplikasi berjalan (kuning, dianonimkan); atau semua dilabel manual (pilihan C). |

Jenis analitik: **deskriptif/diagnostik** (mengukur seberapa sering AI benar) untuk keputusan berbasis ambang. Tingkat berikutnya: **prediktif**, yaitu memprediksi ulasan mana yang kemungkinan salah dilabel AI supaya hanya itu yang dicek manusia.

## 2. Lembar Verifikasi 5 Sumber (P8)

Lima sumber ini diusulkan oleh AI (Claude), lalu tiap tautan dibuka dan dicek satu per satu. **Kolom "Dicek oleh" wajib diisi anggota setelah membuka ulang tautannya sendiri.**

| # | Sumber usulan AI | Penerbit | Tanggal | Lisensi | Data pribadi? | Bisa diunduh? | Keputusan | Dicek oleh |
|---|---|---|---|---|---|---|---|---|
| 1 | NusaX-senti (Indonesia) — [github.com/IndoNLP/nusax](https://github.com/IndoNLP/nusax/tree/main/datasets/sentiment) | IndoNLP; Winata dkk., EACL 2023 | Rilis 2022; commit terakhir 8 Mei 2023 | Data CC BY-SA 4.0, kode Apache-2.0 (README repo) | Ada nama orang di 18 baris → dianonimkan | Ya — `git clone`, 500 + 100 + 400 = 1.000 baris, cocok | **Pakai** | |
| 2 | PRDECT-ID — [Mendeley Data, DOI 10.17632/574v66hf2v.1](https://data.mendeley.com/datasets/574v66hf2v/1) | Sutoyo dkk., Bina Nusantara University | 19 Mei 2022 | CC BY 4.0 (halaman Mendeley) | Ya: makalahnya menyebut nama penjual dan tautan produk ikut dikumpulkan → kuning | Daftar berkas tidak tampil saat dicek; ada salinan di Kaggle | **Cek** (cadangan) | |
| 3 | IndoNLU SmSA — [github.com/IndoNLP/indonlu](https://github.com/IndoNLP/indonlu) | IndoNLP; Purwarianti & Crisdayanti 2019 | 2019 | **Tidak konsisten**: kartu Hugging Face `indonlp/indonlu` menulis MIT, kartu SEACrowd menulis CC BY-SA 4.0 | Ulasan publik, kemungkinan ada nama | Ya (TSV di GitHub), belum diunduh | **Cek** (konfirmasi berkas LICENSE repo) | |
| 4 | `google-play-scraper` (PyPI) — ulasan aplikasi | Pengembang pihak ketiga, bukan Google | — | Lisensi pustaka ≠ izin atas data; materi P8 menyebut statusnya di aturan Google tidak jelas | Ya: hasilnya memuat nama pengguna | Ya, tetapi butuh scraping | **Tolak** untuk tugas wajib | |
| 5 | "Dataset ulasan produk fashion Shopee di Kaggle" | Tidak ditemukan | — | — | — | Tidak ada dataset spesifik; pencarian hanya menemukan skripsi/jurnal yang mengambil ulasan Shopee sendiri dengan scraping | **Tolak** — usulan tidak terbukti | |

**Persentase usulan AI yang salah: 1 dari 5 = 20%** (sumber no. 5 tidak ada). Satu lagi (no. 3) informasinya perlu koreksi karena lisensinya tidak konsisten antarsumber. Temuan sampingan: salinan PRDECT-ID di Hugging Face (`ZakyF/PRDECT-ID`) salah menyebut pembuat dataset, jadi mirror tidak dipakai sebagai bukti lisensi.

## 3. README_data

Lihat [`data/README_data.md`](../data/README_data.md).

## 4. Hasil P9: AI Melabel 300 Teks

**Cara kerja.** 300 teks bersih diambil acak (negative 117, positive 111, neutral 72). AI hanya menerima `no` + `text`, tanpa label asli. Prompt: *"Beri satu label sentimen untuk tiap teks: positive, neutral, atau negative. Sentimen = sikap penulis. Promosi/iklan/fakta tanpa sikap = neutral. Ulasan campuran = sikap yang dominan."* Label AI lalu dicocokkan dengan label pakar NusaX.

**Seberapa sering AI benar:** **284 dari 300 = 94,7%** (IK 95% bootstrap 92,0–97,0%), Cohen's kappa 0,918.

| Label pakar ↓ / Label AI → | negative | neutral | positive | Recall |
|---|---|---|---|---|
| negative (117) | **116** | 1 | 0 | 99,1% |
| neutral (72) | 6 | **64** | 2 | 88,9% |
| positive (111) | 3 | 4 | **104** | 93,7% |

Pola kesalahan (16 teks): terbanyak **netral → negatif (6)**, misalnya berita musibah dan keluhan faktual yang dianggap netral oleh pakar. Sisanya ulasan campuran yang berbeda tafsiran sikap dominannya. Pada 50 baris lembar cek, AI cocok dengan pakar 46/50 = 92%.

**Cek 50 label oleh manusia (wajib P9).** Buka `data/cek50_label_manusia.xlsx`, isi kolom kuning `label_manusia` tanpa melihat sheet `kunci_pakar`.

**Penerapan ambang.** Akurasi 94,7% ≥ 85% dan recall negatif 99,1% ≥ 80% → **pilihan A (sementara)**. Konfirmasi dengan hasil cek 50 manusia dan uji ulang pada ulasan toko thrift sendiri sebelum memo P12; jika akurasi di sana < 85%, pilihan berubah ke B.

## 5. Log AI

| # | Alat/model | Untuk apa | Prompt / masukan ringkas | Hasil | Diterima / ditolak / diubah — alasan |
|---|---|---|---|---|---|
| 1 | Claude Opus 5.5 | Membaca materi P8 dan menyusun daftar tugas | Tautan materi P8 + identitas kelompok | Daftar tugas P8 & persiapan P9 | Diterima. Halaman P9 belum bisa dibuka. |
| 2 | Claude Opus 5.5 | Mengusulkan 5 sumber data | "Sumber teks berlabel sentimen Indonesia yang legal & gratis untuk toko thrift" | 5 sumber | 2 ditolak (no. 5 tidak ada, no. 4 aturan tidak jelas); 1 perlu koreksi lisensi. |
| 3 | Claude Opus 5.5 | Verifikasi sumber (membuka halaman web) | Tautan tiap sumber | Penerbit, tanggal, lisensi | Diterima dengan syarat anggota membuka ulang tiap tautan. |
| 4 | Claude Opus 5.5 | Mengambil data | Unduh `train/valid/test.csv` | Percobaan lewat alat ringkasan web tidak memberi isi asli | **Ditolak**: diganti `git clone` repo resmi, jumlah baris dicocokkan 1.000. |
| 5 | Claude Opus 5.5 | Anonimisasi | Pindai pola sapaan + kapital | Daftar awal 14 nama | **Diubah**: ditemukan 6 nama lagi saat membaca sampel → 21 nama di 18 baris. |
| 6 | Claude Opus 5.5 | Melabel 300 teks (P9) | Prompt di bagian 4, hanya `no` + `text` | 300 label | Diterima sebagai "label AI"; 94,7% vs pakar, menunggu cek 50 manusia. |
| 7 | Claude Opus 5.5 | Notebook Colab, lembar cek .xlsx, laporan, repo GitHub | Spesifikasi tugas P8–P9 | Notebook 9 langkah, xlsx dengan rumus | Diterima setelah diuji: notebook jalan dari awal sampai akhir; rumus xlsx 0 error. |

## 6. Yang Masih Harus Dikerjakan Kelompok

- [ ] Isi 50 label sendiri di `data/cek50_label_manusia.xlsx`, lalu salin akurasinya ke kolom VALIDASI.
- [ ] Buka ulang 5 tautan di Lembar Verifikasi dan tulis nama pemeriksa.
- [ ] Buka notebook di Colab → Runtime → Run all.
- [ ] Klinik: email kuliah dengan 2FA + dua akun model AI China.
- [ ] Tanyakan ke dosen platform dan format pengumpulan.
