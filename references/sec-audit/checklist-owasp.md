# Comprehensive Security Evaluation & OWASP Top 10 Reference

Panduan standar audit keamanan aplikasi web & API untuk identifikasi celah kode secara mendalam.

---

## 1. Broken Access Control (A01:2021 / CWE-284, CWE-862)
- **IDOR / BOLA**: Pastikan setiap akses ke objek (user ID, tenant ID, order ID, UUID) divalidasi terhadap sesi pemilik yang terotentikasi, bukan sekadar mempercayai parameter URL atau body.
- **Missing Function Level Access Control**: Verifikasi endpoint administratif/privilege tinggi memiliki middleware otorisasi yang ketat.
- **CORS Misconfiguration**: Periksa apakah header `Access-Control-Allow-Origin: *` dikombinasikan dengan `Access-Control-Allow-Credentials: true` atau merefleksikan Origin secara dinamis tanpa whitelist.

---

## 2. Cryptographic Failures & Sensitive Data (A02:2021 / CWE-310)
- **Hardcoded Secrets**: Cari string API keys (`sk-`, `ghp_`, `AKIA...`), private keys RSA/ED25519, database connection strings, JWT secret keys di dalam repositori.
- **Weak Hashing**: Pastikan password menggunakan bcrypt, argon2id, atau PBKDF2 dengan cost factor memadai. Tolak penggunaan MD5, SHA1, atau plain SHA256 untuk hashing kredensial.
- **JWT Misconfiguration**: Periksa validasi algoritma (`alg: "none"` exploit), verifikasi signature wajib, expiration (`exp`), dan audience (`aud`).

---

## 3. Injection (A03:2021 / CWE-89, CWE-78, CWE-77, CWE-94)
- **SQL / NoSQL Injection**: Tolak konkatenasi string langsung pada query builder. Wajib menggunakan parameterized queries atau ORM prepared statements.
- **Command Injection**: Audit seluruh penggunaan `child_process.exec()`, `os.system()`, `subprocess.Popen(shell=True)`. Wajib gunakan pemanggilan array argumen tanpa shell interpretor.
- **Template Injection (SSTI)**: Periksa Jinja2, EJS, Pug jika menerima input mentah user ke dalam context engine.
- **SSRF (Server-Side Request Forgery)**: Audit HTTP client (fetch, axios, curl) yang meminta URL dari input user. Pastikan IP internal (`127.0.0.1`, `10.0.0.0/8`, `192.168.0.0/16`, `169.254.169.254`) diblokir di level DNS/network socket.

---

## 4. Insecure Design & Concurrency Flaws (A04:2021 / CWE-362)
- **Race Condition / TOCTOU**: Audit mutasi saldo, voucher kupon, dan limit transaksi. Pastikan mutasi menggunakan atomic database update (`UPDATE table SET balance = balance - X WHERE balance >= X`) atau distributed mutex lock.
- **Missing Rate Limit**: Verifikasi proteksi brute-force pada endpoint login, OTP verification, password reset, dan dispatch pesan.
