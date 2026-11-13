# Kamus data — tabel bersih P10

Dibuat oleh `notebook/P10_merapikan_data_sql.ipynb`. Langkah pembersihan tercatat di `log_pembersihan.csv`.

## `ulasan` → `ulasan_bersih.csv` (1.000 baris, 1 baris = 1 ulasan)
| Kolom | Tipe | Arti | Asal |
|---|---|---|---|
| `id_ulasan` | int | id asli NusaX (0–999), kunci utama | kolom `id` mentah |
| `split` | teks | `train` / `valid` / `test` di NusaX | nama berkas sumber |
| `teks` | teks | ulasan setelah spasi dirapikan dan nama orang → `[NAMA]` | kolom `text` mentah |
| `label_pakar` | teks | `negative` / `neutral` / `positive` dari anotator NusaX | kolom `label` mentah |
| `domain` | teks | topik ulasan menurut **heuristik kata kunci** (bukan label manusia; bisa salah, mis. "power bank" → bank) | fungsi `domain()` |
| `n_kata` | int | jumlah kata di `teks` | dihitung |
| `panjang` | teks | `pendek (≤12)`, `sedang (13–30)`, `panjang (>30)` kata | dari `n_kata` |
| `n_nama_diganti` | int | berapa nama orang yang diganti `[NAMA]` di baris ini | anonimisasi |

## `label_ai` → `label_ai.csv` (300 baris, 1 baris = 1 label dari 1 model untuk 1 ulasan)
| Kolom | Tipe | Arti |
|---|---|---|
| `id_ulasan` | int | kunci tamu ke `ulasan.id_ulasan` |
| `model` | teks | model AI yang melabel (`claude-opus-5.5`) |
| `versi_prompt` | teks | `P9-v1` = prompt di laporan P8–P9 |
| `tanggal_label` | tanggal | kapan dilabel |
| `label_ai` | teks | `negative` / `neutral` / `positive` |

Kunci gabungan: (`id_ulasan`, `model`, `versi_prompt`). Label dari model lain ditambah sebagai **baris baru**.

## `label_manusia` → `label_manusia.csv` (0 baris sampai cek 50 diisi)
| Kolom | Tipe | Arti |
|---|---|---|
| `id_ulasan` | int | kunci tamu ke `ulasan.id_ulasan` |
| `pemeriksa` | teks | nama anggota yang mengecek |
| `label_manusia` | teks | `negative` / `neutral` / `positive` |
