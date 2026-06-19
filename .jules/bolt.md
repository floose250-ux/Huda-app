## 2025-05-15 - Optimize Widget Tree and Memory Allocation
**Learning:** Refactoring helper methods that return Widgets into `const StatelessWidget` classes allows Flutter to use canonical instances and skip rebuilding the subtree, improving build performance. Additionally, moving static data out of the `build` method into `static const` fields prevents unnecessary memory allocations on every rebuild.
**Action:** Always prefer `StatelessWidget` over helper methods for complex UI components and move static configuration data to `static const` fields.
