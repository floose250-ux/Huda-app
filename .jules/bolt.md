## 2026-04-19 - [Optimization of Widget Rebuilds and Static Data]
**Learning:** In Flutter, refactoring helper methods that return widgets into separate 'const' StatelessWidget classes is a critical optimization that allows the framework to skip unnecessary rebuilds. Similarly, moving static data structures out of the 'build' method into 'static const' members prevents redundant allocations and CPU cycles on every rebuild.
**Action:** Always prefer 'const' StatelessWidget over helper methods for UI components and use 'static const' for immutable data structures in widgets.
