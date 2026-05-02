## 2025-05-01 - Compilation vs Optimization
**Learning:** You cannot reliably measure performance impact or even run the application if it has basic compilation errors (like undefined icon identifiers). Fix the "broken" state before applying "faster" state.
**Action:** Always run `flutter analyze` first to catch low-hanging fruit and errors that block execution.
