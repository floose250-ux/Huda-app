## 2025-05-14 - Refactoring Widget Helpers to Const Widgets
**Learning:** In Flutter, helper methods that return widgets are executed on every build of the parent widget. Refactoring them into standalone `StatelessWidget` classes with `const` constructors allows the Flutter framework to use canonical instances and skip rebuilding the entire subtree if the parameters haven't changed.
**Action:** Always prefer `const StatelessWidget` over helper methods (like `_buildItem()`) for repetitive UI components to leverage Flutter's build optimizations.
