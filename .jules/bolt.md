## 2025-05-15 - [JSON Pre-loading and isolate parsing]
**Learning:** For larger JSON assets like the Quran, loading and parsing on the main thread can cause jank. Pre-loading during startup and using `compute()` to parse in a background isolate ensures a smooth user experience.
**Action:** Always consider `compute()` for expensive JSON parsing and pre-load static assets if they are guaranteed to be used.

## 2025-05-15 - [Flutter const optimizations]
**Learning:** Refactoring helper methods that return widgets into separate `const` classes allows Flutter to skip unnecessary rebuilds, which is a simple but effective performance win.
**Action:** Extract reusable UI components into `const` StatelessWidgets instead of using functions.
