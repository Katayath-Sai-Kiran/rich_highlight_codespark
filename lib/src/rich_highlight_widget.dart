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
    final String? originalText = data;
    if (originalText == null) return this;
    if (originalText.isEmpty || highlightText.isEmpty) return this;

    // Prepare text for search based on case sensitivity
    final sourceText =
        caseSensitive ? originalText : originalText.toLowerCase();
    final searchText =
        caseSensitive ? highlightText : highlightText.toLowerCase();

    final List<TextSpan> spans = [];

    switch (highlightMode) {
      case HighlightMode.all:
        {
          int start = 0;
          while (true) {
            final index = sourceText.indexOf(searchText, start);
            if (index < 0) {
              spans.add(TextSpan(text: originalText.substring(start)));
              break;
            }
            if (index > start) {
              spans.add(TextSpan(text: originalText.substring(start, index)));
            }
            spans.add(
              TextSpan(
                text: originalText.substring(
                  index,
                  index + highlightText.length,
                ),
                style: highlightStyle,
              ),
            );
            start = index + highlightText.length;
          }
          break;
        }
      case HighlightMode.first:
        {
          final index = sourceText.indexOf(searchText);
          if (index < 0) {
            spans.add(TextSpan(text: originalText));
          } else {
            if (index > 0) {
              spans.add(TextSpan(text: originalText.substring(0, index)));
            }
            spans.add(
              TextSpan(
                text: originalText.substring(
                  index,
                  index + highlightText.length,
                ),
                style: highlightStyle,
              ),
            );
            if (index + highlightText.length < originalText.length) {
              spans.add(
                TextSpan(
                  text: originalText.substring(index + highlightText.length),
                ),
              );
            }
          }
          break;
        }
      case HighlightMode.last:
        {
          final index = sourceText.lastIndexOf(searchText);
          if (index < 0) {
            spans.add(TextSpan(text: originalText));
          } else {
            if (index > 0) {
              spans.add(TextSpan(text: originalText.substring(0, index)));
            }
            spans.add(
              TextSpan(
                text: originalText.substring(
                  index,
                  index + highlightText.length,
                ),
                style: highlightStyle,
              ),
            );
            if (index + highlightText.length < originalText.length) {
              spans.add(
                TextSpan(
                  text: originalText.substring(index + highlightText.length),
                ),
              );
            }
          }
          break;
        }
      // case HighlightMode.nth:
      //   {
      //     int occurrence = 0;
      //     int startIndex = 0;
      //     int? targetIndex;
      //     while (true) {
      //       final index = sourceText.indexOf(searchText, startIndex);
      //       if (index < 0) break;
      //       occurrence++;
      //       if (occurrence == nth) {
      //         targetIndex = index;
      //         break;
      //       }
      //       startIndex = index + highlightText.length;
      //     }
      //     if (targetIndex == null) {
      //       // nth occurrence not found, return full text without highlights
      //       spans.add(TextSpan(text: originalText));
      //     } else {
      //       if (targetIndex > 0) {
      //         spans.add(TextSpan(text: originalText.substring(0, targetIndex)));
      //       }
      //       spans.add(
      //         TextSpan(
      //           text: originalText.substring(
      //               targetIndex, targetIndex + highlightText.length),
      //           style: highlightStyle,
      //         ),
      //       );
      //       if (targetIndex + highlightText.length < originalText.length) {
      //         spans.add(TextSpan(
      //             text: originalText
      //                 .substring(targetIndex + highlightText.length)));
      //       }
      //     }
      //     break;
      //   }
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
