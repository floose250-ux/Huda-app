# Bolt's Journal - Critical Learnings

## 2024-05-22 - Flutter Widget Optimization
**Learning:** Refactoring helper methods that return widgets into separate 'const' StatelessWidget classes enables framework-level rebuild optimizations and improves performance.
**Action:** Always prefer 'const' StatelessWidget over helper methods for UI components.

## 2024-05-22 - Asset Loading
**Learning:** Large JSON assets like 'quran.json' should be parsed in a background isolate using 'compute()' to avoid blocking the UI thread.
**Action:** Use 'compute()' for parsing assets > 50KB and cache results in a singleton service.
