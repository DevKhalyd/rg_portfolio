import 'package:flutter/material.dart';

import '../../../../../core/widgets/profile_icon.dart';
import '../../../../home/presentation/widgets/header/icon_menu.dart';

class HeaderSearcher extends StatelessWidget {
  const HeaderSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconMenu(
          onPressed: () {},
        ),
        // TODO: Ask for a pressed button
        const ProfileIcon()
      ],
    );
  }
}
