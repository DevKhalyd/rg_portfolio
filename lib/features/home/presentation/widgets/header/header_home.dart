import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/home/presentation/riverpod/home_providers.dart';
import 'package:rg_portfolio/features/home/presentation/riverpod/menu_provider.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/menus/menu_profile.dart';
import '../../../../../core/menus/menu_social_media.dart';
import '../../../../../core/routes.dart';
import '../../../../../core/widgets/profile_icon.dart';
import '../../../../../core/widgets/selectable_word.dart';
import 'icon_menu.dart';

/// The header of the home page
///
/// Contains:
///
/// - The total views of the website
/// - A selectable word that navigates to the portfolio page
/// - A menu icon that opens the menu for social media
/// - A profile icon that opens the profile menu
class HeaderHome extends ConsumerWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
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
              context.pushNamed(Routes.search);
            },
            label: 'Portfolio',
          ),
          IconMenu(
            onPressed: () {
              if (context.isMobileSize) {
                showDialog(
                  context: context,
                  builder: (_) => const Dialog(child: MenuSocialMedia()),
                );
                return;
              }
              ref.read(menuProvider.notifier).toggle(MenuState.socialMedia);
            },
          ),
          ProfileIcon(
            onPressed: () {
              if (context.isMobileSize) {
                showDialog(
                  context: context,
                  builder: (_) => const Dialog(child: MenuProfile()),
                );
                return;
              }
              ref.read(menuProvider.notifier).toggle(MenuState.profile);
            },
          ),
        ],
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
        // The :final value syntax is called Object Patterns https://dart.dev/language/pattern-types#object
        AsyncData(:final value) => Row(
          children: [
            Text(value.toString()),
            const SizedBox(width: 8.0),
            const Icon(Icons.visibility),
            const SizedBox(width: 6.0),
          ],
        ),
        AsyncError() || _ => const SizedBox(),
      },
    );
  }
}
