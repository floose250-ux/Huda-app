## 2025-05-14 - [Flutter Widget & Data Optimization]
**Learning:** Refactoring widget helper methods into `const StatelessWidget` and hoisting data to `static const` significantly reduces rebuild overhead and GC pressure in Flutter. This is a foundational optimization for performance-sensitive applications like 'Huda Pro'.
**Action:** Always prioritize extracting complex widget trees from `build` methods into `const` widgets and moving static configuration data out of build methods to avoid unnecessary allocations.
