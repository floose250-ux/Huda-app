## 2026-04-24 - [Flutter Static Data Allocation]
**Learning:** Hardcoded data structures (like a List of Maps for UI categories) inside the 'build' method cause redundant heap allocations and garbage collection pressure on every widget rebuild.
**Action:** Move static data to 'static const' class members to ensure they are allocated once at compile-time/startup.
