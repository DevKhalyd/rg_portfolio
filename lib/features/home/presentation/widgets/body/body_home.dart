import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/routes.dart';
import '../../bloc/home_bloc.dart';
import '../shared/rg_name.dart';
import 'search_button.dart';
import 'txt_field_searcher.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flex = context.isMobileSize ? 7 : 8;

    final useScrollView = context.isMobileSize && context.isLandscape;

    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RGName(),
        const SizedBox(height: 30),
        TextFieldSearcher(
          onSelected: (_) => Navigator.of(context).pushNamed(Routes.search),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchButton(
              "Search Website",
              onPressed: () => onRandomResult(context),
            ),
            const SizedBox(width: 30),
            SearchButton(
              "I'm feeling lucky",
              onPressed: () => onRandomResult(context),
            ),
          ],
        )
      ],
    );

    if (useScrollView) child = SingleChildScrollView(child: child);

    return Expanded(
        flex: flex,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => context.read<HomeBloc>().add(HomeInitial()),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
                child: child,
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
              if (state is HomeToggleMenu) {
                return state.isOpen
                    ? Positioned(
                        top: context.getPercentHeight(0.0005),
                        right: context.getPercentWidth(0.015),
                        child: state.menu,
                      )
                    : const SizedBox();
              }

              return const SizedBox();
            }),
          ],
        ));
  }

  void onRandomResult(BuildContext context) {
    final homeRepository = context.read<HomeBloc>().homeRepository;
    homeRepository.updateSearchItem(homeRepository.getRandomSearchItem());
    context.pushNamed(Routes.search);
  }
}
