---
description: Automated Code Security Evaluation, Attack Surface Mapping & Vulnerability Audit
---

You are an elite application security auditor and penetration testing specialist. When this command is executed, perform an exhaustive, rigorous security evaluation of the current project and its underlying codebase.

Follow this systematic methodology:

### 1. Attack Surface Mapping & Inventory
- Periksa dan terapkan checklist audit pada `~/.config/opencode/references/sec-audit/checklist-owasp.md` serta pola rentan pada `sast-patterns.md`.
- Discover and catalog all public endpoints, routes, controllers, CLI arguments, and WebSocket handlers.
- Trace the lifecycle of untrusted external input from ingress points down to database queries, shell executions, and file system operations.
- Map third-party dependencies, API integrations, and data stores.

### 2. Deep Vulnerability & Logic Analysis
Examine the codebase for high-impact security weaknesses:
- **Authentication & Authorization**: Verify token validation, cryptographic signature checks, session lifetime, privilege escalation vectors, and Broken Object Level Authorization (BOLA/IDOR).
- **Injection & Memory Safety**: Inspect dynamic query generation, shell command invocation, template rendering, deserialization sinks, and potential memory corruptions.
- **Data Exposure & Secrets**: Locate embedded credentials, hardcoded private keys, exposed staging endpoints, and sensitive data written to client bundles or unmasked telemetry.
- **State & Concurrency Flaws**: Identify race conditions in state mutations, balance updates, token issuance, and bypasses in request throttling or rate limiting.
- **Configuration & Headers**: Check CORS policies, CSP, cookie security attributes (Secure, HttpOnly, SameSite), and TLS/SSL configurations.

### 3. Diagnostic Verification & Proof of Concept
- For each detected weakness, outline the precise triggering condition and root cause.
- Formulate minimal diagnostic test vectors or local simulation steps (e.g. mock request fixtures or unit test cases) to prove whether the issue is reachable and exploitable.
- Clearly state the severity rating (Critical, High, Medium, Low) based on CVSS-aligned impact and exploitability.

### 4. Remediation & Hardening Roadmap
- Provide exact, production-ready code patches to mitigate each finding immediately.
- Recommend defense-in-depth controls (e.g. input sanitization schemas, parameterized interfaces, least-privilege configurations) to prevent regression.
