import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/menus/menu_about_me.dart';
import '../../../../../core/menus/menu_options.dart';
import '../../../../../core/widgets/profile_icon.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../../home/presentation/widgets/body/txt_field_searcher.dart';
import '../../../../home/presentation/widgets/header/icon_menu.dart';
import '../../../../home/presentation/widgets/shared/rg_name.dart';

class HeaderSearcher extends StatelessWidget {
  const HeaderSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    
    final fieldSearcher = TextFieldSearcher(
        initialValue:
            context.read<HomeBloc>().homeRepository.currentSearchItem.label);

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
          ),
        ],
      ),
    );
  }
}
