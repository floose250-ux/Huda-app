## 2025-05-19 - Planning with Truncated Outputs
**Learning:** In environments where tool outputs (like `flutter analyze` or `read_file`) are truncated, plan reviews may fail due to "Groundedness" if they reference identifiers not visible in the trace.
**Action:** Always verify specific identifiers (class names, lint error messages) using `grep` or targeted `sed` commands before including them in a plan to ensure the plan is grounded in visible evidence.
