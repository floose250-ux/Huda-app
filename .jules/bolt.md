## 2025-05-14 - Redundant Boilerplate in Pull Requests
**Learning:** Automatically generated Flutter test files (like `test/widget_test.dart`) and platform folders from `flutter create .` are considered repository pollution and must be explicitly deleted before submission.
**Action:** Always run a cleanup command like `rm -rf test/ android/ ios/ web/ windows/ linux/ macos/ .dart_tool/ build/ .gitignore analysis_options.yaml` before calling `submit` or `request_code_review`.
