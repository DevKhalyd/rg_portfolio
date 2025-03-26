import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/home/presentation/riverpod/home_providers.dart';
import 'package:rg_portfolio/features/home/presentation/widgets/body/menu.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/routes.dart';
import '../../bloc/home_bloc.dart';
import '../shared/rg_name.dart';
import 'search_button.dart';
import 'txt_field_searcher.dart';

class BodyHome extends ConsumerWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flex = context.isMobileSize ? 7 : 8;

    final useScrollView = context.isMobileSize && context.isLandscape;

    // Static components
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
        ),
      ],
    );

    if (useScrollView) child = SingleChildScrollView(child: child);

    // Here it is the logic to show / hide the menu
    return Expanded(
      flex: flex,
      child: Stack(
        children: [
          GestureDetector(
            onTap:
                () => ref
                    .read(menuStateProvider.notifier)
                    .update((_) => MenuState.hide),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ),
          Menu(),
        ],
      ),
    );
  }

  void onRandomResult(BuildContext context) {
    final homeRepository = context.read<HomeBloc>().homeRepository;
    homeRepository.updateSearchItem(homeRepository.getRandomSearchItem());
    context.pushNamed(Routes.search);
  }
}
