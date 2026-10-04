# Rekonstruksi Kode Sumber: AST Normalization & Deobfuscation

Metodologi sistematis untuk menganalisis, membongkar obfuskasi, dan merekonstruksi arsitektur kode minified.

---

## 1. Normalisasi Pohon Sintaksis Abstrak (AST)
- **Constant Folding**: Sederhanakan operasi biner statis (misal `123 ^ 456` atau `["a", "b"].join("")`) menjadi nilai evaluasi langsung.
- **Control Flow De-flattening**:
  Bongkar pola `while(true) { switch(state) { ... } }` menjadi alur sekuensial atau kondisional asli (`if-else`, loop konvensional).
- **String Array Decoding**:
  Temukan array string terenkripsi/terindeks di awal modul, ekstraksi fungsi rotasi indeks, dan gantikan setiap pemanggilan fungsi getter dengan nilai string teks terbaca.

---

## 2. Pemetaan Simbol & Rekonstruksi Antarmuka
- Berikan penamaan deskriptif pada variabel minified (`a`, `b`, `c`) berdasarkan peran fungsionalnya (misal `authToken`, `requestPayload`, `dbClient`).
- Rekonstruksi struktur interface/tipe data TypeScript yang hilang untuk memperjelas batas komunikasi antar modul.
