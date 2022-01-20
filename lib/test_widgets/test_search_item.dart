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
      this.topicList,
      this.onTap})
      : super(key: key);

  final String url;
  final List<String>? topicList;
  /// Make the title clickable (Selectable word is the widget key)
  final String title;
  final String description;

  /// When the link is pressed
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (topicList != null) assert(topicList!.length < 3);

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
            if (topicList != null)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 7,
              ),
            if (topicList != null) ...getTopics()
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

  List<Widget> getTopics() {
    final widgets = <Widget>[
      const SizedBox(width: 6.0),
    ];

    final topics = topicList!;

    for (final t in topics) {
      widgets.add(const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 7,
      ));
      widgets.add(
        TextCustom(
          t,
          color: Colors.grey,
        ),
      );
    }

    return widgets;
  }
}
