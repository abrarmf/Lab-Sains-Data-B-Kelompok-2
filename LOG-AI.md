# LOG-AI.md

Catatan setiap pekerjaan AI yang hasilnya masuk repo. **"Dicek"** berisi apa yang diperiksa dan apa yang diperbaiki. Baris **"Dicek manusia"** wajib diisi anggota yang memeriksa; isi berkas tanpa pemeriksaan manusia belum dianggap final.
Log pertemuan 8–10 (proyek NusaX) ada di `laporan/Laporan_P8_P9.md` dan `laporan/Laporan_P10.md`.

---

## 26 Nov 2026, Abrar (harness: Claude Code)
Perintah: "Baca instruksi Tugas Kecil 1 di slide atlas.stdsquare.com/tambahan/lab-sains-data/tk1, lalu kerjakan semua yang diminta. Dataset boleh di luar Semarang, lebih baik tetap di Indonesia."
Hasil   : AI membaca 34 slide, lalu menanyakan dua hal ke Abrar: topik (dipilih: **harga pangan untuk warung makan**) dan repo (dipilih: **repo lama** `Lab-Sains-Data-B-Kelompok-2`, bukan repo baru `lds-k02-…`).
Dicek   : Nama repo tidak mengikuti pola slide 3 (`lds-k<nomor>-<nama-proyek>`). Ini keputusan kelompok dan dicatat di README.
Dicek Abrar: topik harga pangan dan pemakaian repo lama memang keputusan kelompok; isi entri ini benar.

## 26 Nov 2026, Abrar — sumber data (`01-riset/sumber-data.md`)
Perintah: "Kami butuh data untuk pertanyaan berikut: [4 pertanyaan]. Usulkan sumber data. Untuk tiap sumber tulis: tautan, penerbit, cara mengambil, lisensi atau syarat pakai, frekuensi pembaruan, dan apakah memuat data pribadi. Tandai sumber yang Anda tidak yakin masih ada."
Hasil   : 6 sumber. AI membuka tiap sumber lewat browser: PIHPS BI, Panel Harga Bapanas, SKB libur 2026 (setneg.go.id), BMKG data terbuka, BPS Kota Semarang, dan data warung mitra.
Dicek   : 0 dari 6 tidak ada. **2 dari 6 (33%) informasinya salah dan dikoreksi**: (1) parameter "harga konsumen" Panel Harga yang ditebak AI ternyata mengembalikan data *Produsen*; (2) laporan mingguan PIHPS punya label minggu tidak berurutan → beralih ke data harian. Lisensi PIHPS **bukan lisensi terbuka** (hanya "Hak Cipta © … Semua Hak Dilindungi") → repo hanya memuat sampel 100 baris; izin/konfirmasi ke BI masih perlu diminta. Ketentuan pakai BPS **belum dibaca**.
Dicek Abrar: 6 tautan dibuka 27 November 2026; semua bisa dibuka; kolom lisensi & frekuensi sesuai halaman.

## 26 Nov 2026, Abrar — volume dan sampel PIHPS (`data/sampel/pihps_semarang_sampel.csv`)
Perintah: "Ambil data harian PIHPS Kota Semarang, pasar tradisional, 2021–2026. Hitung jumlah baris terisi dan jumlah minggu. Ambil 5 komoditas × 20 hari kerja terakhir sebagai sampel."
Hasil   : 30.930 harga terisi (21 komoditas × 1.473 hari kerja, 4 Jan 2021 – 26 Nov 2026), 307 minggu. Sampel 100 baris. Statistik mingguan: cabai rawit merah berubah ≥ 10% dari minggu sebelumnya pada 151 minggu, cabai merah keriting 125, bawang merah 54, bawang putih 6, beras medium I 0.
Dicek   : Isi CSV yang ditulis di repo dicocokkan dengan data di browser: 100 baris dan **jumlah harga 4.110.750 sama persis**. Satu hari kosong untuk minyak goreng. Data diambil lewat permintaan JSON yang dipakai halaman PIHPS sendiri, per tahun (tidak massal).
Dicek manusia: ✏️ SAMUEL ISI DI SINI

## 26 Nov 2026, Abrar — keputusan dan 4 pertanyaan (`01-riset/keputusan-dan-pertanyaan.md`)
Perintah: "Ini keputusan dan empat pertanyaan analitik kami: [tempel]. Untuk tiap pertanyaan, jelaskan apakah jawabannya membantu keputusan itu. Tandai pertanyaan yang jawabannya tidak akan mengubah keputusan. Jangan menambah pertanyaan baru."
Hasil   : Beras ditandai **tidak mengubah keputusan** (0 minggu berubah ≥ 10%) → dikeluarkan dari keputusan, tetap sebagai pembanding. "Musim hujan" tidak bisa diuji dengan data cuaca (BMKG tanpa riwayat) → diuji sebagai bulan Nov–Mar. Pertanyaan preskriptif ditambah 3 batasan.
Dicek   : Semua angka di berkas berasal dari hitungan PIHPS di atas.
Dicek manusia: Dezra, kalimat keputusan sudah dibaca, menyebut siapa dan kapan.

## 26 Nov 2026, Abrar — riset kreatif dan KENAPA-KAMI (`01-riset/riset-kreatif.md`, `KENAPA-KAMI.md`)
Perintah: "Keputusan kami: [tempel]. Cari dasbor, templat, atau fitur aplikasi yang sudah membantu keputusan serupa. Untuk tiap temuan beri tautan, siapa pembuatnya, dan pertanyaan apa yang bisa dijawabnya."
Hasil   : 3 temuan dibuka dan diberi tangkapan layar: PIHPS + aplikasi Harga Pangan Nasional, Panel Harga Bapanas, dan majoo (Starter Rp249.000/outlet/bulan belum PPN).
Dicek   : Harga majoo dicek di halaman resminya (tangkapan layar). Kutipan ulasan Play Store hanya diparafrasekan dan dicocokkan dengan tangkapan layar; **nama pengulas dan foto akun disamarkan** sebelum disimpan. Aplikasi lain yang muncul di pencarian tetapi tidak dibuka (mis. Info Pangan Jakarta) **tidak dikutip**. Klaim penghematan rupiah **sengaja tidak ditulis** karena belum diuji.
Dicek manusia: Dezra, KENAPA-KAMI dan riset kreatif sudah dibaca, isinya sesuai.

## 26 Nov 2026, Abrar — kamus data (`kamus-data.md`)
Perintah: "Baca data/sampel/pihps_semarang_sampel.csv. Buat kamus data: kolom, tipe, arti, contoh nilai."
Hasil   : 7 kolom.
Dicek   : Draf awal menulis bahwa PIHPS "tidak mencatat libur nasional" dan bahwa baris kategori adalah "rata-rata sub-komoditas". **Keduanya belum terbukti, jadi dihapus**. Diganti dengan fakta dari FAQ PIHPS (pencacahan Senin–Jumat) dan dari struktur data (`level` 1/2).
Dicek manusia: Samuel — 7 kolom kamus data dicocokkan dengan CSV. Nama kolom, tipe data, arti, dan contoh nilai sesuai.

## 26 Nov 2026, Abrar — skill (`SKILL-TERPASANG.md`)
Perintah: "Baca seluruh isi folder skill ini, termasuk skripnya. Daftar setiap perintah yang mengakses internet, membaca kunci atau token, atau menghapus berkas. Kutip baris aslinya."
Hasil   : 4 kandidat dari 4 repo GitHub (`anthropics/skills`, `duckdb/duckdb-skills`, `oaustegard/claude-skills`, `motherduckdb/agent-skills`). xlsx dipasang dan di-commit; duckdb dipasang di laptop saja; 2 ditolak.
Dicek   : Nomor baris yang dikutip dicek ulang dengan `grep -n`. Uji xlsx dijalankan dua kali (tanpa/dengan skill); `recalc.py` menunjukkan 0 error, dan versi tanpa awalan `_xlfn.` menunjukkan 10 `#NAME?`. **Skill duckdb belum diuji** (DuckDB CLI tidak tersedia).
Dicek manusia: ✏️ SAMUEL ISI DI SINI

## 26 Nov 2026, Abrar — sambungan Google Sheets (`HARNESS.md`)
Perintah: "Buat lembar Google Sheets berisi tabel sumber data, lalu baca kembali dan laporkan jumlah baris dan kolomnya."
Hasil   : Lembar "LDS K02 - Inventaris Sumber Data (TK1)"; AI melaporkan A1:G7, yaitu 7 baris × 7 kolom.
Dicek   : Konektor Google Sheets tidak tersedia; dipakai konektor Google Drive (unggah CSV → dikonversi).
Dicek Abrar: lembar dibuka 27 November 2027, 7 baris × 7 kolom, sama dengan laporan AI (7 × 7).

## 26 Nov 2026, Abrar — Paket Dasar (`AGENTS.md`, `.gitignore`, `00-admin/anggota.md`, README)
Perintah: "Susun AGENTS.md dengan empat bagian: tujuan proyek, aturan AI dan data, struktur folder, kebiasaan mengisi Log AI."
Hasil   : AGENTS.md baru (aturan P8–P10 dipindah ke bagian arsip), `.gitignore` memuat `.env` dan `data/mentah/`, anggota.md tanpa nomor HP, README dengan Papan Status.
Dicek   : Draf aturan 6 menulis "Data PIHPS lengkap disimpan di sana", padahal belum ada yang mengunduhnya. **Diperbaiki** menjadi "bila diunduh".
Dicek manusia: ✏️ DEZRA ISI DI SINI

### Pencegahan jebakan TK1 (slide 29)
Jebakan yang paling mungkin menimpa kelompok ini: **semua commit dari satu akun** (karena harness dipakai dari akun Abrar). Pencegahan: Dezra dan Samuel melakukan uji commit di `00-admin/anggota.md` dari akun masing-masing, dan menjadi *reviewer* Pull Request TK1 sebelum merge.

## 27 Nov 2026, Abrar — pengecekan ulang oleh AI (bukan pengganti "Dicek manusia")
Perintah: "Buka ulang semua tautan sumber dan cocokkan ulang 3 harga sampel dengan situs PIHPS."
Hasil   : PIHPS bisa dibuka; 3 harga cocok dengan `data/sampel/pihps_semarang_sampel.csv` (3 Nov Cabai Merah Keriting 68.750; 17 Nov Bawang Merah Ukuran Sedang 32.250; 26 Nov Cabai Rawit Merah 61.250). Halaman SKB libur 2026 (setneg.go.id) bisa dibuka: 17 libur nasional + 8 cuti bersama. BMKG data terbuka bisa dibuka: prakiraan 3 hari, diperbarui 2× sehari, wajib mencantumkan BMKG. Beranda BPS Kota Semarang bisa dibuka (tabel inflasi belum dicari). Harga majoo Starter masih Rp249.000/outlet/bulan, belum termasuk PPN.
Dicek   : Semua isi `01-riset/sumber-data.md` dan `KENAPA-KAMI.md` masih sesuai per 27 Nov 2026. Baris "Dicek manusia" di atas tetap harus diisi oleh anggota yang benar-benar memeriksa.
