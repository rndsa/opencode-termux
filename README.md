# OpenCode for Termux

Native terminal AI coding assistant & engineering ecosystem, dioptimalkan khusus untuk Android / Termux (`aarch64`). Dilengkapi manajer skill & model setup dengan estetika murni OpenCode TUI.

---

## ✨ Fitur Utama

- **Aestetik Murni OpenCode TUI**: Antarmuka minimalis, bersih, dan elegan tanpa banner ASCII usang.
- **Auto AGENTS.md (Soul Prompt)**: Otomatis memasang dan mengunci `~/.config/opencode/AGENTS.md` sebagai instruksi permanen (mirip `SOUL.md` di Hermes) yang dibaca model AI pada setiap turn request.
- **Wipe & Scrollback Clean**: Membersihkan layar dan riwayat scrollback terminal secara total (`\033[3J`) agar bebas dari artefak teks yang menumpuk.
- **Mobile Responsive Layout**: Lebar baris dioptimalkan di bawah 45 kolom, anti-pecah dan anti-geser saat keyboard virtual Android aktif.
- **Fast-Path Detection**: Jika OpenCode dan dependensi sudah terpasang, installer langsung masuk ke antarmuka konfigurasi dalam 0 detik.
- **Interactive Model Setup Wizard**: Atur provider LLM (Claude 3.7, GPT-4o, Gemini 2.5, OpenRouter, atau 9router/proxy kustom) langsung lewat menu dengan tombol `[m]`.
- **10 Core Engineering Skills & References**: Koleksi skill modular didukung dokumen referensi teknis mendalam di `~/.config/opencode/references/`.

---

## ⚡ Instalasi Cepat

Jalankan perintah berikut di terminal Termux Anda:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/rndsa/opencode-termux/main/install.sh)
```

---

## 🎛️ Kelola Skill & Model (`opencode-skills`)

Setelah instalasi, cukup ketik:

```bash
opencode-skills
```

Tampilan TUI OpenCode yang bersih akan muncul:

```
  OpenCode v2.0.19 · Termux Edition

  Pilih skill internal yang ingin diaktifkan:

  › ●  1. sec-audit         Audit & Celah Keamanan
    ●  2. logic-trainer     Latihan Logika & Fallacy
    ●  3. complex-logic     C.A.R.V.E. Reasoning
    ●  4. ui-ux             Modern UI/UX Design
    ●  5. backend-api       REST API & Queues
    ●  6. perf-optimizer    Performa & Memori
    ●  7. code-refactor     Clean Code & Refactor
    ●  8. code-reconstruct  Deobfuscate & AST
    ●  9. git-workflow      Auto Git & Changelog
    ●  0. db-optimizer      SQL & Index Tuning
  ─────────────────────────────────────────
  Navigasi: [↑/↓] · [Space/1-0] Toggle · [m] Model
  Terapkan: [Enter] Simpan · [a] Semua · [n] Kosong · [q] Batal
```

---

## 🤖 Konfigurasi Model AI (`[m]`)

Tekan **`m`** untuk memilih provider dan memasukkan API key:

```
  OpenCode v2.0.19 · Model & Provider Setup

  Pilih provider LLM default:

   1. Anthropic Claude  (claude-3-7-sonnet)
   2. OpenAI            (gpt-4o / gpt-5)
   3. Google Gemini     (gemini-2.5-pro / flash)
   4. OpenRouter        (multi-provider proxy)
   5. 9router / Custom  (custom baseURL & model)
   0. Kembali ke Menu Skill
```

Konfigurasi otomatis tersimpan ke `~/.config/opencode/opencode.json` dan siap digunakan seketika.

---

## 🚀 Menjalankan OpenCode

```bash
cd ~/my-project
opencode
```

Tekan **`Ctrl + K`** di dalam antarmuka OpenCode untuk memanggil skill yang telah diaktifkan.
