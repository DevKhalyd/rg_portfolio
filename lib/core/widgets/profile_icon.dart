import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../extensions/build_context_ext.dart';
import '../menus/menu_about_me.dart';
import '../utils/utils.dart';
import 'rolando_image.dart';

/// Show my profile picture and when it's pressed, show the menu
/// with more info about me
class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
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
            // TODO: Update the methods according to each screen
            if (context.isMobileSize) {
              showDialog(
                context: context,
                builder: (_) => const Dialog(
                  child: MenuAboutMe(),
                ),
              );
              return;
            }
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
