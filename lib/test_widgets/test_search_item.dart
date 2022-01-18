import 'package:flutter/material.dart';

void main() => runApp(const TestSearchItem());

class TestSearchItem extends StatelessWidget {
  const TestSearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

/// The item that appears when a result is selected.
class SearchLinkItem extends StatelessWidget {
  const SearchLinkItem({
    Key? key,
    required this.url,
    required this.title,
    required this.description,
    this.topic,
  }) : super(key: key);

  final String url;

  /// Topic to show next the url
  final String? topic;
  final String title;
  final String description;

  // TODO: Give the design
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(url),
            if (topic != null) Text(topic!),
          ],
        ),
        Text(title),
        Text(description),
      ],
    );
  }
}
