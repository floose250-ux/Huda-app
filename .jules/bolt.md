
## 2024-05-08 - Widget Refactoring for Rebuild Optimization
**Learning:** Using helper methods to return widgets (e.g., `_buildItem()`) in Flutter causes the entire parent widget to rebuild the subtree on every state change. Refactoring these into `const StatelessWidget` classes allows the Flutter framework to skip rebuilds if parameters haven't changed, significantly reducing UI thread load.
**Action:** Always prefer `const StatelessWidget` over helper methods for reusable UI components.

## 2024-05-08 - Static Data Allocation
**Learning:** Defining large or static data structures (like lists of maps for categories) inside the `build` method leads to redundant memory allocations and garbage collection pressure on every frame.
**Action:** Move static configuration data to `static const` class members.
