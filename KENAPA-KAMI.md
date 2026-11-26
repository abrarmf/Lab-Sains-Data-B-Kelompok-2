# KENAPA-KAMI.md — v1 (TK1)

Penanggung jawab: Muhammad Dezra Aria · 26 Nov 2026 · diperbarui tiap tugas sampai versi final

**Pertanyaan v1:** Mengapa perlu sistem database kelompok untuk keputusan belanja bumbu warung, padahal sudah ada PIHPS, Panel Harga Pangan, spreadsheet, dan aplikasi kasir?

## Tiga alternatif yang sudah ada

| Alternatif | Biaya (sumber, tanggal cek) | Kelebihan | Kelemahan dan celah |
|---|---|---|---|
| **Tetap manual**: tanya pedagang langganan, mengandalkan ingatan dan perkiraan pemilik | Rp0 | Tidak perlu alat baru; pedagang tahu harga pasarnya sendiri | Tidak ada catatan harga per minggu; perkiraan "minggu depan naik/turun" bergantung ingatan; lonjakan musiman (Ramadan, Nataru) baru terasa saat sudah terjadi |
| **PIHPS / Panel Harga Pangan + catatan Google Sheets sendiri** | Gratis (PIHPS & Panel Harga terbuka untuk umum; Google Sheets gratis), dicek 26 Nov 2026 | Harga harian resmi per kota, riwayat panjang (PIHPS Kota Semarang sejak 2021) | Hanya menjawab **deskriptif**: tidak ada perkiraan harga minggu depan, tidak ada saran beli. Sampel 2 pasar per kota; ulasan bintang 4 di aplikasi PIHPS mengeluhkan data sering tidak sesuai harga riil (tangkapan layar `01-riset/bukti/2026-11-26_ulasan-play-harga-pangan-nasional.jpg`). Menyalin harga ke Sheets tiap minggu adalah kerja manual |
| **Aplikasi kasir dengan inventori (majoo)** | Starter **Rp249.000 per outlet per bulan**, belum termasuk PPN (<https://majoo.id/harga>, tangkapan layar `01-riset/bukti/2026-11-26_majoo-harga-starter.jpg`, dicek 26 Nov 2026) | Tahu pemakaian bahan baku warung dari resep dan penjualan | Tidak membaca harga pasar dan tidak memperkirakan harga, sehingga tidak bisa menjawab "beli sekarang atau tunda". Biayanya Rp2.988.000/tahun sebelum PPN, besar untuk warung satu outlet |

## Alasan sistem kami dibuat (dengan bukti)
1. **Harga bumbu benar-benar bergejolak tiap minggu.** Di pasar tradisional Kota Semarang (PIHPS, 307 minggu, Jan 2021 – Nov 2026), rata-rata harga mingguan **cabai rawit merah berubah ≥ 10% pada 151 minggu**, cabai merah keriting 125 minggu, bawang merah 54 minggu (dihitung 26 Nov 2026, lihat `01-riset/sumber-data.md`). Keputusan "beli sekarang atau tunda" punya taruhan nyata.
2. **Belum ada alat yang menjawab prediktif dan preskriptif** untuk pembeli kecil (`01-riset/riset-kreatif.md`). Alat yang ada berhenti di tampilan harga hari ini.
3. **Database menggabungkan tiga hal yang kini terpisah:** riwayat harga resmi (PIHPS), kalender libur/Ramadan (SKB), dan kebutuhan warung sendiri. Tanpa itu, pola "naik menjelang Lebaran" hanya bisa ditebak dari ingatan.

> Klaim yang **belum** dibuktikan di v1: berapa rupiah yang bisa dihemat warung per bulan. Angka ini baru boleh ditulis setelah diuji pada data terpisah di TK3, misalnya: aturan beli dari model dibanding "selalu beli Sabtu", pada minggu-minggu 2025–2026.

## Kapan alternatif lebih baik
- **Manual sudah cukup** bila warung hanya memakai sedikit cabai/bawang per minggu (mis. di bawah ±1 kg per bumbu). Selisih harga 10% pada jumlah sekecil itu hanya beberapa ribu rupiah, tidak sebanding dengan waktu membuka sistem. Ambang pastinya dihitung di TK3.
- **PIHPS + Sheets lebih baik** untuk bahan yang harganya stabil, seperti **beras dan bawang putih**: beras medium tidak pernah berubah ≥ 10% per minggu dalam 307 minggu, bawang putih hanya 6 minggu. Untuk bahan ini, perkiraan tidak menambah apa-apa.
- **Aplikasi kasir lebih baik** bila masalah utama warung adalah stok habis atau bahan terbuang karena pencatatan, bukan harga. Kebutuhan seperti itu tidak dijawab sistem kami.
- **Tanya pedagang langganan lebih baik** bila harga di pasar langganan jauh berbeda dari 2 pasar sampel PIHPS. Ini dicek di TK2 dengan membandingkan beberapa catatan harga warung terhadap PIHPS.
