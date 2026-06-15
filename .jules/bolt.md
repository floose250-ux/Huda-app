## 2025-05-15 - Flutter Helper Method Anti-pattern
**Learning:** Using helper methods (e.g., `_mainCard(...)`) that return Widgets inside a `build` method is a performance anti-pattern. Flutter treats these as part of the parent's build call, forcing a full sub-tree rebuild. Refactoring them into a `const StatelessWidget` allows the framework to use canonical instances and skip rebuilds entirely if parameters are unchanged.
**Action:** Always refactor repeated UI components into separate `const StatelessWidget` classes rather than helper methods.
