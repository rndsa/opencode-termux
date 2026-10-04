# Standar Desain UI/UX & Token Arsitektur Antarmuka

Pedoman implementasi frontend berestetika tinggi, minim distorsi (anti-slop), dan berfokus pada efisiensi interaksi.

---

## 1. Aturan Warna & Kontras (Dark Mode Discipline)
- **Background Utama**: Hindari hitam murni `#000000` pekat untuk canvas luas. Gunakan warna slate/zinc dalam: `#09090b` (Zinc 950) atau `#0b0f17`.
- **Surface / Card**: `#121215`, `#18181b` (Zinc 900) dengan border tipis `1px solid rgba(255, 255, 255, 0.08)`.
- **Text Hierarchy**:
  - Primary: `#f4f4f5` (Zinc 100) — kontras rasio minimal 7:1 (WCAG AAA).
  - Secondary: `#a1a1aa` (Zinc 400).
  - Muted / Caption: `#71717a` (Zinc 500).
- **Accents**: Pilih satu warna aksen tegas (misal Cyan `#06b6d4`, Indigo `#6366f1`, Emerald `#10b981`), gunakan maksimal pada 10% elemen interaktif utama.

---

## 2. Spacing & Grid System
- Gunakan skala spasi berbasis kelipatan 4px / 8px:
  - Micro-spacing: 4px (`gap-1`), 8px (`gap-2`) untuk relasi ikon & teks.
  - Component-padding: 12px (`p-3`), 16px (`p-4`), 24px (`p-6`).
  - Section-separation: 32px (`my-8`), 48px (`my-12`).

---

## 3. Micro-Interactions & Responsivitas
- **Button Feedback**: Transisi aktif `active:scale-[0.98]` dengan durasi 100ms cubic-bezier.
- **Focus States**: Wajib sediakan `focus-visible:ring-2 focus-visible:ring-cyan-500/50` untuk pengguna keyboard / aksesibilitas.
- **Mobile Touch Targets**: Elemen interaktif pada layar sentuh (HP/Termux webview) harus memiliki target klik minimal 44x44px.
