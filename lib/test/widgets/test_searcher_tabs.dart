import 'package:flutter/material.dart';
import 'package:rg_portfolio/features/search/domain/models/searcher_tab_model.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/searcher_tabs/searcher_tabs.dart';

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

final tabs = <SearcherTabModel>[
  SearcherTabModel(
      label: 'Search',
      icon: Icons.search,
      fragment: Container(
        color: Colors.red,
      )),
  SearcherTabModel(
      label: 'Hello',
      icon: Icons.access_alarm,
      fragment: Container(
        color: Colors.green,
      )),
  SearcherTabModel(
      label: 'There',
      icon: Icons.access_alarms_outlined,
      fragment: Container(
        color: Colors.yellow,
      )),
];

class TestSearcherTabs extends StatelessWidget {
  const TestSearcherTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearcherTabs(
      tabs: tabs,
    );
  }
}
