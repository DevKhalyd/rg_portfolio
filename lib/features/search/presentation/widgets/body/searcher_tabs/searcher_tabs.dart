import 'package:flutter/material.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/searcher_tabs/searcher_tab.dart';

import '../../../../domain/models/searcher_tab_model.dart';

/// The tabs to selected in the search page.
class SearcherTabs extends StatefulWidget {
  const SearcherTabs({Key? key, required this.tabs})
      : assert(tabs.length > 1),
        super(key: key);

  final List<SearcherTabModel> tabs;

  @override
  State<SearcherTabs> createState() => _SearcherTabsState();
}

class _SearcherTabsState extends State<SearcherTabs> {
  final PageController controller = PageController();
  late final List<SearcherTabModel> tabs;
  late String currentItem;

  @override
  void initState() {
    super.initState();
    tabs = widget.tabs;
    currentItem = tabs.first.label;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: tabs
                .map((e) => SearcherTab(
                      label: e.label,
                      icon: e.icon,
                      isSelected: e.label == currentItem,
                      onPressed: () {
                        if (currentItem == e.label) return;

                        setState(() => currentItem = e.label);

                        controller.animateToPage(
                          tabs.indexOf(e),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: tabs.length,
            itemBuilder: (_, i) {
              return tabs[i].fragment;
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
