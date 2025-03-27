import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/search/presentation/riverpod/menu_search_provider.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/menu_search_enable.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../domain/models/searcher_tab_model.dart';
import '../../mixins/searcher_mixin.dart';
import 'searcher_tabs/searcher_tabs.dart';

class BodySearcher extends ConsumerWidget with SearcherMixin {
  const BodySearcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flex = context.isMobileSize ? 7 : 8;

    return Expanded(
      flex: flex,
      child:
          isEnoughSpace(context)
              ? Stack(
                children: [
                  GestureDetector(
                    onTap: () => ref.read(menuSearchProvider.notifier).hide(),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const SizedBox(width: 190),
                          Expanded(
                            child: SearcherTabs(
                              tabs: SearcherTabModel.getTabs(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MenuSearchEnable(),
                ],
              )
              : SearcherTabs(tabs: SearcherTabModel.getTabs()),
    );
  }
}
