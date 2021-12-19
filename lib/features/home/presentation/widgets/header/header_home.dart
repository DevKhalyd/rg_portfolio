import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/menus/menu_options.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/utils.dart';
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
              showMenu(context, const MenuOptions());
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
            showMenu(context, const MenuOptions());
          },
          child: const CircleAvatar(
            minRadius: 15,
            maxRadius: 25,
            foregroundImage: AssetImage(
              Utils.tempImage,
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}

/// `menu` is the menu that will be shown when the button is pressed
showMenu(BuildContext context, Widget menu) {
  // Render objects Flutter
  // This to avoid to use the Navigator and make the experience better and flow
  final child = Stack(
    alignment: AlignmentDirectional.topEnd,
    children: [
      Positioned(
        top: context.getPercentHeight(0.075),
        right: context.getPercentWidth(0.01),
        child: menu,
      ),
    ],
  );

  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (_) => child,
  );
}
