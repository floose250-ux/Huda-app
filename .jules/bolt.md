## 2026-07-04 - [Environment Hygiene and Code Review]
**Learning:** The 'request_code_review' tool evaluates the entire filesystem, including hidden directories like '.dart_tool/' and build artifacts in 'build/'. Failing to clean these up leads to rejected PRs due to repository bloat and local configuration leaks.
**Action:** Always perform a comprehensive cleanup of 'build/', '.dart_tool/', 'pubspec.lock', and any temporary scripts/test folders before calling 'request_code_review' or 'submit'.
