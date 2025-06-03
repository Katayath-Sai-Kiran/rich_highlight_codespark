

<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/rich_highlight_text_codespark/main/assets/banners/banner.png" alt="Banner"/>

# ✨ rich_highlight_text_codespark

[![Pub Version](https://img.shields.io/pub/v/rich_highlight_text_codespark)](https://pub.dev/packages/rich_highlight_text_codespark)  
[![GitHub](https://img.shields.io/badge/GitHub-Katayath--Sai--Kiran%2Frich__highlight__text-blue?logo=github)](https://github.com/Katayath-Sai-Kiran/rich_highlight_text_codespark)

Highlight specific substrings within your Flutter `Text` widgets effortlessly. Whether it's a single word or multiple phrases, `rich_highlight_text_codespark` provides a seamless way to emphasize parts of your text with customizable styles.

> 🎯 Fully **null-safe** and optimized for performance.

## 🚀 Features

- ✅ Highlight single or multiple substrings
- ✅ Support for case-sensitive and case-insensitive matching
- ✅ Highlight modes: first occurrence, last occurrence, or all occurrences
- ✅ Handles overlapping and adjacent matches gracefully
- ✅ Customizable highlight styles
- ✅ Seamless integration with existing `Text` widgets

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  rich_highlight_text: ^1.0.0
````

Then, run:

```bash
flutter pub get
```

## 🧪 Usage

### 🔍 Highlight a Single Substring

```dart
import 'package:flutter/material.dart';
import 'package:rich_highlight_text/rich_highlight_text.dart';

Text(
  'Welcome to Flutter!',
  style: TextStyle(fontSize: 18),
).highlight(
  'Flutter',
  highlightStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
);
```

### ✨ Highlight Multiple Substrings

```dart
Text(
  'Flutter makes development faster and easier.',
  style: TextStyle(fontSize: 18),
).highlightMultiple(
  ['Flutter', 'faster', 'easier'],
  highlightStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
);
```

### 🎯 Highlight Modes

* **HighlightMode.all**: Highlights all occurrences (default)
* **HighlightMode.first**: Highlights only the first occurrence
* **HighlightMode.last**: Highlights only the last occurrence

```dart
Text(
  'Flutter is awesome. Flutter is fast.',
  style: TextStyle(fontSize: 18),
).highlight(
  'Flutter',
  highlightStyle: TextStyle(color: Colors.red),
  highlightMode: HighlightMode.first,
);
```

## 📸 Preview

<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/rich_highlight_text_codespark/main/assets/screenshots/300X650-01.png" alt="Highlight Example 1" width="300"/>


## 🛠️ API Reference

### `highlight`

```dart
Text highlight(
  String highlightText, {
  TextStyle? highlightStyle,
  bool caseSensitive = true,
  HighlightMode highlightMode = HighlightMode.all,
  // Additional Text parameters...
});
```

### `highlightMultiple`

```dart
Text highlightMultiple(
  List<String> highlightTexts, {
  TextStyle? highlightStyle,
  bool caseSensitive = true,
  HighlightMode highlightMode = HighlightMode.all,
  // Additional Text parameters...
});
```

## 📈 Roadmap

* [x] Highlight single substring
* [x] Highlight multiple substrings
* [x] Support for different highlight modes
* [ ] Support for regular expressions
* [ ] Animation support for highlights
* [ ] Integration with `SelectableText`

## 🌍 Internationalization

✅ Supports **Unicode** and **multilingual characters**.
🌐 Fully compatible with languages like Arabic, Chinese, Hindi, and more.

## 📂 Example

Clone the repository and navigate to the `example/` directory:

```bash
git clone https://github.com/Katayath-Sai-Kiran/rich_highlight_text.git
cd rich_highlight_text/example
flutter run
```

## 🙌 Contributions

Contributions are welcome! Please open issues and submit pull requests for any features, bugs, or enhancements.

## 👨‍💻 Maintainer

Developed with ❤️ by [Katayath Sai Kiran](https://github.com/Katayath-Sai-Kiran)



