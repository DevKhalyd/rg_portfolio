import 'package:flutter/material.dart';

import '../../features/search/presentation/widgets/body/searcher_tabs/searcher_tab.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const TestSearcherTabs(),
      ),
    );
  }
}

class TestSearcherTabs extends StatelessWidget {
  const TestSearcherTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SearcherTab(),
    );
  }
}
