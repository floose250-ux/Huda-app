## 2025-05-14 - Optimization Pattern: StatelessWidget vs Helper Methods
**Learning:** In Flutter, refactoring helper methods that return widgets into separate 'const' StatelessWidget classes is a major performance win. It enables the framework to skip rebuilds for those subtrees and reduces the work on the build method of the parent widget.
**Action:** Always prefer creating a new StatelessWidget over a helper method for reusable or complex UI components.

## 2025-05-14 - Data Allocation in Build Methods
**Learning:** Storing static data like lists or maps directly inside the 'build' method causes redundant memory allocations and CPU cycles on every frame/rebuild.
**Action:** Move static data structures to 'static const' members of the widget class.

## 2025-05-14 - Optimization Pitfall: const in Builders
**Learning:** Attempting to use 'const' for a widget inside a builder (like ListView.builder) where the widget depends on dynamic parameters like an index will cause an 'invalid_constant' error.
**Action:** Use 'const' for the widget class constructor if possible, but the call site in the builder must omit 'const' if it passes dynamic data.
