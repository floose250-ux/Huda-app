## 2026-05-20 - Const BorderRadius in Flutter
**Learning:** In Flutter, `BorderRadius.circular(x)` is a factory constructor and cannot be used with the `const` keyword. Using it prevents the parent widget from being `const`, which limits rebuild optimizations.
**Action:** Use `const BorderRadius.all(Radius.circular(x))` instead of `BorderRadius.circular(x)` when a constant border radius is needed to enable `const` widget trees.
