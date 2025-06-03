import 'package:flutter/material.dart';
import 'package:rich_highlight_text_codespark/rich_highlight_codespark.dart';

void main() => runApp(const HighlightExampleApp());

class HighlightExampleApp extends StatelessWidget {
  const HighlightExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rich Highlight Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Rich Highlight Example')),
        body: const Center(child: HighlightDemo()),
      ),
    );
  }
}

class HighlightDemo extends StatelessWidget {
  const HighlightDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Hello, Sai Kiran! Welcome to Flutter.' * 9,
        style: const TextStyle(color: Colors.red, fontSize: 18),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ).highlight(
        'Kiran',
        highlightStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
