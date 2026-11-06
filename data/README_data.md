# README_data — Kelompok 2, Lab Sains Data (B)

Proyek: ringkasan sentimen ulasan pelanggan untuk aplikasi **toko pakaian preloved/thrift** (produk Lab Pemrograman).
Anggota: Abrar Mohammad Fathur (12010223140022), Muhammad Dezra Aria (12010223140038), Samuel Pinondang Simanjuntak (12010223140072).

| Kolom | Isi |
|---|---|
| **SUMBER** | NusaX-senti, subset bahasa Indonesia — IndoNLP. https://github.com/IndoNLP/nusax/tree/main/datasets/sentiment/indonesian (berkas `train.csv`, `valid.csv`, `test.csv`). Makalah: Winata dkk., EACL 2023, https://arxiv.org/abs/2205.15960 |
| **TANGGAL AMBIL** | 6 November 2026 (commit repo `75b0be5d`, commit terakhir 8 Mei 2023) |
| **CARA AMBIL** | `git clone --depth 1` repo publik; di notebook: unduh langsung dari `raw.githubusercontent.com` dengan `urllib` + `pandas.read_csv` (pandas 2.x). Tanpa kunci API, tanpa biaya. |
| **PARAMETER** | Bahasa: Indonesia (`indonesian`). Semua split (train + valid + test). Label: positive / neutral / negative. Sampel P9: 300 baris acak `random_state=42`; cek manusia: 50 baris acak dari 300 itu `random_state=9`. |
| **JUMLAH BARIS** | Mentah: 500 + 100 + 400 = **1.000** baris (cocok dengan dokumentasi) → bersih: **1.000** baris (tidak ada yang dibuang; 0 nilai kosong, 0 teks duplikat). Sampel P9: 300 → cek manusia: 50. Distribusi label mentah: negative 383, positive 378, neutral 239. |
| **LISENSI/ATURAN** | Data: **CC BY-SA 4.0** (README repo: "dataset is licensed with CC-BY-SA"); kode repo: Apache-2.0. Wajib mencantumkan atribusi; turunan dibagikan dengan lisensi yang sama. |
| **ANONIMISASI** | Lampu awal: **kuning** (ulasan publik yang masih memuat nama orang). 21 nama orang di 18 baris diganti `[NAMA]` (nama pelayan/petugas CS/tokoh, mis. pola "mbak …", "Bapak …", "Terima kasih <nama>"). Tidak ditemukan @akun, URL, nomor HP, atau email. Nama usaha dan merek dibiarkan. Setelah anonimisasi → **hijau**. Kolom yang dihapus: tidak ada; kolom ditambah: `split`, `n_nama_diganti`. File mentah `raw_2026-11-06.csv` tidak diubah. |
| **AI YANG DIPAKAI** | Claude Opus 5.5 (Anthropic), 6 Nov 2026: mengusulkan 5 sumber, menyusun skrip anonimisasi & notebook, serta melabel 300 teks. Prompt label: "Beri satu label sentimen untuk tiap teks: positive, neutral, atau negative. Sentimen = sikap penulis. Promosi/iklan/fakta tanpa sikap = neutral. Ulasan campuran = sikap yang dominan." AI hanya menerima kolom `no` + `text`. Rincian di Log AI. |
| **VALIDASI** (P9) | Label AI vs label pakar NusaX (300 teks): **284/300 benar = 94,7%** (IK 95% bootstrap 92,0–97,0%), Cohen's kappa 0,918. Recall: negative 99,1%, neutral 88,9%, positive 93,7%. Kesalahan terbanyak: netral dilabel negatif (6). Pada 50 baris lembar cek, AI cocok dengan pakar 46/50 = 92%. **Cek 50 label oleh anggota kelompok: diisi di `cek50_label_manusia.xlsx`** (belum diisi saat README ini ditulis). |
| **KETERBATASAN** | (1) Data proksi: isinya ulasan restoran, wisata, telekomunikasi, bank, dan berita — hampir tidak ada ulasan pakaian/thrift, jadi akurasi di ulasan toko sendiri bisa berbeda. (2) NusaX-senti adalah hasil terjemahan/parafrase pakar dari SmSA, bahasanya lebih rapi daripada ulasan asli marketplace (singkatan, slang, emoji). (3) NusaX dataset publik sejak 2022, jadi model AI mungkin pernah melihatnya saat pelatihan, akurasi bisa terlalu optimis. (4) Label pakar pun bisa diperdebatkan (mis. "ganti kartu tapi tetap tidak ada sinyal" berlabel netral). (5) Daftar nama untuk anonimisasi disusun dari pola + pemeriksaan manual, jadi nama yang ditulis tanpa sapaan atau huruf kapital bisa terlewat. |

**Berkas**
- `raw_2026-11-06.csv` — gabungan 3 split, teks asli (jangan diunggah ke publik/AI tanpa anonimisasi).
- `bersih_2026-11-06.csv` — teks setelah anonimisasi.
- `label_ai_300.csv` — 300 sampel: teks bersih, label pakar, label AI, benar/salah.
- `cek50_label_manusia.xlsx` — lembar cek 50 label oleh anggota kelompok.
- `LabSainsData_P8_P9_Kelompok2.ipynb` — notebook Colab (Run all) yang membuat ulang semua berkas di atas.

Atribusi: Winata, G. I., Aji, A. F., Cahyawijaya, S., dkk. (2023). NusaX: Multilingual Parallel Sentiment Dataset for 10 Indonesian Local Languages. EACL 2023. Data CC BY-SA 4.0.
