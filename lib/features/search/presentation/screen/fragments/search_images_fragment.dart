import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';
import 'package:rg_portfolio/features/search/presentation/mixins/searcher_mixin.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/image_project.dart';

// Example: https://gfolio.enjeck.com/images

/*
What to show?
  - My website
  - https://github.com/DevKhalyd/rgProjects
  - Twitter Design
 */
class SearchImagesFragment extends StatelessWidget with SearcherMixin {
  const SearchImagesFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO:Fill in with my own data

    final width = context.width;

    final crossAxisCount = width ~/ (widthImageProject + 50);

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: 20,
        itemBuilder: (_, __) {
          return const ImageProject.test();
        });
  }
}
