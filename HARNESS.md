# HARNESS

Penanggung jawab: Abrar Mohammad Fathur · dicek 26 Nov 2026

```
Harness       : Claude Code (Anthropic). Dipakai Abrar lewat sesi Claude Code di aplikasi Claude
                (claude.ai) yang tersambung ke repo GitHub ini.
Biaya         : Claude Code butuh langganan berbayar (Pro ke atas). Pro US$20 per bulan bila
                dibayar bulanan, atau US$17/bulan dengan langganan tahunan (US$200 dibayar di muka).
                Sumber: https://claude.com/pricing, dicek 26 Nov 2026. Paket Free tidak termasuk Claude Code.
Agent Skills  : didukung (SKILL.md), folder .claude/skills/ (lihat SKILL-TERPASANG.md)
File instruksi: CLAUDE.md, yang hanya berisi baris "@AGENTS.md" sehingga isi AGENTS.md ikut dibaca
Bukti GitHub  : commit pertama TK1 dari harness, pesan commit memuat baris Co-authored-by → lihat bagian "Bukti commit"
Aplikasi lain : Google Sheets lewat konektor Google Drive, lihat bagian "Sambungan"
```

## Lima langkah Paket Dasar 3 (slide 7)
| Langkah | Hasil |
|---|---|
| 1. Pilih | Claude Code mendukung Agent Skills (`.claude/skills/`), bisa membaca repo, menjalankan perintah, dan membuat commit. Biaya: berlangganan (lihat di atas). |
| 2. Pasang | Di akun Abrar: sudah. **Dezra dan Samuel**: belum. Bila memakai harness lain yang gratis (mis. OpenCode), catat di tabel di bawah. |
| 3. Buka repo | AI diminta membaca `README.md` lalu meringkasnya dalam dua kalimat. Hasil: *"Repo ini berisi tugas Lab Sains Data kelas B Kelompok 2 untuk pertemuan 8–10: analisis sentimen ulasan (NusaX) untuk produk toko thrift, dengan keputusan apakah label sentimen diisi AI, AI + cek manusia, atau manual. Isinya laporan, notebook Colab yang bisa di-Run all, tabel bersih, query DuckDB, dan file instruksi AI; data mentah tidak diunggah karena memuat nama orang."* Dicek Abrar: sesuai isi README sebelum TK1. |
| 4. Commit pertama | Commit kecil dari harness dengan baris `Co-authored-by`, lalu push. Tautan di bawah. |

| Anggota | Harness di laptop sendiri | Masuk dengan akun sendiri | Bukti |
|---|---|---|---|
| Abrar | Claude Code (sesi claude.ai) | ya | commit di bawah |
| Dezra | ✏️ DEZRA ISI | ✏️ | ✏️ |
| Samuel | ✏️ SAMUEL ISI | ✏️ | ✏️ |

## Bukti commit
- Commit TK1 dari harness dengan baris `Co-authored-by: Claude <noreply@anthropic.com>`: <https://github.com/abrarmf/Lab-Sains-Data-B-Kelompok-2/commit/d0b09ff8e4f2e196bf051e9661e308450111fb60> (`d0b09ff`, 26 Nov 2026)

## Sambungan ke aplikasi lain (Paket Dasar 5, slide 9)
```
Aplikasi : Google Sheets "LDS K02 - Inventaris Sumber Data (TK1)"
           https://docs.google.com/spreadsheets/d/1-o1-_FffyWwE9NzZIy1IkBc_hCrLDZpyGtDSXKdrvyE
           (milik akun Google kelompok; bagikan ke Dezra & Samuel lewat tombol Share)
Cara     : konektor Google Drive bawaan aplikasi Claude (dinyalakan di pengaturan konektor).
           Konektor Google Sheets (untuk mengedit sel) belum tersedia di sesi ini, jadi lembar dibuat
           dengan mengunggah CSV yang otomatis dikonversi ke Google Sheets.
Uji      : AI membaca lembar itu dan melaporkan rentang A1:G7 → 7 baris (1 judul + 6 sumber), 7 kolom
           (sumber, peran, cara_ambil, lisensi_izin, frekuensi, perkiraan_baris, data_pribadi).
Dicek    : ✏️ ABRAR ISI (nama, jumlah baris & kolom yang kamu hitung, sama/tidak)
Bukti    : 00-admin/bukti/sambungan-sheets.png  ← tangkapan layar diambil anggota setelah membuka lembar
```
Alur cadangan bila konektor tidak tersedia: unduh lembar sebagai CSV → simpan di `data/sampel/` → AI membaca dari sana.
