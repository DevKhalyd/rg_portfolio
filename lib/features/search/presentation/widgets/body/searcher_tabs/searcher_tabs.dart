import 'package:flutter/material.dart';

/// The tabs to selected in the search page.
class SearcherTabs extends StatelessWidget {
  const SearcherTabs({
    Key? key,
    required this.pages,
    required this.titles,
  })  : assert(pages.length == titles.length),
        super(key: key);

  final List<Widget> pages;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    // TODO: Create the tabs.
    // TODO: Use PageView.builder.
    return Container();
  }
}
