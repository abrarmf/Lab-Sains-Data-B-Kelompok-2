# Lab Sains Data P10 — Merapikan Data & SQL — Kelompok 2

Kelas B · 13 November 2026 · Abrar Mohammad Fathur (12010223140022) · Muhammad Dezra Aria (12010223140038) · Samuel Pinondang Simanjuntak (12010223140072)

Keputusan (dari P8): label sentimen ulasan toko thrift diisi **A** otomatis oleh AI, **B** AI + cek manusia, atau **C** manual.
Angka pembeda: akurasi label AI dan recall negatif.

**Yang dikumpulkan P10**
| Berkas | Isi |
|---|---|
| `notebook/P10_merapikan_data_sql.ipynb` | pembersihan + SQL DuckDB, lolos Run all tanpa unggah berkas |
| `data/ulasan_bersih.csv`, `data/label_ai.csv`, `data/label_manusia.csv` | tiga tabel bersih (kamus: `data/kamus_data.md`) |
| `data/log_pembersihan.csv` | log tiap langkah pembersihan |
| `sql/query_p10.sql` | query Q0–Q5 |
| `AGENTS.md` (+ `CLAUDE.md`) | file instruksi untuk AI (harness tahap 1, Klinik Alat AI) |

## 1. Tabel bersih

Prinsip: **1 tabel = 1 jenis hal, 1 baris = 1 kejadian, 1 kolom = 1 arti.**

| Tabel | 1 baris = | Baris | Kunci |
|---|---|---|---|
| `ulasan` | 1 ulasan | 1.000 | `id_ulasan` |
| `label_ai` | 1 label dari 1 model untuk 1 ulasan | 300 | `id_ulasan` + `model` + `versi_prompt` |
| `label_manusia` | 1 label hasil cek anggota | 0 (menunggu cek 50) | `id_ulasan` |

Label AI disimpan dalam format **panjang**, bukan sebagai kolom di tabel ulasan. Jadi kalau nanti label dari GLM atau DeepSeek ditambahkan, cukup ditambah baris baru dan query tidak perlu diubah.

## 2. Log pembersihan (`data/log_pembersihan.csv`)

| # | Tabel | Langkah | Alasan | Baris sebelum → sesudah | Sel diubah |
|---|---|---|---|---|---|
| 1 | ulasan | gabung 3 split NusaX | satu tabel, 1 baris = 1 ulasan | 1.000 → 1.000 | 0 |
| 2 | ulasan | buang baris kosong / id ganda | baris tanpa teks/label tidak bisa dinilai | 1.000 → 1.000 | 0 |
| 3 | ulasan | rapikan spasi awal/akhir & ganda | teks yang sama harus tertulis sama | 1.000 → 1.000 | **19** |
| 4 | ulasan | buang duplikat (huruf kecil, tanpa tanda baca) | satu ulasan tidak boleh dihitung dua kali | 1.000 → 1.000 | 0 |
| 5 | ulasan | seragamkan & validasi label | label di luar 3 nilai merusak hitungan akurasi | 1.000 → 1.000 | 0 |
| 6 | ulasan | buang label tidak sah | hanya negative/neutral/positive | 1.000 → 1.000 | 0 |
| 7 | ulasan | anonimisasi nama → `[NAMA]` | nama orang tidak boleh masuk AI/publik | 1.000 → 1.000 | **20** |
| 8 | ulasan | tambah kolom `n_kata`, `panjang`, `domain` | bahan pertanyaan SQL per kelompok | 1.000 → 1.000 | 0 |
| 9 | ulasan | ganti nama kolom & urutkan | nama kolom jelas, 1 arti per kolom | 1.000 → 1.000 | 0 |
| 10 | label_ai | validasi label AI P9 | label sah, 1 label per ulasan, id ada di ulasan | 300 → 300 | 0 |
| 11 | label_ai | tambah kolom model, versi_prompt, tanggal | setiap label bisa ditelusuri asalnya | 300 → 300 | 0 |

Tidak ada baris yang dibuang karena NusaX sudah dikurasi pakar. Itu temuan, bukan kelalaian: semua cek tetap dijalankan dan hasilnya tercatat 0.

**Temuan baru P10:** saat membaca teks per domain ditemukan **2 nama tanda tangan petugas CS** yang lolos anonimisasi P8 ("… apa yang dapat kami bantu? Yogi", "… Terima kasih. Erf"). Keduanya ditambahkan ke daftar nama, sehingga total sekarang **23 nama di 20 baris**. Kedua baris itu tidak termasuk 300 sampel P9, jadi label AI tidak berubah.

## 3. SQL di DuckDB (`sql/query_p10.sql`)

**Q0 — cek integritas:** `ulasan` 1.000 baris, 1.000 id unik; `label_ai` 300 baris, 300 id unik. Label tidak sah = 0, label AI tanpa pasangan ulasan = 0.

**Q1 — angka pembeda:** 284/300 benar = **akurasi 94,7%**, **recall negatif 99,1%** (sama dengan P9) → menurut ambang: **A (sementara)**.

**Q2 — akurasi per domain** (domain = heuristik kata kunci):

| domain | n dilabel AI | akurasi | n negatif |
|---|---|---|---|
| makanan_minuman | 138 | 94,9% | 32 |
| lainnya | 84 | 96,4% | 47 |
| belanja_toko | 15 | 93,3% | 7 |
| telko_internet | 15 | **80,0%** | 9 |
| berita_politik | 12 | 83,3% | 6 |
| bank_keuangan | 10 | 100% | 4 |
| transportasi | 10 | 100% | 5 |
| gawai_elektronik | 7 | 100% | 5 |
| hotel_wisata | 6 | 100% | 2 |
| **pakaian_fashion** | **3** | 100% | 0 |

Hanya **13 dari 1.000** ulasan (3 di sampel) bertopik pakaian. Akurasi di domain lain juga tidak seragam (telko 80%). Karena itu keputusan A belum bisa dipindahkan begitu saja ke toko thrift.

**Q3 — pola salah label:**

| label pakar → label AI | jumlah |
|---|---|
| neutral → negative | 6 |
| positive → neutral | 4 |
| positive → negative | 3 |
| neutral → positive | 2 |
| negative → neutral | 1 |

Keluhan hampir tidak pernah lolos (hanya 1 negatif yang dilabel netral). Kesalahan terbanyak justru AI terlalu cepat menganggap teks netral sebagai keluhan. Untuk toko, ini lebih aman: penjual membaca beberapa ulasan "keluhan palsu", bukan melewatkan keluhan asli.

**Q4 — akurasi per panjang teks:** pendek ≤ 12 kata 94,9% (n = 79); sedang 13–30 kata 95,9% (n = 145); panjang > 30 kata 92,1% (n = 76). Teks pendek (mirip ulasan marketplace) tidak lebih buruk.

**Q5 — cek 50 manusia:** query sudah siap, tetapi hasilnya masih kosong karena `label_manusia` belum diisi.

## 4. Harness tahap 1: file instruksi untuk AI

`AGENTS.md` berisi konteks proyek, struktur tabel, **10 aturan wajib** (tidak mengarang, file mentah tidak disentuh, anonimkan sebelum ke AI, setiap langkah dicatat, label tanpa kunci pakar, SQL DuckDB, dst.), daftar cek sebelum menyerahkan hasil, dan format Log AI. Cara pakai: tempel/unggah di awal setiap sesi AI. `CLAUDE.md` hanya mengimpor `AGENTS.md` agar alat yang membaca nama file itu juga memuatnya.

## 5. Keterbatasan

- Kolom `domain` adalah heuristik kata kunci, bukan label manusia. Contoh salah: "power bank" masuk `bank_keuangan`. Angka per domain hanya gambaran kasar.
- Notebook diuji lokal dengan SQLite sebagai pengganti DuckDB karena DuckDB tidak bisa dipasang di lingkungan uji. Query hanya memakai SQL standar yang berlaku di keduanya. **Jalankan Run all di Colab untuk memastikan hasil dengan DuckDB asli.**
- Label pakar NusaX sendiri kadang bisa diperdebatkan (lihat P9).

## 6. Log AI (P10)

| # | Alat/model | Untuk apa | Prompt / masukan ringkas | Hasil | Diterima / ditolak / diubah — alasan |
|---|---|---|---|---|---|
| 8 | Claude Opus 5.5 | Membaca jalur P10 dari slide P8 | Halaman P10 tidak bisa dibuka | Tugas: tabel bersih, log pembersihan, SQL DuckDB, file instruksi AI | Diterima; isi P10 ditafsirkan dari slide jalur P8 — **cek ke dosen jika ada format khusus**. |
| 9 | Claude Opus 5.5 | Merancang 3 tabel bersih & fungsi log | Data P8–P9 + prinsip tidy data | `ulasan`, `label_ai` (format panjang), `label_manusia` | Diterima. Label AI dipisah dari ulasan agar model lain bisa ditambah. |
| 10 | Claude Opus 5.5 | Heuristik kolom `domain` | Daftar kata kunci per topik | 10 domain | **Diubah/dibatasi**: diberi label "heuristik" karena ada salah klasifikasi (mis. "power bank"). |
| 11 | Claude Opus 5.5 | Membaca ulang teks per domain | Sampel 6 teks per domain | Menemukan 2 nama CS yang lolos | **Diubah**: daftar anonimisasi P8–P9 diperbarui (21 → 23 nama). |
| 12 | Claude Opus 5.5 | Menulis query Q0–Q5 | Pertanyaan yang terkait keputusan | 6 query | Diterima setelah diuji (via SQLite pengganti); angka Q1 sama dengan P9. |
| 13 | Claude Opus 5.5 | Menulis `AGENTS.md` | Aturan kelas + aturan proyek | 10 aturan + cek | Diterima; kelompok perlu membaca dan menyetujui aturannya. |
| 14 | Claude Opus 5.5 | Push tabel bersih ke GitHub | Hasil notebook P10 | Commit `cdf3e1a` ikut membawa `label_manusia.csv` hasil uji coba (label pakar dengan pemeriksa "uji", **bukan** cek anggota) | **Ditolak/diperbaiki**: dikosongkan di commit `cce67e8`. Pelajaran: salin keluaran hanya dari run bersih, bukan dari folder uji. |
| 15 | Claude Opus 5.5 | Mencoba Run all di Colab lewat browser | Tautan Colab notebook P10 | Notebook terbuka, tetapi butuh login Google untuk dijalankan | Belum: **anggota menjalankan Run all sendiri** untuk memastikan DuckDB asli. |

## 7. Yang masih harus dikerjakan kelompok

- [ ] Buka `notebook/P10_merapikan_data_sql.ipynb` di Colab → Runtime → Run all (memastikan DuckDB asli).
- [ ] Isi cek 50 label (`data/cek50_label_manusia.xlsx`) → simpan sebagai `cek50_terisi.csv` → Q5 terisi otomatis.
- [ ] Baca `AGENTS.md` bersama; ubah aturan bila tidak setuju.
- [ ] Persiapan lisan: setiap anggota bisa menjelaskan minimal 1 langkah log dan 1 query.

## 8. Persiapan tanya-jawab lisan

- **Kenapa tidak ada baris yang dibuang?** NusaX sudah dikurasi; cek kosong, duplikat, dan label tetap dijalankan dan hasilnya 0. Perubahan terjadi pada isi sel: 19 sel spasi dirapikan dan 20 sel dianonimkan.
- **Kenapa label AI di tabel terpisah?** Satu ulasan bisa punya banyak label (beberapa model/versi prompt). Kalau dijadikan kolom, setiap model baru butuh kolom baru.
- **Query mana yang menjawab keputusan?** Q1: akurasi 94,7% dan recall negatif 99,1% → A. Q2 menunjukkan kenapa masih sementara: hanya 13 ulasan pakaian.
- **Apa itu harness tahap 1?** File instruksi (`AGENTS.md`) yang membuat AI mana pun mengikuti aturan yang sama: tidak mengarang, anonimkan dulu, catat setiap langkah.
