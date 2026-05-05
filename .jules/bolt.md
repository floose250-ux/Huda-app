
## 2024-05-15 - Flutter Optimization Patterns
**Learning:** Using helper methods for widgets (like ) prevents the use of  constructors, causing unnecessary rebuilds of the entire subtree. Additionally, defining data structures like  inside  causes redundant memory allocations every time the widget rebuilds.
**Action:** Refactor widget helper methods into  classes and move immutable data to  class members.

## 2024-05-15 - Flutter Optimization Patterns
**Learning:** Using helper methods for widgets (like `_mainCard`) prevents the use of `const` constructors, causing unnecessary rebuilds of the entire subtree. Additionally, defining data structures like `List<Map>` inside `build()` causes redundant memory allocations every time the widget rebuilds.
**Action:** Refactor widget helper methods into `const StatelessWidget` classes and move immutable data to `static const` class members.
