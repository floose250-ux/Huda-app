## 2025-05-25 - Const Border Radius in Flutter
**Learning:** `Radius.circular(x)` is a static method and not a constant expression in Flutter. This prevents widgets like `RoundedRectangleBorder` from being declared as `const` if they use it.
**Action:** Use `Radius.elliptical(x, x)` instead of `Radius.circular(x)` when a `const` `Radius` is required.

## 2025-05-25 - Cleaning up Flutter Boilerplate
**Learning:** `flutter create .` generates hundreds of platform-specific files (android, ios, etc.) that can pollute the repository and trigger warnings about large diffs.
**Action:** Always run a comprehensive cleanup command `rm -rf android/ ios/ web/ windows/ linux/ macos/ .dart_tool/ test/ build/ .idea/ *.iml ...` before requesting code review or submitting, unless those files are explicitly intended to be part of the PR.
