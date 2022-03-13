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
    return Padding(
      padding: EdgeInsets.only(
          top: context.getPercentHeight(0.01),
          bottom: context.getPercentHeight(0.01)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const _WebsiteTotalViews(),
          const SizedBox(width: 4.0),
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

class _WebsiteTotalViews extends StatelessWidget {
  const _WebsiteTotalViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>().homeRepository;
    return FutureBuilder<int>(
      future: homeBloc.getTotalViews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;

          return Row(
            children: [
              Text(data.toString()),
              const SizedBox(width: 8.0),
              const Icon(Icons.visibility),
              const SizedBox(width: 6.0),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
