## 2026-06-25 - [Flutter: Const Widget Refactoring]
**Learning:** In Flutter, refactoring helper methods into standalone `const StatelessWidget` components is a critical performance win. It allows the framework to use canonical instances and skip rebuilds for that subtree, reducing the computational load on the UI thread.
**Action:** Always prefer `const` widgets over helper methods for UI components that don't depend on dynamic parent state.

## 2026-06-25 - [Environment Hygiene: Build Artifacts]
**Learning:** Running `flutter pub get` or `flutter run` generates massive amounts of machine-specific and binary artifacts in `build/` and `.dart_tool/`. These must be explicitly deleted before submission to avoid polluting the repository and PR.
**Action:** Always run a comprehensive cleanup command (`rm -rf build/ .dart_tool/ pubspec.lock ...`) as the final step before calling `submit`.
