-- Lab Sains Data P10 — Kelompok 2 — query DuckDB
-- Tabel: ulasan (data/ulasan_bersih.csv), label_ai (data/label_ai.csv), label_manusia (data/label_manusia.csv)
-- Di DuckDB CLI: CREATE VIEW ulasan AS SELECT * FROM 'data/ulasan_bersih.csv'; (dst. untuk dua tabel lain)

-- Q0 — Cek integritas. Apakah tiap tabel bersih: tanpa id ganda, tanpa label tidak sah, dan setiap label AI punya pasangan ulasan?
SELECT 'ulasan'   AS tabel, COUNT(*) AS baris, COUNT(DISTINCT id_ulasan) AS id_unik,
       SUM(CASE WHEN label_pakar NOT IN ('negative','neutral','positive') THEN 1 ELSE 0 END) AS label_tidak_sah,
       0 AS tanpa_pasangan
FROM ulasan
UNION ALL
SELECT 'label_ai', COUNT(*), COUNT(DISTINCT a.id_ulasan),
       SUM(CASE WHEN a.label_ai NOT IN ('negative','neutral','positive') THEN 1 ELSE 0 END),
       SUM(CASE WHEN u.id_ulasan IS NULL THEN 1 ELSE 0 END)
FROM label_ai a LEFT JOIN ulasan u ON a.id_ulasan = u.id_ulasan;

-- Q1 — Angka pembeda. Seberapa sering AI benar, dan berapa persen keluhan (negatif) yang tertangkap?
SELECT COUNT(*)                                                         AS n,
       SUM(CASE WHEN a.label_ai = u.label_pakar THEN 1 ELSE 0 END)     AS benar,
       ROUND(100.0 * SUM(CASE WHEN a.label_ai = u.label_pakar THEN 1 ELSE 0 END) / COUNT(*), 1) AS akurasi_pct,
       ROUND(100.0 * SUM(CASE WHEN u.label_pakar = 'negative' AND a.label_ai = 'negative' THEN 1 ELSE 0 END)
                   / SUM(CASE WHEN u.label_pakar = 'negative' THEN 1 ELSE 0 END), 1)      AS recall_negatif_pct
FROM label_ai a JOIN ulasan u ON a.id_ulasan = u.id_ulasan;

-- Q2 — Per domain. Apakah AI sama bagusnya di semua topik? Berapa banyak ulasan pakaian di data proksi?
SELECT u.domain,
       COUNT(*)                                                                  AS n_dilabel_ai,
       ROUND(100.0 * SUM(CASE WHEN a.label_ai = u.label_pakar THEN 1 ELSE 0 END) / COUNT(*), 1) AS akurasi_pct,
       SUM(CASE WHEN u.label_pakar = 'negative' THEN 1 ELSE 0 END)              AS n_negatif
FROM label_ai a JOIN ulasan u ON a.id_ulasan = u.id_ulasan
GROUP BY u.domain
ORDER BY n_dilabel_ai DESC, u.domain;

-- Q3 — Pola salah label. Pasangan (label pakar → label AI) mana yang paling sering salah? Ini menentukan apa yang perlu dicek manusia di pilihan B.
SELECT u.label_pakar, a.label_ai, COUNT(*) AS jumlah,
       MIN(u.id_ulasan) AS contoh_id
FROM label_ai a JOIN ulasan u ON a.id_ulasan = u.id_ulasan
WHERE a.label_ai <> u.label_pakar
GROUP BY u.label_pakar, a.label_ai
ORDER BY jumlah DESC, u.label_pakar, a.label_ai;

-- Q4 — Per panjang teks. Ulasan toko thrift biasanya pendek. Apakah AI lebih sering salah di teks pendek?
SELECT u.panjang,
       COUNT(*) AS n,
       ROUND(100.0 * SUM(CASE WHEN a.label_ai = u.label_pakar THEN 1 ELSE 0 END) / COUNT(*), 1) AS akurasi_pct
FROM label_ai a JOIN ulasan u ON a.id_ulasan = u.id_ulasan
GROUP BY u.panjang
ORDER BY MIN(u.n_kata);

-- Q5 — Cek 50 manusia (aktif setelah `cek50_terisi.csv` ada). Seberapa sering AI benar menurut anggota kelompok?
SELECT COUNT(*) AS n_dicek,
       SUM(CASE WHEN m.label_manusia = a.label_ai THEN 1 ELSE 0 END) AS ai_benar,
       ROUND(100.0 * SUM(CASE WHEN m.label_manusia = a.label_ai THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 1) AS akurasi_manusia_pct,
       ROUND(100.0 * SUM(CASE WHEN m.label_manusia = u.label_pakar THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 1) AS sepakat_pakar_pct
FROM label_manusia m
JOIN label_ai a ON m.id_ulasan = a.id_ulasan
JOIN ulasan  u ON m.id_ulasan = u.id_ulasan;
