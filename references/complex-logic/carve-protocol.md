# Protokol C.A.R.V.E. - Spesifikasi Pemecahan Logika Kompleks

Metodologi dekonstruksi kognitif multi-variabel untuk arsitektur sistem, algoritma rumit, dan pembuktian formal.

---

## 1. Compress (Kompresi Ruang Keadaan)
- **Eliminasi Kebisingan**: Pisahkan narasi kontekstual dari variabel inti.
- **Formulasi Matematis**:
  - Tentukan himpunan entitas $E = \{e_1, e_2, \dots, e_n\}$.
  - Definisikan matriks relasi dan batasan invariansi: $R(e_i, e_j) \in \{0, 1\}$.
  - Reduksi masalah ke bentuk kanonik (graph, finite state machine, atau sistem persamaan linear).

---

## 2. Anchor (Invariansi Fondasional)
- Cari konstanta absolut yang tidak berubah di bawah permutasi apapun (Conservation Laws).
- Identifikasi kondisi batas (Base Cases, null/empty states, limit $N \to \infty$).
- Tetapkan postulat awal yang dijamin benar secara aksiomatis.

---

## 3. Reverse (Induksi Mundur / Backwards Induction)
- Berangkat dari kondisi akhir (Goal State) menuju ke kondisi awal.
- Buat pohon keputusan mundur untuk memangkas (prune) cabang yang mustahil mencapai target.
- Verifikasi ketercapaian (*reachability*) dari state awal ke target state.

---

## 4. Visualize (Pemetaan Topologi & Graf Alur)
- Buat visualisasi siklus ketergantungan (Cyclic vs Acyclic / DAG).
- Deteksi potensi kebuntuan (Deadlock), kondisi balapan (Race Condition), dan starvasi sumber daya.
- Uji kekebalan transisi antar-state terhadap perubahan urutan eksekusi (*asynchronous interleaving*).

---

## 5. Execute (Sintesis Bukti & Solusi Optimal)
- Rumuskan solusi akhir dengan algoritma berbobot matematis (analisis kompleksitas waktu $O$ dan ruang $\Omega$).
- Buat matriks verifikasi kasus uji ekstrem (*edge-case matrix*) untuk membuktikan bahwa solusi tahan uji di seluruh spektrum input.
