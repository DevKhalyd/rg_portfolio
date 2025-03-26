import 'package:flutter/material.dart';

import '../widgets/body/body_searcher.dart';
import '../widgets/footer/footer_searcher.dart';
import '../widgets/header/header_searcher.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderSearcher(initialSearch: query),
          BodySearcher(),
          FooterSearcher(),
        ],
      ),
    );
  }
}
