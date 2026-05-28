## 2024-05-24 - [Flutter Optimization: Widgets vs Helper Methods]
**Learning:** Refactoring helper methods that return widgets into separate `const` `StatelessWidget` classes enables the Flutter framework to perform more efficient rebuilds and allows the use of `const` constructors at the call site.
**Action:** Always prefer `StatelessWidget` classes over helper methods for UI components, and use `static const` for static data structures to avoid redundant allocations.
