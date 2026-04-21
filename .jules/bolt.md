## 2025-04-20 - Flutter Widget Optimization
**Learning:** Moving static data structures (like `List<Map>`) from the `build` method to `static const` members prevents redundant allocations and GC pressure on every rebuild. Refactoring helper methods that return widgets into `const` `StatelessWidget` classes enables the Flutter framework to skip rebuilds for those widgets entirely if their parameters haven't changed.
**Action:** Always prefer `const` `StatelessWidget` over helper methods and use `static const` for immutable data in UI components.
