# Riset Kreatif: Apa yang Sudah Ada untuk Keputusan Serupa

Penanggung jawab: Muhammad Dezra Aria · dicari dengan bantuan AI, **setiap temuan dibuka sendiri** 26 Nov 2026

Perintah ke AI:
> "Keputusan kami: setiap Sabtu pemilik warung makan di Kota Semarang memutuskan berapa kg cabai dan bawang yang dibeli untuk minggu depan, sekaligus atau sebagian ditunda ke Rabu. Cari dasbor, templat, atau fitur aplikasi yang sudah membantu keputusan serupa. Untuk tiap temuan beri tautan, siapa pembuatnya, dan pertanyaan apa yang bisa dijawabnya."

| Temuan | Pembuat | Yang sudah dijawab | Celah (dikaitkan ke 4 pertanyaan kami) | Bukti |
|---|---|---|---|---|
| **PIHPS Nasional** (web) <https://www.bi.go.id/hargapangan> dan aplikasi **Harga Pangan Nasional** (Google Play, rating 3,6 dari 317 ulasan ponsel, terakhir diperbarui 22 Sep 2023) | Bank Indonesia | **Deskriptif**: harga harian per kota, perbandingan antar kota, grafik fluktuasi | Tidak ada perkiraan harga minggu depan (**prediktif**) dan tidak ada saran jumlah beli (**preskriptif**). Ulasan bintang 4 (11 Jul 2022) menulis bahwa data yang ditampilkan sering tidak sesuai harga riil di lapangan. Jawaban BI: sampelnya 2 pasar tradisional per kota | `bukti/2026-11-26_pihps-tabel-harga.jpg`, `bukti/2026-11-26_ulasan-play-harga-pangan-nasional.jpg` (nama pengulas disamarkan) |
| **Panel Harga Pangan** <https://panelharga.badanpangan.go.id/> | Badan Pangan Nasional | **Deskriptif**: harga harian per provinsi/kab-kota dan status terhadap harga acuan (aman/waspada/intervensi) | Status dibuat untuk **intervensi pemerintah**, bukan untuk keputusan beli warung; tidak ada prakiraan; syarat pakai data tidak tercantum | `bukti/2026-11-26_panel-harga-bapanas.jpg` |
| **majoo** — fitur inventori bahan baku & resep <https://majoo.id/aplikasi-inventori> | PT Majoo Teknologi Indonesia | Stok bahan baku berkurang otomatis per penjualan, harga beli terakhir: **deskriptif** untuk kebutuhan warung sendiri | Tidak membaca harga pasar dan tidak memperkirakan harga minggu depan (**diagnostik/prediktif** kosong). Berbayar: paket Starter **Rp249.000/outlet/bulan**, belum termasuk PPN (halaman harga, dicek 26 Nov 2026) | `bukti/2026-11-26_majoo-harga-starter.jpg` |

## Kesimpulan untuk `KENAPA-KAMI.md`
- **Deskriptif** sudah dijawab dengan baik oleh PIHPS dan Panel Harga, gratis. Sistem kami **tidak perlu** membuat ulang tampilan harga harian.
- **Prediktif** dan **preskriptif** (harga minggu depan → beli sekarang atau tunda) **belum dijawab** oleh temuan mana pun.
- **Diagnostik** (lonjakan di sekitar Ramadan/Nataru/libur) hanya bisa dibaca manual dari grafik PIHPS; belum ada yang menghubungkannya dengan kalender libur.
- Kebutuhan warung (kg per minggu) hanya ada di aplikasi kasir berbayar seperti majoo, dan aplikasi itu tidak tahu harga pasar.
