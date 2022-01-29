import 'package:flutter/material.dart';

import '../features/search/presentation/widgets/body/searcher_link_item.dart';

void main() => runApp(const TestSearchItem());

class TestSearchItem extends StatelessWidget {
  const TestSearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 200,
                color: Colors.white,
                child: SearchLinkItem(
                  onTap: () {},
                  url: 'www.example.com',
                  title: 'Example',
                  description:
                      'Description of the example. Add a long description.',
                ),
              ),
              SearchLinkItem(
                wasSelected: true,
                topicList: const ['about', 'Hello'],
                onTap: () {},
                url: 'www.example.com',
                title: 'An overview aboyt my self skills and interest',
                description:
                    'HTML, CSS, JavaScript, React, GraphQL, Gatsby, Python, Open Source, Hugo, Documentation, UI Design, UX Research, Inkscape..',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example
// https://gfolio.enjeck.com/works
