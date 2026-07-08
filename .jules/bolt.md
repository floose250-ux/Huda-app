## 2025-01-24 - [Flutter Memory & Rebuild Optimization]
**Learning:** In Flutter, helper methods that return widgets prevent the framework from using canonical instances and can cause unnecessary rebuilds. Additionally, Material color getters (e.g., Colors.orange) prevent data structures from being declared as `static const`.
**Action:** Always refactor widget-returning helper methods into `const StatelessWidget` classes. Use hex color literals (e.g., Color(0xFF...)) instead of Material color getters in static data lists to allow for constant evaluation and reduced memory allocation.
