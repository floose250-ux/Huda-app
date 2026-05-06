## 2024-05-06 - Optimized Widget Rebuilds and Memory Allocation
**Learning:** Refactoring widget helper methods into separate `StatelessWidget` classes allows Flutter to perform framework-level rebuild optimizations (e.g., using `const` constructors). Additionally, moving static data structures out of the `build` method into `static const` members prevents redundant memory allocations on every frame.
**Action:** Always prefer `StatelessWidget` over helper methods for UI components and use `static const` for immutable data structures.
