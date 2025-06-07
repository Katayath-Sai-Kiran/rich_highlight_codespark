# Changelog

All notable changes to this project will be documented in this file.

## [0.0.2] - 2025-06-07

- `.toRichText()` extension on `String` to generate interactive highlighted `RichText` easily.
- `onTap` support on highlighted substrings via `TapGestureRecognizer` returns a string.


## [0.0.1] - 2025-06-03

🎉 Initial release of `rich_highlight_text_codespark`!

### ✨ Features
- Added `.highlight()` extension to `Text` for highlighting a single substring.
- Added `.highlightMultiple()` extension to `Text` for multiple substrings.
- Support for:
  - Case-sensitive and case-insensitive matching.
  - Highlighting first, last, or all occurrences (`HighlightMode` enum).
  - Fully customizable `TextStyle` for highlighted parts.
- Handles overlapping and adjacent highlights gracefully.
- Unicode-safe: works with international characters and emojis.
- Designed to integrate seamlessly with existing `Text` widgets.


