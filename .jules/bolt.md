## 2025-05-23 - Widget and Static Data Optimization
**Learning:** Moving static data out of `build` methods and refactoring helper functions into `const` StatelessWidget classes enables Flutter's framework-level optimizations, reducing redundant allocations and rebuild cycles. Fixes for icon casing also prevent runtime/analyzer errors.
**Action:** Always prefer `static const` for immutable data and separate `StatelessWidget` with `const` constructors over helper methods returning widgets.
