import 'package:flutter/material.dart';

import '../widgets/body/body_searcher.dart';
import '../widgets/footer/footer_searcher.dart';
import '../widgets/header/header_searcher.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        HeaderSearcher(),
        BodySearcher(),
        FooterSearcher(),
      ],
    ));
  }
}
