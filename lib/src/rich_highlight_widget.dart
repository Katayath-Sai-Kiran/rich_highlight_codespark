import 'package:flutter/material.dart';

enum HighlightMode { all, first, last }

extension RichHighlightExtension on Text {
  Text highlight(
    String highlightText, {
    TextStyle? highlightStyle,
    bool caseSensitive = true,
    HighlightMode highlightMode = HighlightMode.all,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    return _highlightInternal(
      [highlightText],
      highlightStyle: highlightStyle,
      caseSensitive: caseSensitive,
      highlightMode: highlightMode,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  Text highlightMultiple(
    List<String> highlightTexts, {
    TextStyle? highlightStyle,
    bool caseSensitive = true,
    HighlightMode highlightMode = HighlightMode.all,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    return _highlightInternal(
      highlightTexts,
      highlightStyle: highlightStyle,
      caseSensitive: caseSensitive,
      highlightMode: highlightMode,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  Text _highlightInternal(
    List<String> highlightTexts, {
    TextStyle? highlightStyle,
    bool caseSensitive = true,
    HighlightMode highlightMode = HighlightMode.all,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    String? semanticsLabel,
    StrutStyle? strutStyle,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    final String? originalText = data;
    if (originalText == null ||
        originalText.isEmpty ||
        highlightTexts.isEmpty ||
        highlightTexts.every((e) => e.isEmpty)) {
      return this;
    }

    final sourceText =
        caseSensitive ? originalText : originalText.toLowerCase();
    final queries = caseSensitive
        ? highlightTexts
        : highlightTexts.map((e) => e.toLowerCase()).toList();

    final List<_Match> matches = [];

    for (final query in queries) {
      if (query.isEmpty) continue;

      switch (highlightMode) {
        case HighlightMode.all:
          int start = 0;
          while (true) {
            final index = sourceText.indexOf(query, start);
            if (index == -1) break;
            matches.add(_Match(index, index + query.length));
            start = index + query.length;
          }
          break;

        case HighlightMode.first:
          final index = sourceText.indexOf(query);
          if (index != -1) {
            matches.add(_Match(index, index + query.length));
          }
          break;

        case HighlightMode.last:
          final index = sourceText.lastIndexOf(query);
          if (index != -1) {
            matches.add(_Match(index, index + query.length));
          }
          break;
      }
    }

    if (matches.isEmpty) return this;

    matches.sort((a, b) => a.start.compareTo(b.start));

    // Merge non-overlapping
    final List<_Match> nonOverlapping = [];
    for (final match in matches) {
      if (nonOverlapping.isEmpty || match.start >= nonOverlapping.last.end) {
        nonOverlapping.add(match);
      }
    }

    final List<TextSpan> spans = [];
    int current = 0;
    for (final match in nonOverlapping) {
      if (match.start > current) {
        spans.add(TextSpan(text: originalText.substring(current, match.start)));
      }
      spans.add(
        TextSpan(
          text: originalText.substring(match.start, match.end),
          style: highlightStyle,
        ),
      );
      current = match.end;
    }

    if (current < originalText.length) {
      spans.add(TextSpan(text: originalText.substring(current)));
    }

    return Text.rich(
      TextSpan(children: spans, style: style),
      key: key,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      strutStyle: strutStyle ?? this.strutStyle,
      textScaler: textScaler ?? this.textScaler,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }
}

class _Match {
  final int start;
  final int end;
  _Match(this.start, this.end);
}
