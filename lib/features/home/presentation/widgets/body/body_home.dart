import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rg_portfolio/features/home/presentation/riverpod/menu_provider.dart';
import 'package:rg_portfolio/features/home/presentation/widgets/body/menu_enable.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/widgets/rg_name.dart';
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
          onSelected: (item) {
            context.go('/search?q=${item.label}');
          },
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Read the input and search the website
            SearchButton("Search Website", onPressed: null),
            const SizedBox(width: 30),
            // TODO: Generate a random search item
            SearchButton("I'm feeling lucky", onPressed: null),
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
          // It seems the GestureDetector sometimes works and sometimes doesn't
          // I'm not sure why, but I think it's because of the compilation, let finish with the other task first
          GestureDetector(
            onTap: () => ref.read(menuProvider.notifier).hide(),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ),
          MenuEnable(),
        ],
      ),
    );
  }
}
