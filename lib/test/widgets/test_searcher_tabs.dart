import 'package:flutter/material.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/searcher_tabs/searcher_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: TestSearcherTabs(),
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
