import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';
import 'package:rg_portfolio/core/menus/menu_profile.dart';
import 'package:rg_portfolio/core/menus/menu_social_media.dart';
import 'package:rg_portfolio/features/search/presentation/riverpod/menu_search_provider.dart';

class MenuSearchEnable extends ConsumerWidget {
  const MenuSearchEnable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuSearchProvider);

    final menu = switch (menuState) {
      MenuSearchState.socialMedia => MenuSocialMedia(),
      MenuSearchState.profile => MenuProfile(),
      _ => SizedBox.shrink(),
    };

    return Positioned(
      top: context.getPercentHeight(0.0005),
      right: context.getPercentWidth(0.015),
      child: menu,
    );
  }
}
