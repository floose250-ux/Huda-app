## 2025-05-12 - Widget and Data Structure Optimization in Flutter
**Learning:** Using helper methods for widgets prevents Flutter's rebuild optimizations. Additionally, defining static data structures (like Lists or Maps) inside the `build` method leads to redundant memory allocations on every frame/rebuild.
**Action:** Always refactor widget helper methods into `const StatelessWidget` classes and move static data to `static const` members to minimize GC pressure and enable framework-level optimizations.
