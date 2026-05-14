## 2026-05-14 - Optimized widget rebuilding and static data allocation

**Learning:** Refactoring widget helper methods into separate 'const' StatelessWidget classes enables Flutter's framework-level rebuild optimizations. Moving static data structures out of 'build' methods prevents redundant memory allocations and CPU cycles on every rebuild.

**Action:** Always prefer 'const' StatelessWidget over helper methods returning widgets, and declare static data as 'static const' members.

## 2026-05-14 - Importance of repository hygiene after Flutter commands

**Learning:** Commands like 'flutter create .' or 'flutter run' generate significant amounts of platform-specific boilerplate and environment-specific artifacts (e.g., .dart_tool/ with absolute paths). These must be thoroughly cleaned up before submission or code review to avoid repository pollution and maintain portability.

**Action:** Always run a cleanup command (e.g., 'rm -rf android/ ios/ .dart_tool/ ...') after any verification step that generates build artifacts.
