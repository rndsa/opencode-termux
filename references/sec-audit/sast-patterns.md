# SAST Vulnerability Detection Patterns & Test Vectors

Pola deteksi kerentanan source code lintas bahasa (Node.js/TypeScript, Python, Go, PHP) untuk keperluan audit keamanan statis.

---

## 1. Path Traversal / Arbitrary File Read (CWE-22)
- **Vulnerable Pattern**:
  ```javascript
  const filePath = path.join('/var/data', req.query.filename);
  fs.readFileSync(filePath);
  ```
- **Remediation**:
  Validasi canonical path atau sanitize string filename:
  ```javascript
  const safeName = path.basename(req.query.filename);
  const resolved = path.resolve('/var/data', safeName);
  if (!resolved.startsWith('/var/data')) throw new Error('Access denied');
  ```

---

## 2. Insecure Direct Object Reference (IDOR / BOLA)
- **Vulnerable Pattern**:
  ```python
  @app.get("/api/orders/{order_id}")
  def get_order(order_id: int):
      return db.query(Order).filter(Order.id == order_id).first()
  ```
- **Remediation**:
  Sertakan tenant / user ID dari session yang terautentikasi:
  ```python
  @app.get("/api/orders/{order_id}")
  def get_order(order_id: int, current_user: User = Depends(get_current_user)):
      order = db.query(Order).filter(Order.id == order_id, Order.user_id == current_user.id).first()
      if not order:
          raise HTTPException(status_code=404, detail="Order not found")
      return order
  ```

---

## 3. Server-Side Request Forgery (SSRF)
- **Vulnerable Pattern**:
  Menerima parameter URL langsung dari user lalu melakukan fetch request server-side.
- **Remediation**:
  - Whitelist skema protocol (`https://` saja).
  - Resolve DNS sebelum koneksi dan verifikasi IP tujuan bukan loopback, private IPv4/IPv6, atau cloud metadata IP (`169.254.169.254`).
