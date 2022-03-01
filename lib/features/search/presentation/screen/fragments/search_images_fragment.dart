import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';
import 'package:rg_portfolio/core/utils/utils.dart';
import 'package:rg_portfolio/features/search/presentation/mixins/searcher_mixin.dart';
import 'package:rg_portfolio/features/search/presentation/mixins/side_projects_mixin.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/image_project.dart';

// Example: https://gfolio.enjeck.com/images

/*
What to show?
  - My website
  - https://github.com/DevKhalyd/rgProjects
  - Twitter Design
 */
class SearchImagesFragment extends StatelessWidget
    with SearcherMixin, SideProjectsMixin {
  const SearchImagesFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width;

    final crossAxisCount = width ~/ (widthImageProject + 50);

    final items = getProjects();

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: items.length,
        itemBuilder: (_, i) {
          final item = items[i];
          return ImageProject(
            title: item.title,
            subtitle: item.subtitle,
            url: item.imageUrl,
            onTap: () => onTapImageProject(item.reference),
          );
        });
  }

  void onTapImageProject(String ref) => Utils.launchURL(ref);
}
