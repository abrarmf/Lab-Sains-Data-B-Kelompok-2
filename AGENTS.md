# Instruksi untuk AI — Lab Sains Data (B) Kelompok 2

> Harness tahap 1 (P10). File ini ditempel/diunggah di awal setiap sesi AI (Claude, GLM, DeepSeek, Kimi, Qwen, dll.)
> supaya AI bekerja dengan aturan yang sama. Alat yang membaca `AGENTS.md`/`CLAUDE.md` otomatis akan memuatnya sendiri.

## Konteks proyek
- Kelompok 2: Abrar Mohammad Fathur, Muhammad Dezra Aria, Samuel Pinondang Simanjuntak.
- Produk: aplikasi **toko pakaian preloved/thrift** (Lab Pemrograman).
- Keputusan: label sentimen ulasan pelanggan diisi **A** otomatis oleh AI, **B** AI + cek manusia, atau **C** dibaca manual.
- Angka pembeda: **akurasi** label AI dan **recall negatif**. Ambang (tetap, jangan diubah tanpa persetujuan kelompok):
  A bila akurasi ≥ 85% dan recall negatif ≥ 80%; B bila 70–85%; C bila < 70%.
- Data: NusaX-senti Indonesia (IndoNLP, CC BY-SA 4.0), 1.000 ulasan, label `negative` / `neutral` / `positive`.

## Struktur repo
| Path | Isi |
|---|---|
| `data/ulasan_bersih.csv` | tabel `ulasan`: 1 baris = 1 ulasan (`id_ulasan, split, teks, label_pakar, domain, n_kata, panjang, n_nama_diganti`) |
| `data/label_ai.csv` | tabel `label_ai`: 1 baris = 1 label dari 1 model (`id_ulasan, model, versi_prompt, tanggal_label, label_ai`) |
| `data/label_manusia.csv` | tabel `label_manusia`: hasil cek 50 label (`id_ulasan, pemeriksa, label_manusia`) |
| `data/log_pembersihan.csv` | setiap langkah pembersihan + jumlah baris sebelum/sesudah |
| `sql/query_p10.sql` | query DuckDB Q0–Q5 |
| `notebook/` | notebook Colab; harus lolos **Runtime → Run all** |
| `laporan/` | laporan per pertemuan + Log AI |

## Aturan wajib
1. **Jangan mengarang data, angka, atau sumber.** Setiap angka harus berasal dari kode yang bisa dijalankan atau tautan yang bisa dibuka. Kalau tidak tahu, tulis "tidak tahu" atau "perlu dicek".
2. **File mentah (`raw_*.csv`) tidak boleh diubah dan tidak boleh diunggah** ke repo publik atau ke AI. Semua perubahan dikerjakan di salinan.
3. **Anonimkan dulu sebelum mengirim teks ke AI**: nama orang → `[NAMA]`; @akun, URL, nomor HP, dan email tidak boleh ada.
4. Setiap langkah pembersihan **harus memanggil `catat()`** (masuk `log_pembersihan.csv`) dengan alasan dan jumlah baris.
5. Saat melabel, AI hanya menerima `id_ulasan` + `teks`, **tanpa label pakar**. Pakai prompt versi yang tercatat di `label_ai.versi_prompt`.
6. Label hanya boleh `negative`, `neutral`, atau `positive` (huruf kecil).
7. Notebook harus jalan dari awal sampai akhir di Colab tanpa unggah manual. Data diambil dari URL GitHub; file lokal hanya cadangan.
8. SQL ditulis untuk **DuckDB**, dengan nama tabel `ulasan`, `label_ai`, dan `label_manusia`.
9. Tulis dalam **bahasa Indonesia**, singkat, dan jelaskan alasan setiap langkah agar setiap anggota bisa menjawab tanya-jawab lisan.
10. **Tanyakan dulu** jika permintaan bisa diartikan lebih dari satu cara, atau jika ambang/keputusan akan berubah.

## Cek sebelum menyerahkan hasil
- [ ] `Q0` (cek integritas) memberi 0 label tidak sah dan 0 baris tanpa pasangan.
- [ ] Jumlah baris di `log_pembersihan.csv` sama dengan isi tabel akhir.
- [ ] Notebook lolos Run all; angka di laporan sama dengan keluaran notebook.
- [ ] Penggunaan AI dicatat di Log AI (alat/model, untuk apa, prompt ringkas, hasil, diterima/ditolak/diubah + alasan).

## Format satu baris Log AI
`| # | Alat/model | Untuk apa | Prompt / masukan ringkas | Hasil | Diterima / ditolak / diubah — alasan |`
