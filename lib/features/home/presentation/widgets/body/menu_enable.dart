import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';
import 'package:rg_portfolio/core/menus/menu_profile.dart';
import 'package:rg_portfolio/core/menus/menu_social_media.dart';
import 'package:rg_portfolio/features/home/presentation/riverpod/menu_provider.dart';

/// A widget that enables the space for the different menus
class MenuEnable extends ConsumerWidget {
  const MenuEnable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuProvider);

    final menu = switch (menuState) {
      MenuState.socialMedia => MenuSocialMedia(),
      MenuState.profile => MenuProfile(),
      _ => SizedBox.shrink(),
    };

    return Positioned(
      top: context.getPercentHeight(0.0005),
      right: context.getPercentWidth(0.015),
      child: menu,
    );
  }
}
