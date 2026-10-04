# Optimasi Basis Data: Rencana Eksekusi & Indeks Komposit

Pedoman analisis performa query SQL, indexing strategis, dan eliminasi bottleneck I/O disk.

---

## 1. Interpretasi EXPLAIN ANALYZE
- **Sequential Scan (Seq Scan)** vs **Index Scan**: Jika tabel besar (> 50.000 baris) melakukan Seq Scan pada kondisi filter `WHERE`, ini indikasi kuat kurangnya indeks yang sesuai.
- **Index Only Scan**: Kondisi ideal di mana seluruh kolom yang dibutuhkan dalam `SELECT` dan `WHERE` sudah tercakup dalam indeks tanpa perlu menyentuh tabel heap (Covering Index).
- **Nested Loop vs Hash Join**: Nested Loop efisien untuk dataset kecil dengan indeks, namun Hash Join lebih unggul untuk penggabungan volume besar.

---

## 2. Aturan Emas Indeks Komposit (Left-to-Right Rule)
- Urutan kolom pada indeks komposit `INDEX (col_a, col_b, col_c)` sangat krusial:
  1. Letakkan kolom dengan filter kesetaraan (`col_a = ?`) paling kiri.
  2. Letakkan kolom dengan filter rentang (`col_b > ?` atau `BETWEEN`) setelah kolom kesetaraan.
  3. Letakkan kolom pengurutan (`ORDER BY col_c`) paling akhir jika diperlukan untuk menghindari operasi *Sort* terpisah di memori.

---

## 3. Eliminasi Bottleneck N+1 Query
- Identifikasi pemanggilan query dalam loop iterasi aplikasi.
- Ubah menjadi eager loading (`JOIN`, subquery batching `WHERE id IN (...)`, atau teknik dataloader).
