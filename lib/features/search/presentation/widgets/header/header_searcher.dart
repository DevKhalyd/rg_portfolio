import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/menus/menu_profile.dart';
import '../../../../../core/menus/menu_social_media.dart';
import '../../../../../core/widgets/profile_icon.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../../home/presentation/widgets/body/txt_field_searcher.dart';
import '../../../../home/presentation/widgets/header/icon_menu.dart';
import '../../../../../core/widgets/rg_name.dart';

class HeaderSearcher extends StatelessWidget {
  const HeaderSearcher({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    
    final fieldSearcher = TextFieldSearcher(
        initialValue: 'initialValue for current search in label',);

    if (width < minWidthSearch) {
      return Column(
        children: [
          const SizedBox(height: 20),
          const RGName.forSearch(),
          const SizedBox(height: 10),
          fieldSearcher,
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: context.getPercentHeight(0.015),
        bottom: context.getPercentHeight(0.01),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const RGName.forSearch(),
          const SizedBox(width: 27),
          fieldSearcher,
          const Spacer(),
          IconMenu(
            onPressed: () {
              if (context.isMobileSize) {
                showDialog(
                  context: context,
                  builder: (_) => const Dialog(
                    child: MenuSocialMedia(),
                  ),
                );
                return;
              }
              context
                  .read<HomeBloc>()
                  .add(const HomeTogglePressed(menu: MenuSocialMedia()));
            },
          ),
          ProfileIcon(
            onPressed: () {
              if (context.isMobileSize) {
                showDialog(
                  context: context,
                  builder: (_) => const Dialog(
                    child: MenuProfile(),
                  ),
                );
                return;
              }
              context
                  .read<HomeBloc>()
                  .add(const HomeTogglePressed(menu: MenuProfile()));
            },
          ),
        ],
      ),
    );
  }
}
