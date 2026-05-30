## 2025-05-14 - Avoiding Build Artifact Pollution
**Learning:** Running `flutter analyze` or `flutter test` generates `.dart_tool/`, `build/`, and `pubspec.lock`. These files contain environment-specific paths and large binary data that must NOT be included in the PR as they cause rejection and bloat.
**Action:** Always run `rm -rf .dart_tool/ build/ pubspec.lock` before calling `request_code_review` or `submit`.
