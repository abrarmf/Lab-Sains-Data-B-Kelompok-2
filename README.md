# Lab Sains Data (B) — Kelompok 2

Abrar Mohammad Fathur (12010223140022) · Muhammad Dezra Aria (12010223140038) · Samuel Pinondang Simanjuntak (12010223140072)

Proyek: ringkasan sentimen ulasan pelanggan untuk aplikasi **toko pakaian preloved/thrift** (produk Lab Pemrograman).
Keputusan: label sentimen diisi otomatis oleh AI (A), AI + cek manusia (B), atau tetap dibaca manual (C).

## Progres

| Pertemuan | Isi | Status |
|---|---|---|
| P8 | Lembar Rencana Data, Lembar Verifikasi 5 sumber, data mentah + README_data, Log AI | Selesai (verifikasi tautan oleh anggota menunggu) |
| P9 | AI melabel 300 teks, cek 50 label oleh manusia | Label AI selesai (94,7% vs label pakar); cek 50 manusia menunggu |

## Struktur

```
laporan/Laporan_P8_P9.md                 Rencana Data, Verifikasi, hasil P9, Log AI
notebook/LabSainsData_P8_P9_Kelompok2.ipynb   Colab, lolos Run all (unduh data sendiri dari GitHub)
data/README_data.md                      asal-usul data
data/bersih_2026-11-06.csv               1.000 baris NusaX-senti setelah anonimisasi
data/teks_untuk_AI.csv                   300 teks yang dikirim ke AI (tanpa label)
data/label_ai_300.csv                    300 teks + label pakar + label AI
data/cek50_label_manusia.xlsx            lembar cek 50 label (isi kolom kuning)
```

File mentah `raw_*.csv` sengaja **tidak** diunggah karena masih memuat nama orang. Notebook membuatnya ulang dari sumber.

## Menjalankan

Buka notebook di Google Colab (File → Upload notebook, atau *Open in Colab* dari GitHub) lalu **Runtime → Run all**.

## Lisensi dan atribusi data

Data turunan dari **NusaX-senti** (IndoNLP), lisensi **CC BY-SA 4.0**, sehingga berkas di `data/` juga dibagikan dengan CC BY-SA 4.0.
Winata, G. I., Aji, A. F., Cahyawijaya, S., dkk. (2023). *NusaX: Multilingual Parallel Sentiment Dataset for 10 Indonesian Local Languages*. EACL 2023. https://github.com/IndoNLP/nusax
