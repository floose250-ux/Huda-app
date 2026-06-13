## 2025-01-24 - [Flutter Optimization: Widgets vs Helper Methods]
**Learning:** Using helper methods to return widgets in Flutter is an anti-pattern as it prevents the framework from optimizing rebuilds and using `const` constructors effectively.
**Action:** Always refactor widget-returning helper methods into separate `StatelessWidget` classes to leverage Flutter's build caching and `const` optimizations.

## 2025-01-24 - [Flutter Optimization: Static Data Allocation]
**Learning:** Allocating static data structures (like lists of maps) inside the `build` method leads to redundant memory allocations on every widget rebuild.
**Action:** Move static data structures to `static const` class members to ensure they are allocated only once.
