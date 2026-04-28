## 2024-05-15 - Material Icon Case Sensitivity
**Learning:** Material icon identifiers in Flutter are case-sensitive and must be lowercase (e.g., 'Icons.favorite' instead of 'Icons.Favorite'). Incorrect casing causes compilation errors that 'flutter analyze' catches.
**Action:** Always use lowercase for Material icon names and run 'flutter analyze' to verify identifiers.

## 2024-05-15 - Widget Rebuild Optimization
**Learning:** Refactoring helper methods that return widgets into separate 'const' StatelessWidget classes is a powerful optimization in Flutter. It allows the framework to skip rebuilding these widgets if their properties haven't changed, reducing CPU and memory usage.
**Action:** Prefer 'const' StatelessWidget over helper methods for UI components that don't change frequently.
