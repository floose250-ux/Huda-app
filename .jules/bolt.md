## 2025-05-14 - Optimized widget rebuilding and static data allocation
**Learning:** Refactoring helper methods that return widgets into separate 'const' StatelessWidget classes allows the Flutter framework to perform better rebuild optimizations. Additionally, moving hardcoded data structures out of 'build' methods into 'static const' members reduces unnecessary memory allocations.
**Action:** Always prefer 'const' StatelessWidgets over helper methods for UI components and keep static data outside of 'build' loops.
