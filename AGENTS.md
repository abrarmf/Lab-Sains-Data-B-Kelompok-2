# AGENTS.md — Instruksi untuk AI (Lab Sains Data B, Kelompok 2)

> Dibaca harness di awal setiap sesi (Claude Code membacanya lewat `CLAUDE.md`). Untuk AI lain, tempel isi berkas ini di awal percakapan.

## Tujuan
Sistem database harga bumbu untuk membantu **pemilik warung makan di Kota Semarang** memutuskan, **setiap Sabtu sore**, berapa kg cabai rawit merah, cabai merah keriting, bawang merah, dan bawang putih yang dibeli untuk minggu depan: sekaligus pada hari Sabtu, atau sebagian ditunda ke Rabu.
Empat pertanyaan analitik ada di `01-riset/keputusan-dan-pertanyaan.md`. Sumber utama: PIHPS Nasional Bank Indonesia (Kota Semarang, pasar tradisional).

## Aturan AI dan data
1. **Jangan mengarang** data, angka, tautan, harga, atau kutipan ulasan. Setiap angka harus bisa ditelusuri ke berkas, kode, atau tautan yang sudah dibuka. Kalau belum dicek, tulis "perlu dicek".
2. **Sumber yang belum dibuka sendiri tidak boleh masuk tabel** `01-riset/sumber-data.md`. Tandai usulan yang tidak yakin masih ada.
3. **Jangan menulis kunci, token, atau sandi** ke berkas apa pun. Simpan di `.env` (sudah di `.gitignore`). Kunci yang terlanjur ter-commit dianggap bocor: cabut, buat baru, catat di `LOG-AI.md`.
4. **Data pribadi tidak masuk repo**: nama, nomor HP, email, alamat, NIK orang sungguhan. Kolom seperti itu dibuang sebelum data disimpan ke `data/sampel/`. Nama pengulas di tangkapan layar disamarkan.
5. **Data warung mitra** tidak ditempel ke layanan AI yang memakai percakapan untuk melatih model; anonimkan dulu. Formulir memuat pemberitahuan: data apa, untuk apa, siapa yang melihat, kapan dihapus.
6. **Jangan mengubah isi `data/mentah/`** (tidak di-commit). Data PIHPS lengkap, bila diunduh, disimpan di sana; repo hanya memuat sampel.
7. **Kutipan ulasan** dicocokkan dengan tangkapan layarnya di `01-riset/bukti/`. Dilarang scraping massal.
8. **Setiap harga dan biaya pesaing** wajib bersumber dan bertanggal.
9. **Skill pihak ketiga** dipasang hanya setelah diperiksa dan dicatat di `SKILL-TERPASANG.md`.
10. **Tag Release** (`tugas-1`, `tugas-2`, …) tidak boleh dipindah atau dihapus. Jangan pernah melakukan `git push --force`.
11. Tulis dalam **bahasa Indonesia** yang singkat dan jelaskan alasannya, supaya setiap anggota bisa menjelaskan isi repo saat ditanya.

## Struktur
| Path | Isi |
|---|---|
| `README.md` | Papan Status di paling atas |
| `KENAPA-KAMI.md` | alasan sistem dibuat, alternatif, dan kapan alternatif lebih baik |
| `LOG-AI.md` | catatan pekerjaan AI: perintah, hasil, yang dicek manusia |
| `HARNESS.md`, `SKILL-TERPASANG.md` | harness, sambungan aplikasi, skill yang diperiksa |
| `00-admin/` | anggota, bukti (tangkapan layar, uji skill), izin data |
| `01-riset/` | keputusan & pertanyaan, sumber data, riset kreatif, bukti bertanggal |
| `data/sampel/` | potongan kecil data yang sudah bersih (tanpa data pribadi) |
| `data/mentah/` | data asli dari sumber, **tidak di-commit** |
| `kamus-data.md` | arti setiap kolom di `data/sampel/` |
| `.claude/skills/` | skill yang lolos pemeriksaan dan boleh di-commit |
| `laporan/`, `notebook/`, `sql/`, `data/*.csv` | arsip pertemuan 8–10 (proyek sentimen NusaX); aturannya ada di bagian akhir |

## Log AI
Setiap pekerjaan AI yang hasilnya masuk repo dicatat di `LOG-AI.md` dengan format:
```
## <tanggal>, <nama anggota>
Perintah: "<perintah penting>"
Hasil   : <berkas/angka yang dihasilkan>
Dicek   : <apa yang dicek manusia, apa yang salah, apa yang diperbaiki>
```
Di akhir sesi, AI menambahkan ringkasan dengan format yang sama, lalu anggota memeriksa isinya.

## Arsip P8–P10 (proyek sentimen NusaX)
Aturan lama tetap berlaku untuk berkas di `laporan/`, `notebook/`, `sql/`, dan `data/*.csv`:
- File `raw_*.csv` tidak diubah dan tidak diunggah. Teks dianonimkan (nama → `[NAMA]`) sebelum dikirim ke AI.
- Setiap langkah pembersihan memanggil `catat()` (masuk `data/log_pembersihan.csv`).
- Label hanya `negative` / `neutral` / `positive`. Saat melabel, AI tidak boleh melihat label pakar.
- Notebook harus lolos Runtime › Run all di Colab. SQL ditulis untuk DuckDB.
- Ambang keputusan P8 (A ≥ 85% & recall negatif ≥ 80%; B 70–85%; C < 70%) tidak diubah tanpa persetujuan kelompok.
