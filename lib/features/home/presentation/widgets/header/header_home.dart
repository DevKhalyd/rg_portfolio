import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/menus/menu_about_me.dart';
import '../../../../../core/menus/menu_options.dart';
import '../../../../../core/widgets/profile_icon.dart';
import '../../bloc/home_bloc.dart';
import '../shared/selectable_word.dart';
import 'icon_menu.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// Inside of a column
    return Padding(
      padding: EdgeInsets.only(
          top: context.getPercentHeight(0.01),
          bottom: context.getPercentHeight(0.01)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SelectableWord(onPressed: () {}, label: 'Portfolio'),
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
    );
  }
}
