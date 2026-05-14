## 2025-05-15 - [Widget Rebuild & Static Data Optimization]
**Learning:** In Flutter, helper methods for widgets (like `_mainCard`) prevent the framework from using `const` optimizations and cause unnecessary rebuilds of the entire subtree. Additionally, defining static data lists inside the `build` method leads to redundant allocations on every frame.
**Action:** Always refactor widget helper methods into separate `const` StatelessWidget classes and move static data to `static const` members to enable framework-level optimizations.
