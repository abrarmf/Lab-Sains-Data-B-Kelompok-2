# Keputusan dan Empat Pertanyaan Analitik

Penanggung jawab: Muhammad Dezra Aria · draf disusun bersama harness AI (lihat `LOG-AI.md`) · versi TK1, 26 Nov 2026

## Pengguna
**Pemilik warung makan penyetan/lalapan di Kota Semarang** (peran nyata yang banyak ditemui di sekitar kampus: warung kecil, satu outlet, belanja sendiri ke pasar tradisional). Bahan yang harganya paling bergejolak dan paling banyak dipakai: **cabai rawit merah, cabai merah keriting, bawang merah, bawang putih** (beras medium dipakai sebagai pembanding yang stabil).

## Keputusan (satu kalimat)
> **Setiap Sabtu sore, pemilik warung memutuskan berapa kg cabai rawit merah, cabai merah keriting, bawang merah, dan bawang putih yang dibeli untuk minggu berikutnya: dibeli sekaligus pada belanja Sabtu, atau sebagian ditunda ke belanja tengah minggu (Rabu).**

Mengapa keputusan ini layak dibantu data:
- **Berulang setiap minggu** → sistem dipakai terus dan tiap minggu menghasilkan data uji untuk model di TK3.
- **Harganya benar-benar bergejolak.** Dari data PIHPS Kota Semarang Jan 2021 s.d. 26 Nov 2026 (307 minggu), rata-rata harga mingguan cabai rawit merah berubah **≥ 10% dari minggu sebelumnya pada 151 minggu**, cabai merah keriting 125 minggu, dan bawang merah 54 minggu. Beras medium tidak pernah (0 minggu). Angka ini dihitung dari data yang diambil 26 Nov 2026 (lihat `sumber-data.md`).
- **Ada batasan nyata.** Cabai segar tidak tahan lama, jadi tidak bisa ditimbun berminggu-minggu, dan modal belanja mingguan warung terbatas.

## Empat pertanyaan
Satuan yang sama untuk keempatnya: **harga Rp per kg, per komoditas, per minggu** (pasar tradisional Kota Semarang), ditambah **kg dibeli per komoditas per minggu** untuk pertanyaan preskriptif.

| Jenis | Pertanyaan |
|---|---|
| **Deskriptif** | Berapa rata-rata, minimum, dan maksimum harga mingguan cabai rawit merah, cabai merah keriting, bawang merah, dan bawang putih di pasar tradisional Kota Semarang sejak 2021, dan berapa kali harganya berubah ≥ 10% dari minggu ke minggu? |
| **Diagnostik** | Mengapa harga melonjak pada minggu-minggu tertentu? Apakah lonjakan terkumpul di sekitar Ramadan–Idulfitri, Natal–Tahun Baru, libur panjang/cuti bersama, atau bulan-bulan musim hujan (Nov–Mar)? |
| **Prediktif** | Berapa harga mingguan tiap bumbu di Kota Semarang pada minggu depan, dan seberapa besar peluang harganya naik lebih dari 10%? |
| **Preskriptif** | Berapa kg tiap bumbu yang sebaiknya dibeli Sabtu ini dan berapa yang ditunda ke Rabu, bila **kebutuhan mingguan warung** diketahui, **modal belanja mingguan** dibatasi, dan **cabai segar hanya tahan beberapa hari** (angka batas diisi pemilik warung), supaya total biaya bumbu seminggu sekecil mungkin tanpa kehabisan stok? |

Rantai jawabannya: deskriptif menunjukkan komoditas mana yang bergejolak → diagnostik mencari pola waktunya → prediktif memperkirakan harga minggu depan → preskriptif mengubah perkiraan itu menjadi jumlah kg yang dibeli hari ini dibanding ditunda.

## Uji: apakah tiap pertanyaan membantu keputusan? (langkah 4, slide 23)
Perintah yang dipakai (ke harness AI):
> "Ini keputusan dan empat pertanyaan analitik kami: [tempel]. Untuk tiap pertanyaan, jelaskan apakah jawabannya membantu keputusan itu. Tandai pertanyaan yang jawabannya tidak akan mengubah keputusan. Jangan menambah pertanyaan baru."

| Pertanyaan | Catatan AI | Tindakan kelompok |
|---|---|---|
| Deskriptif | Membantu: menentukan komoditas mana yang layak diputuskan mingguan. Draf awal memuat **beras**, yang harganya hampir tidak berubah (0 minggu ≥ 10%), sehingga **tidak akan mengubah keputusan**. | Beras dikeluarkan dari keputusan, dipakai hanya sebagai pembanding. |
| Diagnostik | Membantu: bila lonjakan terkumpul di periode yang bisa diduga (Ramadan, Nataru), pemilik bisa membeli lebih awal. Catatan: "musim hujan" **tidak bisa diuji dengan data cuaca**, karena sumber BMKG yang dicek hanya memberi prakiraan 3 hari tanpa riwayat. | Musim hujan diuji hanya sebagai pendekatan kalender (bulan Nov–Mar), dan keterbatasan ini ditulis. |
| Prediktif | Membantu langsung: keputusan menunda ke Rabu hanya masuk akal bila harga diperkirakan turun. | Tetap. |
| Preskriptif | Membantu, tetapi tanpa batasan sarannya akan selalu "beli saat murah sebanyak-banyaknya". | Ditambah tiga batasan: kebutuhan mingguan, modal, daya simpan cabai. |

## Yang belum diketahui (diisi di TK2)
- Kebutuhan mingguan per bumbu (kg), modal belanja mingguan, dan daya simpan cabai di warung: perlu wawancara singkat dengan pemilik warung (dengan pemberitahuan data).
- Apakah harga PIHPS (2 pasar sampel) mewakili pasar tempat warung belanja. Ada ulasan pengguna yang mengeluhkan selisih harga (lihat `riset-kreatif.md`).
