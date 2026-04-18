## 2024-04-18 - Flutter Widget Rebuild & Allocation Optimization
**Learning:** Refactoring widget-returning helper methods into separate `const StatelessWidget` classes allows the Flutter framework to optimize the element tree and skip unnecessary rebuilds. Additionally, moving hardcoded data lists from `build()` to `static const` members prevents redundant allocations and GC pressure.
**Action:** Always prefer `const StatelessWidget` over helper methods for UI components and use `static const` for static configuration data.
