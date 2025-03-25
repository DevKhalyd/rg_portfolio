import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/menus/menu_about_me.dart';
import '../../../../../core/menus/menu_options.dart';
import '../../../../../core/routes.dart';
import '../../../../../core/widgets/profile_icon.dart';
import '../../bloc/home_bloc.dart';
import '../shared/selectable_word.dart';
import 'icon_menu.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(
            top: context.getPercentHeight(0.01),
            bottom: context.getPercentHeight(0.01)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // TODO: Start migrating this widget
            const _WebsiteTotalViews(),
            const SizedBox(width: 4.0),
            SelectableWord(
                onPressed: () {
                  // Update the list of search
                  final homeRepository = context.read<HomeBloc>().homeRepository;
                  homeRepository.updateSearchItem(homeRepository.searchItems[1]);
                  context.pushNamed(Routes.search);
                },
                label: 'Portfolio'),
            IconMenu(
              onPressed: () {
                if (context.isMobileSize) {
                  showDialog(
                    context: context,
                    builder: (_) => const Dialog(
                      child: MenuOptions(),
                    ),
                  );
                  return;
                }
                context
                    .read<HomeBloc>()
                    .add(const HomeTogglePressed(menu: MenuOptions()));
              },
            ),
            ProfileIcon(
              onPressed: () {
                if (context.isMobileSize) {
                  showDialog(
                    context: context,
                    builder: (_) => const Dialog(
                      child: MenuAboutMe(),
                    ),
                  );
                  return;
                }
                context
                    .read<HomeBloc>()
                    .add(const HomeTogglePressed(menu: MenuAboutMe()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class _WebsiteTotalViews extends StatelessWidget {
  const _WebsiteTotalViews();

  @override
  Widget build(BuildContext context) {
    // Continue here: https://riverpod.dev/docs/essentials/first_request

    // 1. Create a provider for the HomeRepository
    final homeBloc = context.read<HomeBloc>().homeRepository;

    // 2. Create a FutureProvider to read provider and get the total views
    return FutureBuilder<int>(
      future: homeBloc.getTotalViews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;

          return Row(
            children: [
              Text(data.toString()),
              const SizedBox(width: 8.0),
              const Icon(Icons.visibility),
              const SizedBox(width: 6.0),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
