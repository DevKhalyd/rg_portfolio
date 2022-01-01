import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/menus/menu_about_me.dart';
import '../../../../../core/menus/menu_options.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/widgets.dart';
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
              context
                  .read<HomeBloc>()
                  .add(const HomeTogglePressed(menu: MenuOptions()));
            },
          ),
          const _ProfileIcon()
        ],
      ),
    );
  }
}

/// Show my profile picture and when it's pressed, show the menu
class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: const TextSpan(
          text: 'My account\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: 'Rolando Garcia\n',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: Utils.email,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ]),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getPercentWidth(0.005)),
        child: InkResponse(
          hoverColor: Colors.transparent,
          onTap: () {
            //   showMenu(context, const MenuOptions());
            context
                .read<HomeBloc>()
                .add(const HomeTogglePressed(menu: MenuAboutMe()));
          },
          child: const RolandoImage(),
        ),
      ),
    );
  }
}
