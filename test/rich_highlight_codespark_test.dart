import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rich_highlight_text_codespark/rich_highlight_text_codespark.dart';

void main() {
  testWidgets('Text.highlight highlights the substring correctly',
      (WidgetTester tester) async {
    const testText = 'Hello, Sai Kiran! Welcome to Flutter.';
    const highlightString = 'Kiran';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              testText,
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ).highlight(
              highlightString,
              highlightStyle:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );

    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsOneWidget);

    final richTextWidget = tester.widget<RichText>(richTextFinder);
    final textSpan = richTextWidget.text as TextSpan;

    expect(textSpan.children, isNotNull);
    expect(textSpan.children!.length, greaterThan(1));

    final highlightedSpan = textSpan.children!.cast<TextSpan?>().firstWhere(
          (span) =>
              span != null &&
              span.text == highlightString &&
              span.style?.color == Colors.red &&
              span.style?.fontWeight == FontWeight.bold,
          orElse: () => TextSpan(text: ''),
        );
    expect(highlightedSpan, isNotNull);
  });
}
