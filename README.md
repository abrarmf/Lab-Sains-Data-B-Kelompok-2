# Lab Sains Data (B) — Kelompok 2

## Papan Status

Tautan mengarah ke **versi tag** `tugas-1` dan baru bisa dibuka setelah Release `tugas-1` terbit.

| Tugas | Berkas | Penanggung jawab | Status |
|---|---|---|---|
| TK1 | [01-riset/keputusan-dan-pertanyaan.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/01-riset/keputusan-dan-pertanyaan.md) | Dezra | Draf — menunggu review |
| TK1 | [01-riset/sumber-data.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/01-riset/sumber-data.md) | Abrar | Draf — menunggu review |
| TK1 | [01-riset/riset-kreatif.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/01-riset/riset-kreatif.md) | Dezra | Draf — menunggu review |
| TK1 | [data/sampel/](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/tree/tugas-1/data/sampel), [kamus-data.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/kamus-data.md) | Samuel | Draf — menunggu review |
| TK1 | [KENAPA-KAMI.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/KENAPA-KAMI.md) v1 | Dezra | Draf — menunggu review |
| TK1 | [HARNESS.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/HARNESS.md), [SKILL-TERPASANG.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/SKILL-TERPASANG.md) | Semua (Abrar, Samuel) | Sebagian: harness & uji skill Dezra/Samuel belum |
| TK1 | [AGENTS.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/AGENTS.md), [LOG-AI.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/LOG-AI.md), [00-admin/anggota.md](https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/blob/tugas-1/00-admin/anggota.md) | Semua | Sebagian: baris "Dicek manusia" & uji commit tiap anggota belum |

**Belum selesai sebelum Release** (daftar periksa slide 32):
- [ ] Undang akun pemantau (Settings › Collaborators) dan pastikan diterima
- [ ] Dezra dan Samuel commit dari akun sendiri (`00-admin/anggota.md`)
- [ ] Baris "Dicek manusia" di `LOG-AI.md` diisi
- [ ] Tangkapan layar sambungan Sheets → `00-admin/bukti/sambungan-sheets.png`
- [ ] Uji skill DuckDB di laptop (Samuel)
- [ ] Review & merge Pull Request TK1, lalu buat Release `tugas-1` (target `main`) **sebelum 23.59 WIB sehari sebelum pertemuan 2**
- [ ] Setelah Release terbit, buka setiap tautan di Papan Status ini

**Proyek TK–TB:** sistem database harga bumbu untuk pemilik warung makan di Kota Semarang. Setiap Sabtu sore pemilik memutuskan berapa kg cabai rawit merah, cabai merah keriting, bawang merah, dan bawang putih yang dibeli untuk minggu depan: sekaligus, atau sebagian ditunda ke Rabu. Sumber utama: PIHPS Nasional Bank Indonesia (30.930 harga harian Kota Semarang, 2021–2026).

Catatan: nama repo ini tidak mengikuti pola `lds-k<nomor>-<nama-proyek>` (slide 3). Kelompok memutuskan memakai repo yang sudah ada sejak P8.

## Anggota
Abrar Mohammad Fathur (12010223140022) · Muhammad Dezra Aria (12010223140038) · Samuel Pinondang Simanjuntak (12010223140072). Rincian peran ada di `00-admin/anggota.md`.

## Struktur (TK1)
```
README.md              Papan Status
KENAPA-KAMI.md         v1: alternatif, biaya, celah, kapan alternatif lebih baik
LOG-AI.md              perintah, hasil, yang dicek manusia
HARNESS.md             harness + bukti sambungan Google Sheets
SKILL-TERPASANG.md     4 kandidat skill, hasil periksa dan uji
AGENTS.md / CLAUDE.md  file instruksi untuk AI
.gitignore             .env dan data/mentah/
.claude/skills/xlsx/   skill yang lolos periksa (Apache-2.0)
00-admin/              anggota.md, bukti/
01-riset/              keputusan-dan-pertanyaan.md, sumber-data.md, riset-kreatif.md, bukti/
data/sampel/           pihps_semarang_sampel.csv (100 baris)
kamus-data.md          kamus data sampel
```

Atribusi data: harga pangan © PIHPS Nasional – Bank Indonesia (<https://www.bi.go.id/hargapangan>). Repo hanya memuat sampel untuk keperluan tugas kuliah.

---

## Arsip P8–P10 (proyek sentimen ulasan, NusaX)

Proyek pertemuan 8–10: ringkasan sentimen ulasan pelanggan untuk aplikasi toko pakaian preloved/thrift (produk Lab Pemrograman). Keputusan: label sentimen diisi otomatis oleh AI (A), AI + cek manusia (B), atau tetap dibaca manual (C).

| Pertemuan | Isi | Status |
|---|---|---|
| P8 | Lembar Rencana Data, Lembar Verifikasi 5 sumber, data mentah + README_data, Log AI | Selesai (verifikasi tautan oleh anggota menunggu) |
| P9 | AI melabel 300 teks, cek 50 label oleh manusia | Label AI selesai (94,7% vs label pakar); cek 50 manusia menunggu |
| P10 | Tabel bersih, log pembersihan, SQL DuckDB, file instruksi AI (harness tahap 1) | Selesai — lihat [`laporan/Laporan_P10.md`](laporan/Laporan_P10.md) |

```
laporan/Laporan_P8_P9.md                 Rencana Data, Verifikasi, hasil P9, Log AI
laporan/Laporan_P10.md                   tabel bersih, log pembersihan, hasil SQL, Log AI
notebook/LabSainsData_P8_P9_Kelompok2.ipynb   P8–P9 (Run all)
notebook/P10_merapikan_data_sql.ipynb         P10 pembersihan + DuckDB (Run all)
sql/query_p10.sql                        query Q0–Q5
data/README_data.md, data/kamus_data.md  asal-usul data dan arti kolom
data/ulasan_bersih.csv, label_ai.csv, label_manusia.csv, log_pembersihan.csv   tabel bersih P10
data/bersih_2026-11-06.csv, teks_untuk_AI.csv, label_ai_300.csv, cek50_label_manusia.xlsx   P8–P9
```

File mentah `raw_*.csv` sengaja tidak diunggah karena masih memuat nama orang; notebook membuatnya ulang dari sumber. Buka notebook di Google Colab lalu jalankan **Runtime → Run all**.

Data P8–P10 turunan dari **NusaX-senti** (IndoNLP), lisensi **CC BY-SA 4.0**. Winata, G. I., Aji, A. F., Cahyawijaya, S., dkk. (2023). *NusaX: Multilingual Parallel Sentiment Dataset for 10 Indonesian Local Languages*. EACL 2023. https://github.com/IndoNLP/nusax
