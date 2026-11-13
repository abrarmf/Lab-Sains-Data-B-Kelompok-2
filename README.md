# Lab Sains Data (B) — Kelompok 2

Abrar Mohammad Fathur (12010223140022) · Muhammad Dezra Aria (12010223140038) · Samuel Pinondang Simanjuntak (12010223140072)

Proyek: ringkasan sentimen ulasan pelanggan untuk aplikasi **toko pakaian preloved/thrift** (produk Lab Pemrograman).
Keputusan: label sentimen diisi otomatis oleh AI (A), AI + cek manusia (B), atau tetap dibaca manual (C).

## Progres

| Pertemuan | Isi | Status |
|---|---|---|
| P8 | Lembar Rencana Data, Lembar Verifikasi 5 sumber, data mentah + README_data, Log AI | Selesai (verifikasi tautan oleh anggota menunggu) |
| P9 | AI melabel 300 teks, cek 50 label oleh manusia | Label AI selesai (94,7% vs label pakar); cek 50 manusia menunggu |
| P10 | Tabel bersih, log pembersihan, SQL DuckDB, file instruksi AI (harness tahap 1) | Selesai — lihat [`laporan/Laporan_P10.md`](laporan/Laporan_P10.md) |

## Struktur

```
AGENTS.md, CLAUDE.md                     instruksi untuk AI (harness tahap 1)
laporan/Laporan_P8_P9.md                 Rencana Data, Verifikasi, hasil P9, Log AI
laporan/Laporan_P10.md                   tabel bersih, log pembersihan, hasil SQL, Log AI
notebook/LabSainsData_P8_P9_Kelompok2.ipynb   P8–P9 (Run all)
notebook/P10_merapikan_data_sql.ipynb         P10 pembersihan + DuckDB (Run all)
sql/query_p10.sql                        query Q0–Q5
data/README_data.md                      asal-usul data
data/kamus_data.md                       arti setiap kolom tabel bersih
data/ulasan_bersih.csv                   tabel ulasan (1.000)
data/label_ai.csv                        tabel label_ai (300, format panjang)
data/label_manusia.csv                   tabel label_manusia (diisi dari cek 50)
data/log_pembersihan.csv                 log setiap langkah pembersihan
data/bersih_2026-11-06.csv               keluaran P8–P9 (teks setelah anonimisasi)
data/teks_untuk_AI.csv, label_ai_300.csv P9: 300 teks yang dikirim ke AI + hasilnya
data/cek50_label_manusia.xlsx            lembar cek 50 label (isi kolom kuning)
```

File mentah `raw_*.csv` sengaja **tidak** diunggah karena masih memuat nama orang. Notebook membuatnya ulang dari sumber.

## Menjalankan

Buka notebook di Google Colab (File → Open notebook → GitHub, tempel URL repo ini) lalu **Runtime → Run all**.
Notebook P10 mengambil label AI langsung dari repo ini, jadi tidak perlu mengunggah berkas.

## Lisensi dan atribusi data

Data turunan dari **NusaX-senti** (IndoNLP), lisensi **CC BY-SA 4.0**, sehingga berkas di `data/` juga dibagikan dengan CC BY-SA 4.0.
Winata, G. I., Aji, A. F., Cahyawijaya, S., dkk. (2023). *NusaX: Multilingual Parallel Sentiment Dataset for 10 Indonesian Local Languages*. EACL 2023. https://github.com/IndoNLP/nusax
