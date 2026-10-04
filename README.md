# OpenCode for Termux

Native terminal AI coding assistant & engineering ecosystem, dioptimalkan khusus untuk arsitektur Android / Termux (`aarch64`). Dilengkapi manajer skill & model selector interaktif yang mobile-friendly.

```
  ___                    ____          _      
 / _ \ _ __   ___ _ __  / ___|___   __| | ___ 
| | | | '_ \ / _ \ '_ \| |   / _ \ / _` |/ _ \
| |_| | |_) |  __/ | | | |__| (_) | (_| |  __/
 \___/| .__/ \___|_| |_|\____\___/ \__,_|\___|
      |_|            Termux Edition
```

---

## ✨ Fitur Utama

- **Fast Intelligent Installer**: Mendeteksi dependensi otomatis. Jika OpenCode dan dependensi sudah terpasang, installer langsung masuk ke mode pemilihan skill dalam 0 detik tanpa proses berulang.
- **Mobile-First Compact TUI**: Didesain khusus untuk layar HP sempit (portrait ~45 kolom). Tidak ada teks terpotong, tidak ada baris ganda, dan tahan saat keyboard virtual terbuka.
- **Interactive Model Setup Wizard**: Atur model & provider AI (Claude 3.7, GPT-4o, Gemini 2.5, OpenRouter, atau 9router/proxy kustom) langsung lewat menu dengan tombol `[m]`.
- **Modular Multi-Select Skills**: Pilih skill yang ingin dipasang (semua, satuan, atau kosongkan) menggunakan tombol angka `1`–`9`, `0`, atau `Space`.
- **10 Core Engineering Skills & References**: Dilengkapi dokumen referensi teknis mendalam di `~/.config/opencode/references/` yang otomatis dibaca oleh AI.

---

## ⚡ Instalasi Cepat (One-Line Setup)

Jalankan perintah berikut di terminal Termux Anda:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/rndsa/opencode-termux/main/install.sh)
```

Jika OpenCode sudah terpasang, perintah di atas langsung membuka **Skills & Model Manager**.

---

## 🎛️ Kelola Skill & Model Kapan Saja (`opencode-skills`)

Setelah terpasang, cukup ketik:

```bash
opencode-skills
```

Antarmuka mobile yang ringkas dan rapi akan muncul di layar:

```
┌── OpenCode Mobile Manager ────────────┐
│ [1-9,0] Toggle · [a] Semua · [Enter] OK│
└── Navigasi: [↑/↓] atau [j/k] ─────────┘
 ❯ [●] 1. sec-audit        (Audit Sec)
   [●] 2. logic-trainer    (Trainer)
   [●] 3. complex-logic    (C.A.R.V.E)
   [●] 4. ui-ux            (Design UI)
   [●] 5. backend-api      (REST/API)
   [●] 6. perf-optimizer   (Performa)
   [●] 7. code-refactor    (Clean Code)
   [●] 8. code-reconstruct (Deobfuscate)
   [●] 9. git-workflow     (Auto Git)
   [●] 0. db-optimizer     (SQL/Index)
─────────────────────────────────────────
 [m] Atur Model  [n] Reset  [Enter] OK  [q] Batal
```

### Navigasi Praktis di Layar HP:
- **Toggle Skill**: Tekan angka `1` sampai `9` atau `0` (atau `Space`).
- **Atur Model AI**: Tekan **`m`** untuk membuka wizard konfigurasi provider (Claude, OpenAI, Gemini, 9router/custom).
- **Pilih Semua**: Tekan **`a`**.
- **Kosongkan Semua (Vanilla)**: Tekan **`n`**.
- **Simpan**: Tekan **`Enter`**.

---

## 🤖 Wizard Pemilihan Model AI (`[m]`)

Tekan `m` di menu untuk memilih provider dan memasukkan API key secara otomatis:

```
┌── Konfigurasi Model AI (OpenCode) ─────┐
│ Pilih provider/model yang ingin dipakai │
└────────────────────────────────────────┘

  1. Anthropic Claude  (claude-3-7-sonnet)
  2. OpenAI            (gpt-4o / gpt-5)
  3. Google Gemini     (gemini-2.5-pro / flash)
  4. OpenRouter        (multi-provider)
  5. 9router / Custom  (custom baseURL & model)
  0. Kembali ke Menu Skill
```

Konfigurasi dan API key otomatis disimpan ke `~/.config/opencode/opencode.json` sehingga OpenCode siap dipakai seketika.

---

## 🧠 Ringkasan 10 Skill Internal

| No | Command | Fungsi & Fokus Utama |
|:--:|---|---|
| 1 | `user:sec-audit` | Audit keamanan statis (SAST), attack surface mapping, cek IDOR/injection, dan patch mitigasi. |
| 2 | `user:logic-trainer` | Pelatih logika Socratic interaktif (ronde bedah premis-asumsi, jebakan if-then, deduksi puzzle). |
| 3 | `user:complex-logic` | Penalaran deduktif multi-variabel dengan protokol **C.A.R.V.E.** (*Compress, Anchor, Reverse, Visualize, Execute*). |
| 4 | `user:ui-ux` | Arsitektur UI modern anti-slop, kontras WCAG AAA, dark theme slate/zinc, dan responsive fluid. |
| 5 | `user:backend-api` | Desain kontrak API produksi, header `Idempotency-Key`, task queue retry backoff, dan DLQ. |
| 6 | `user:perf-optimizer` | Profiling hot-path, latensi I/O non-blocking, memori zero-copy, dan eliminasi lock contention. |
| 7 | `user:code-refactor` | Refactoring bedah zero-regression, decoupling modular (SRP/SoC), dan arsitektur type-safe. |
| 8 | `user:code-reconstruct` | Rekonstruksi kode minified/terdistorsi, deobfuscation, dan normalisasi struktur AST. |
| 9 | `user:git-workflow` | Partisi staging diff atomik, Conventional Commits berkualitas, dan auto changelog generator. |
| 10 | `user:db-optimizer` | Analisis query cost (`EXPLAIN ANALYZE`), composite indexing, dan eliminasi N+1 ORM query. |

---

## 🚀 Cara Menjalankan

1. Masuk ke folder project:
   ```bash
   cd ~/my-project
   ```
2. Jalankan OpenCode:
   ```bash
   opencode
   ```
3. Tekan **`Ctrl + K`** dan pilih skill yang diinginkan (misal: `user:logic-trainer` atau `user:sec-audit`).
