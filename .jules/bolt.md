## 2025-01-24 - [Environment Hygiene for Flutter Submissions]
**Learning:** Including platform-specific boilerplate (`android/`, `ios/`, etc.) and build artifacts (`.dart_tool/`, `pubspec.lock`) in a PR leads to immediate rejection in this repository, even if the core logic changes are correct. These files are considered noise and clutter.
**Action:** Always perform a comprehensive cleanup of all generated directories and files before calling `request_code_review` or `submit`. Verify the filesystem state with `ls -a`.
