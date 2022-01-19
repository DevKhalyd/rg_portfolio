import 'package:flutter/material.dart';

import '../core/widgets/text_custom.dart';

void main() => runApp(const TestSearchItem());

class TestSearchItem extends StatelessWidget {
  const TestSearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 200,
            color: Colors.white,
            child: const SearchLinkItem(
              url: 'www.example.com',
              topic: 'About Example',
              title: 'Example',
              description:
                  'Description of the example. Add a long description.',
            ),
          ),
        ),
      ),
    );
  }
}

// Example
// https://gfolio.enjeck.com/works

/// The item that appears when a result is selected.
class SearchLinkItem extends StatelessWidget {
  const SearchLinkItem(
      {Key? key,
      required this.url,
      required this.title,
      required this.description,
      this.topic,
      this.onTap})
      : super(key: key);

  final String url;

  /// Topic to show next the url
  final String? topic;
  final String title;
  final String description;

  // TODO: Add a list of tags <string>

  /// When the link is pressed
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextCustom(
              url,
              color: Colors.grey,
            ),
            const SizedBox(width: 6.0),
            if (topic != null)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 7,
              ),
            const SizedBox(width: 6.0),
            if (topic != null)
              TextCustom(
                topic!,
                color: Colors.grey,
              ),
          ],
        ),
        const SizedBox(height: 10.0),
        // Add the underline text
        TextCustom(
          title,
          color: Colors.blue,
          fontSize: 20,
        ),
        const SizedBox(height: 10.0),
        TextCustom(
          description,
          color: Colors.grey,
        ),
      ],
    );
  }
}
