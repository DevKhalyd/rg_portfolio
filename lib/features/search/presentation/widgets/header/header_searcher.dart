import 'package:flutter/material.dart';
import 'package:rg_portfolio/features/home/presentation/widgets/body/txt_field_searcher.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/widgets/profile_icon.dart';
import '../../../../home/presentation/widgets/header/icon_menu.dart';
import '../../../../home/presentation/widgets/shared/rg_name.dart';

class HeaderSearcher extends StatelessWidget {
  const HeaderSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.getPercentHeight(0.015)),
      child: Row(
        children: [
          SizedBox(width: context.getPercentWidth(0.01)),
          const RGName(
            fontSizeDesktop: 40,
            fontSizeMobile: 40,
          ),
          SizedBox(width: context.getPercentWidth(0.01)),
          const TextFieldSearcher(),
          const Spacer(),
          IconMenu(
            onPressed: () {},
          ),
          ProfileIcon(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
