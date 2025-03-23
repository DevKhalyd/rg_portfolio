import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/utils/utils.dart';
import '../../mixins/searcher_mixin.dart';
import '../../mixins/side_projects_mixin.dart';
import '../../widgets/body/image_project.dart';

// Example: https://gfolio.enjeck.com/images

/*
What to show?
  - My website
  - https://github.com/DevKhalyd/rgProjects
  - Twitter Design
 */
class SearchImagesFragment extends StatelessWidget
    with SearcherMixin, SideProjectsMixin {
  const SearchImagesFragment({super.key});

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
