# OpenCode for Termux

Native terminal AI coding assistant & engineering ecosystem, dioptimalkan khusus untuk lingkungan Android / Termux (`aarch64`). Dilengkapi manajer skill modular interaktif serta repositori referensi arsitektur komprehensif.

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

- **Native aarch64 Execution**: Berjalan langsung di runtime Bionic Termux tanpa proot / chroot, tanpa overhead virtualisasi.
- **Dedicated Skills Manager (`opencode-skills`)**: Pasang, copot, atau sinkronisasi skill internal kapan saja melalui antarmuka TUI interaktif.
- **Multi-Select & Permission-First**: Pengguna memegang kendali penuh untuk memilih skill yang dibutuhkan (multi-select, single, atau clean vanilla tanpa skill).
- **10 Modular Engineering Skills**: Koleksi skill bawaan mulai dari security audit, personal logic trainer, arsitektur backend, hingga UI/UX anti-template.
- **Multi-Reference Architecture**: Dilengkapi dokumen referensi teknis mendalam (`~/.config/opencode/references/`) yang otomatis dirujuk oleh model AI.
- **Universal Provider Compatibility**: Mendukung Claude (Sonnet/Opus), OpenAI, Gemini, OpenRouter, dan custom proxy endpoint.

---

## ⚡ Instalasi Cepat (One-Line Setup)

Jalankan perintah berikut di terminal Termux Anda:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/rndsa/opencode-termux/main/install.sh)
```

Atau instalasi manual melalui git clone:

```bash
git clone https://github.com/rndsa/opencode-termux.git
cd opencode-termux
chmod +x install.sh bin/opencode-skills
./install.sh
```

---

## 🎛️ Kelola Skill Kapan Saja (`opencode-skills`)

Setelah instalasi selesai, Anda dapat mengelola skill internal kapan pun Anda mau tanpa harus install ulang OpenCode. Cukup ketik perintah berikut di terminal Termux Anda:

```bash
opencode-skills
```

Antarmuka TUI interaktif akan langsung terbuka:

```
╭────────────────────────────────────────────────────────────────────────╮
│ OpenCode Modular Skills Manager                                        │
│ Pilih skill yang ingin dipasang/dicopot (Multi-Select):                │
╰────────────────────────────────────────────────────────────────────────╯

 Navigasi: [↑/↓] atau [j/k] | [Space] Toggle | [1-9,0] Langsung | [Enter] Simpan

  ❯ [●]  1. sec-audit        · Code Security Audit, Surface Mapping & Logic Flaws
    [●]  2. logic-trainer    · Interactive Socratic Logic Sparring Coach & Fallacy Dissector
    [●]  3. complex-logic    · C.A.R.V.E. Extreme Reasoning & Algorithmic Problem Solving
    [●]  4. ui-ux            · Modern Interface Architecture, Design Systems & Anti-Slop UI
    [●]  5. backend-api      · Production Backend APIs, Idempotency, Queues & Auth Schemes
    [●]  6. perf-optimizer   · Concurrency Benchmarking, Latency & Low-Memory Optimization
    [●]  7. code-refactor    · Clean Architecture, Type Safety & Technical Debt Elimination
    [●]  8. code-reconstruct · Code Reconstruction, AST Normalization & Deobfuscation
    [●]  9. git-workflow     · Conventional Commits Authoring & Release Changelog Automation
    [●]  0. db-optimizer     · SQL Query Tuning, Execution Plans & Schema Architecture

  Shortcut: [a] Pilih Semua  | [n] Kosongkan Semua  | [Enter] Terapkan  | [q] Batal
```

- **Multi-Select**: Tekan `Space` untuk toggle status pasang `[●]` atau copot `[○]`.
- **Keyboard Virtual / Angka**: Tekan angka `1` hingga `9` atau `0` untuk toggle langsung tanpa navigasi panah.
- **Pilih Semua (`a`)**: Mengaktifkan seluruh 10 skill internal.
- **Kosongkan Semua (`n`)**: Menghapus seluruh skill (mode vanilla tanpa skill tambahan).

---

## 🧠 Bedah Mendalam 10 Skill Internal

Berikut adalah penjelasan teknis detail untuk setiap skill yang tersedia dalam distribusi ini:

### 1. `user:sec-audit` (Static Code Security Audit & Vulnerability Assessment)
- **Fungsi**: Melakukan audit keamanan statis (SAST) menyeluruh terhadap kode sumber lokal.
- **Kemampuan**:
  - Memetakan seluruh attack surface (ingress routes, parameter HTTP, CLI arguments, WebSocket handlers).
  - Mendeteksi celah otentikasi & otorisasi: Broken Object Level Authorization (BOLA/IDOR), bypass JWT, session hijack.
  - Memeriksa injection sinks (SQLi, NoSQLi, Command Injection, SSRF, Path Traversal) dan kebocoran kredensial rahasia (API keys, private keys).
  - Menganalisis kondisi balapan (Race Conditions / TOCTOU) pada mutasi data sensitif seperti saldo dan limitasi request.
- **Referensi Tersemat**: `references/sec-audit/checklist-owasp.md` & `references/sec-audit/sast-patterns.md`.

### 2. `user:logic-trainer` (Interactive Socratic Logic Sparring Coach)
- **Fungsi**: Mengubah sesi terminal menjadi arena latihan berpikir kritis dan penalaran deduktif langsung bersama AI.
- **Kemampuan**:
  - **Ronde A (Dekonstruksi Argumen)**: Memisahkan klaim eksplisit, premis pendukung, dan asumsi tersembunyi yang rapuh.
  - **Ronde B (Jebakan Kondisional If-Then)**: Menguji pemahaman arah implikasi formal ($P \to Q$), kontraposisi ($\neg Q \to \neg P$), serta mendeteksi kekeliruan *Affirming the Consequent*.
  - **Ronde C (Kuantifier & Negasi)**: Melatih formulasi negasi eksak dari proposisi universal/eksistensial.
  - **Ronde D (Teka-teki Deduksi Murni)**: Teka-teki Knights & Knaves multi-agen berbasis pencarian kontradiksi invariansi.
  - **Scoring Mekanis**: Menilai akurasi jawaban (skor 1-10) dengan penjelasan bedah celah logika secara objektif.
- **Referensi Tersemat**: `references/logic-trainer/fallacies-taxonomy.md`.

### 3. `user:complex-logic` (Multi-variable Reasoning & Algorithmic Architecture)
- **Fungsi**: Memecahkan persoalan logika rumit, arsitektur sinkronisasi state machine, dan masalah multi-variabel.
- **Metodologi (Protokol C.A.R.V.E.)**:
  - **C (Compress)**: Mereduksi narasi masalah ke bentuk kanonik (matriks relasi, graf state, aljabar boolean).
  - **A (Anchor)**: Mengunci invariansi dasar dan kondisi batas (*boundary conditions*) yang absolut.
  - **R (Reverse)**: Induksi mundur dari target terminal (*goal state*) untuk memangkas cabang pencarian yang sia-sia.
  - **V (Visualize)**: Memetakan graf siklus ketergantungan (DAGs) dan memverifikasi kekebalan terhadap race-condition.
  - **E (Execute)**: Merumuskan solusi optimal dengan bukti matematis formal dan analisis kompleksitas $O(N)$.
- **Referensi Tersemat**: `references/complex-logic/carve-protocol.md`.

### 4. `user:ui-ux` (Modern Interface Architecture & Anti-Slop Design)
- **Fungsi**: Merancang atau mengaudit komponen antarmuka web dengan estetika profesional bebas dari template klise.
- **Kemampuan**:
  - Menerapkan hierarki visual kontras tinggi dengan palet slate/zinc gelap dan batas border halus (`1px border-zinc-800`).
  - Menegakkan sistem token desain modular berbasis grid 4px/8px.
  - Memastikan kepatuhan aksesibilitas WCAG AA/AAA (rasio kontras teks, focus-visible states) dan responsivitas fluid pada viewport mobile.
- **Referensi Tersemat**: `references/ui-ux/design-tokens-guidelines.md`.

### 5. `user:backend-api` (Production API Design, Idempotency & Queues)
- **Fungsi**: Merancang backend tangguh dengan kontrak API terstandarisasi dan fault tolerance tinggi.
- **Kemampuan**:
  - Mendesain kontrak REST/GraphQL yang bersih dengan schema validator ketat (Zod/Pydantic).
  - Mengimplementasikan pola kunci idempotensi (`Idempotency-Key`) untuk mencegah eksekusi ganda pada transaksi kritis.
  - Merancang arsitektur pipeline antrean tugas dengan retry exponential backoff + jitter dan Dead-Letter Queue (DLQ).
- **Referensi Tersemat**: `references/backend-api/idempotency-and-queues.md`.

### 6. `user:perf-optimizer` (Concurrency Profiling & Latency Optimization)
- **Fungsi**: Melakukan profiling dan optimasi hot-path untuk meningkatkan throughput dan meminimalkan penggunaan RAM.
- **Kemampuan**:
  - Mengidentifikasi event loop blocking, panggilan I/O sinkron, dan algoritma kuadratik $O(N^2)$.
  - Meminimalisir overhead memori melalui alokasi zero-copy dan pemrosesan stream.
  - Mengeliminasi lock contention pada sistem konkuren tinggi beralih ke operasi atomik atau antrean lock-free.
- **Referensi Tersemat**: `references/perf-optimizer/concurrency-and-memory.md`.

### 7. `user:code-refactor` (Clean Architecture & Tech Debt Elimination)
- **Fungsi**: Restrukturisasi kode tanpa merusak fungsionalitas yang ada (zero-regression refactoring).
- **Kemampuan**:
  - Mengeliminasi code smells, fungsi monster (God objects), dan percabangan berulang.
  - Menegakkan prinsip Single Responsibility (SRP) dan pemisahan logika bisnis murni dari efek samping I/O untuk kemudahan testing.
  - Menyediakan diff refactoring bedah yang rapi dan type-safe.

### 8. `user:code-reconstruct` (AST Normalization & Deobfuscation)
- **Fungsi**: Membantu membaca dan merekonstruksi arsitektur kode yang terobfuskasi atau terminifikasi.
- **Kemampuan**:
  - Membongkar perataan alur kontrol (*control flow de-flattening*) dan string array terenkripsi.
  - Menormalisasi struktur Abstract Syntax Tree (AST) dan memetakan variabel acak ke penamaan domain fungsional yang deskriptif.
- **Referensi Tersemat**: `references/code-reconstruct/ast-deobfuscation.md`.

### 9. `user:git-workflow` (Conventional Commits & Release Automation)
- **Fungsi**: Otomasi manajemen version control dan perilisan repositori.
- **Kemampuan**:
  - Memeriksa staged diff dan mengelompokkan perubahan ke dalam commit atomik sesuai standar Conventional Commits (`feat:`, `fix:`, `refactor:`, `perf:`).
  - Menghasilkan ringkasan changelog rilis markdown berkualitas tinggi antartag versi.

### 10. `user:db-optimizer` (SQL Tuning, Indexing & Schema Architecture)
- **Fungsi**: Mendiagnosis query lambat dan mengoptimalkan performa basis data relasional.
- **Kemampuan**:
  - Menganalisis log eksekusi query (`EXPLAIN ANALYZE`) dan mendeteksi sequential table scan.
  - Merancang indeks komposit optimal dengan menerapkan aturan *Left-to-Right* (kesetaraan $\to$ rentang $\to$ pengurutan).
  - Mengeliminasi query N+1 pada integrasi ORM.
- **Referensi Tersemat**: `references/db-optimizer/indexing-and-explain.md`.

---

## 📚 Repositori Multi-Referensi (`references/`)

Setiap skill didukung oleh dokumen referensi independen yang tersimpan di `~/.config/opencode/references/`. Dokumen ini menjadi rujukan baku model saat mengeksekusi instruksi:

```
~/.config/opencode/references/
├── sec-audit/
│   ├── checklist-owasp.md       # Standar audit OWASP Top 10 & CWE
│   └── sast-patterns.md         # Pola kode rentan & sanitasi
├── logic-trainer/
│   └── fallacies-taxonomy.md    # Katalog lengkap sesat pikir & logika formal
├── complex-logic/
│   └── carve-protocol.md        # Spesifikasi alur protokol C.A.R.V.E.
├── ui-ux/
│   └── design-tokens-guidelines.md # Skala spasi, kontras warna & mikro-interaksi
├── backend-api/
│   └── idempotency-and-queues.md   # Pola kunci idempotensi & arsitektur antrean
├── perf-optimizer/
│   └── concurrency-and-memory.md   # Zero-copy memory & non-blocking I/O
├── code-reconstruct/
│   └── ast-deobfuscation.md     # De-flattening & de-anonymization simbol
└── db-optimizer/
    └── indexing-and-explain.md  # Indeks komposit & analisis query cost
```

---

## 🚀 Menjalankan OpenCode

### 1. Konfigurasi Provider Kredensial

Pilih provider yang Anda gunakan:

```bash
# Claude Anthropic
export ANTHROPIC_API_KEY="sk-ant-..."

# OpenAI
export OPENAI_API_KEY="sk-..."

# Custom Proxy / Router (contoh: 9router / OpenRouter)
export OPENAI_BASE_URL="https://api.your-router.com/v1"
export OPENAI_API_KEY="sk-..."
```

### 2. Membuka Antarmuka OpenCode

```bash
cd ~/my-project
opencode
```

### 3. Memanggil Skill Internal

Di dalam layar OpenCode:
1. Tekan pintasan **`Ctrl + K`**.
2. Pilih salah satu skill yang sudah dipasang (contoh: `user:logic-trainer` untuk sparring logika, atau `user:sec-audit` untuk memeriksa keamanan proyek).
3. Tekan **Enter** dan asisten AI akan mengeksekusi framework terpilih secara mendalam.
