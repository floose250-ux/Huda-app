## 2026-04-21 - Optimize widget rebuilds and static data allocations
**Learning:** Moving static data out of the 'build' method into 'static const' members avoids redundant memory allocations and CPU cycles on every widget rebuild. Refactoring helper methods into separate 'const' StatelessWidget classes enables framework-level rebuild optimizations.
**Action:** Always prefer 'const' widgets and 'static const' data structures for static content in Flutter to minimize build overhead.
