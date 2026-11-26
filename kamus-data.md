# kamus-data.md

Penanggung jawab: Samuel Pinondang Simanjuntak · versi TK1, 26 Nov 2026

## `data/sampel/pihps_semarang_sampel.csv` (100 baris)
Sumber: PIHPS Nasional – Bank Indonesia, Tabel Harga Berdasarkan Daerah (Jawa Tengah › Kota Semarang › Pasar Tradisional › Laporan Harian), diambil 26 Nov 2026.
Isi: 5 komoditas × 20 hari kerja terakhir (30 Okt – 26 Nov 2026). Satu baris = harga rata-rata satu komoditas pada satu hari di pasar tradisional Kota Semarang.

| kolom | tipe | arti | contoh |
|---|---|---|---|
| `tanggal` | tanggal (YYYY-MM-DD) | hari pencatatan harga; PIHPS mencacah Senin–Jumat (FAQ PIHPS), jadi Sabtu/Minggu tidak ada | 2026-11-26 |
| `provinsi` | teks | provinsi lokasi pasar | Jawa Tengah |
| `kab_kota` | teks | kota lokasi pasar (PIHPS memakai 2 pasar sampel per kota) | Kota Semarang |
| `jenis_pasar` | teks | jenis pasar yang disurvei | Pasar Tradisional |
| `komoditas` | teks | nama komoditas persis seperti di PIHPS (spasi di akhir "Cabai Merah Keriting " sudah dibuang) | Cabai Rawit Merah |
| `satuan` | teks | satuan harga | kg |
| `harga_rp` | bilangan bulat (rupiah) | **harga eceran per kg** dalam rupiah; di PIHPS ditulis dengan koma ribuan ("61,250") dan sudah diubah menjadi angka biasa | 61250 |

Nilai `komoditas` di sampel: `Beras Kualitas Medium I` (pembanding), `Bawang Merah Ukuran Sedang`, `Bawang Putih Ukuran Sedang`, `Cabai Merah Keriting`, `Cabai Rawit Merah`.

**Kolom dibuang:** tidak ada kolom data pribadi di sumber ini. Kolom `no` dan `level` dari tabel PIHPS (penomoran dan tingkat kategori) tidak disimpan. Baris kategori induk (mis. "Cabai Merah", `level` = 1) juga dibuang; yang disimpan hanya sub-komoditas (`level` = 2) supaya satu baris = satu komoditas.

**Pengecekan kamus terhadap CSV** (dikerjakan 26 Nov 2026):
- 100 baris; 20 tanggal unik × 5 komoditas.
- Jumlah seluruh `harga_rp` = 4.110.750, sama dengan hasil hitungan langsung dari data PIHPS di browser.
- Tidak ada nilai kosong.

## `00-admin/bukti/uji-skill-xlsx/*.xlsx`
Berkas hasil uji skill `xlsx` (lihat `SKILL-TERPASANG.md`), bukan data proyek. Sheet `sampel` berisi salinan CSV di atas; sheet `ringkasan` berisi rata-rata, minimum, dan maksimum per komoditas.

## Data lama (P8–P10)
Kamus tabel NusaX-senti dari pertemuan 8–10 ada di `data/kamus_data.md`.
