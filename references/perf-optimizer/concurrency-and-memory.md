# Rekayasa Kinerja Tinggi: Latensi, Zero-Copy & Concurrency

Pedoman teknis profiling sistem, eliminasi latency overhead, dan penghematan alokasi memori.

---

## 1. Analisis Latensi & Event Loop
- **Non-blocking Operations**: Hindari sinkronisasi I/O (`fs.readFileSync()`, pemanggilan shell sinkron, atau regex dengan catastrophic backtracking).
- **Batching & Chunking**: Gabungkan write database diskrit ke dalam batch transactions untuk mengurangi round-trip network overhead.

---

## 2. Alokasi Memori Zero-Copy & Stream
- **Buffer vs. Stream**: Untuk payload file/media berukuran besar (> 1MB), gunakan stream pipelines daripada memuat seluruh buffer ke memori RAM sekaligus.
- **Deteksi Memory Leak**: Waspadai closure yang menahan referensi objek besar, event listener yang tidak pernah dilepas (`removeListener`), dan struktur Map/Set global tanpa batas ukuran (unbounded caches). Gunakan WeakMap/WeakSet atau LRU cache dengan batas entri ketat.

---

## 3. Optimasi Concurrency & Eliminasi Lock Contention
- **Atomic Operations**: Gunakan operasi atomik CPU / basis data daripada lock skala besar saat memperbarui hitungan (counters) atau saldo.
- **Worker Pools**: Bagi tugas CPU-bound (komputasi kriptografi, parsing AST besar, rendering grafis) ke worker thread terpisah agar proses I/O utama tetap responsif.
