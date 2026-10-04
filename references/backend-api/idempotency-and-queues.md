# Pola Rekayasa Backend: Idempotensi, Antrean & Skalabilitas

Standar implementasi API tangguh, pemrosesan terdistribusi, dan konsistensi data transaksi.

---

## 1. Idempotency Key Pattern
- Setiap request mutasi finansial/stateful wajib menyertakan header `Idempotency-Key: <UUIDv4>`.
- **Alur Eksekusi**:
  1. Periksa keberadaan kunci di cache Redis / database.
  2. Jika sedang diproses (`IN_PROGRESS`), tolak request duplikat dengan `409 Conflict` atau tunggu respons sebelumnya.
  3. Jika sudah selesai (`COMPLETED`), kembalikan respons tersimpan tanpa memicu mutasi ulang.
  4. Pasang waktu kedaluwarsa (TTL) pada kunci (misal 24 jam).

---

## 2. Queue Pipelines & Dead-Letter Queue (DLQ)
- **Retry dengan Exponential Backoff**:
  Formula jeda: $t = \min(\text{max\_delay}, \text{base\_delay} \times 2^{\text{attempt}}) \pm \text{jitter}$.
  Jitter mencegah *thundering herd problem* saat downstream pulih.
- **Dead-Letter Handling**:
  Batas maksimal percobaan retry (misal 3-5 kali). Jika gagal, pindahkan payload ke DLQ untuk analisis investigasi tanpa menghentikan worker utama.

---

## 3. Rate Limiting Multi-Layer
- **Lapis Jaringan/Gateway**: Token Bucket per IP untuk mencegah scraping dan volumetric flooding.
- **Lapis Aplikasi/User**: Leaky Bucket per UID / API Key untuk melindungi resource intensif (LLM inference, PDF generation, email dispatch).
