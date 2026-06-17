## 2025-05-15 - [Flutter Widget and Memory Optimization]
**Learning:** Refactoring helper methods that return widgets into `const StatelessWidget` classes is a high-impact optimization in Flutter. It enables the framework to use canonical instances and skip rebuilds of the widget subtree. Additionally, moving static data structures out of the `build` method into `static const` members prevents redundant allocations.
**Action:** Always prefer `const StatelessWidget` over helper methods for UI components and move static configuration data to `static const` class members.
