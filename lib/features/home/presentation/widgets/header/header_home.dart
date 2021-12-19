import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(top: context.getPercentHeight(0.01)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SelectableWord(onPressed: () {}, label: 'Portfolio'),
          Tooltip(
              message: 'Menu',
              child: IconMenu(
                onPressed: () {},
              )),
          const Tooltip(
              message: 'Account',
              child: ImageIcon(
                AssetImage(
                  Utils.tempImage,
                ),
                color: Colors.transparent,
              )),
        ],
      ),
    );
  }
}
