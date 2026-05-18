## 2024-05-18 - Tool output truncation with Arabic text
**Learning:** In Flutter files containing significant amounts of Arabic text (or other non-ASCII characters), the escaped character representations in tool outputs significantly increase the character count per line. This causes standard `read_file` or `sed` calls to truncate much earlier than expected (often after only 20-30 lines).
**Action:** Use smaller, non-overlapping line ranges (e.g., 5-10 lines) when reading files with localized content to ensure full visibility of the code and correct line numbers.
