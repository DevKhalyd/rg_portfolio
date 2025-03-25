import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/home/presentation/riverpod/providers.dart';

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
          bottom: context.getPercentHeight(0.01),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const _WebsiteTotalViews(),
            const SizedBox(width: 4.0),
            SelectableWord(
              onPressed: () {
                // Update the list of search
                final homeRepository = context.read<HomeBloc>().homeRepository;
                homeRepository.updateSearchItem(homeRepository.searchItems[1]);
                context.pushNamed(Routes.search);
              },
              label: 'Portfolio',
            ),
            IconMenu(
              onPressed: () {
                if (context.isMobileSize) {
                  showDialog(
                    context: context,
                    builder: (_) => const Dialog(child: MenuOptions()),
                  );
                  return;
                }
                context.read<HomeBloc>().add(
                  const HomeTogglePressed(menu: MenuOptions()),
                );
              },
            ),
            ProfileIcon(
              onPressed: () {
                if (context.isMobileSize) {
                  showDialog(
                    context: context,
                    builder: (_) => const Dialog(child: MenuAboutMe()),
                  );
                  return;
                }
                context.read<HomeBloc>().add(
                  const HomeTogglePressed(menu: MenuAboutMe()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _WebsiteTotalViews extends ConsumerWidget {
  const _WebsiteTotalViews();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> views = ref.watch(getTotalViewsProvider);

    return Center(
      /// Since network-requests are asynchronous and can fail, we need to
      /// handle both error and loading states. We can use pattern matching for this.
      /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
      child: switch (views) {
        /* 
          - Dart 3 allows pattern matching to extract named fields directly inside a switch
          - The : syntax exposes class properties in a more concise way.
          - This works for any class with named parameters, not just AsyncData

          Note: Patterns are similar to Records.

          Patterns: https://dart.dev/language/patterns, https://dart.dev/language/patterns#destructuring-class-instances 
          Records: https://dart.dev/language/records
        */
        AsyncData(:final value) => Row(
          children: [
            Text(value.toString()),
            const SizedBox(width: 8.0),
            const Icon(Icons.visibility),
            const SizedBox(width: 6.0),
          ],
        ),
        AsyncError() => const SizedBox(),
        _ => const SizedBox(),
      },
    );
  }
}
