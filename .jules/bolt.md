# Bolt Performance Journal ⚡

## 2024-05-16 - Widget Rebuild and Allocation Optimization
**Learning:** Refactoring helper methods that return widgets into `const StatelessWidget` classes allows Flutter to cache and reuse the widget instances, preventing unnecessary rebuilds of child trees. Additionally, moving static data lists out of the `build` method into `static const` members avoids redundant memory allocations and garbage collection pressure on every frame.
**Action:** Always prefer `const StatelessWidget` over widget-returning functions for complex or frequent UI components, and ensure static data is stored in `const` or `static` members.
