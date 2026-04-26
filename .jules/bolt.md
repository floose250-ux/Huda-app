# Bolt's Performance Journal - Huda Pro

## 2025-01-24 - Helper Methods vs. Const Widgets
**Learning:** In Flutter, refactoring helper methods that return widgets into separate `StatelessWidget` classes with `const` constructors enables the framework to skip unnecessary rebuilds. This is a primary optimization for complex UI trees.
**Action:** Always prefer `const StatelessWidget` over helper methods for reusable UI components.
