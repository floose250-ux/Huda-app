## 2026-05-09 - Optimized Widget Rebuilds and Static Allocations
**Learning:** Refactoring helper methods that return widgets into standalone 'const' StatelessWidget classes allows the Flutter framework to skip unnecessary rebuilds. Additionally, moving static data structures (like lists of maps) out of the 'build' method into 'static const' members avoids redundant memory allocations and CPU cycles on every frame.
**Action:** Always prefer 'const' StatelessWidget classes over helper methods for UI components, and ensure static data is declared as 'static const' outside the build method.
