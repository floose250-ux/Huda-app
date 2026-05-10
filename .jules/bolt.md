## 2025-05-14 - Initial Performance Audit
**Learning:** Found typical Flutter performance anti-patterns: helper methods instead of const widgets and static data defined inside build methods.
**Action:** Refactor helper methods to const StatelessWidget and move static data to static const members.
