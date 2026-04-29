## 2025-05-15 - Flutter Rebuild and Allocation Optimizations
**Learning:** Using helper methods that return Widgets prevents Flutter from using `const` optimizations, leading to unnecessary rebuilds of static UI elements. Additionally, declaring data structures inside the `build` method causes redundant allocations on every frame.
**Action:** Always refactor Widget-returning helper methods into `const` `StatelessWidget` classes and move static data to `static const` class members.
