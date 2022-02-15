import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../home/presentation/bloc/home_bloc.dart';
import '../../../../domain/models/searcher_tab_model.dart';
import '../../../mixins/searcher_mixin.dart';
import 'searcher_tab.dart';

/// The tabs to selected in the search page.
class SearcherTabs extends StatefulWidget {
  const SearcherTabs({Key? key, required this.tabs})
      : assert(tabs.length > 1),
        super(key: key);

  final List<SearcherTabModel> tabs;

  @override
  State<SearcherTabs> createState() => _SearcherTabsState();
}

class _SearcherTabsState extends State<SearcherTabs> with SearcherMixin {
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
    final notSpace = !isEnoughSpace(context);

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        /// Set to the first tab
        if (state is HomeSearch) updateState(tabs.first);
      },
      child: Column(
        children: [
          if (notSpace) const SizedBox(height: 20),
          SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment:
                  notSpace ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: tabs
                  .map((e) => SearcherTab(
                        label: e.label,
                        icon: e.icon,
                        isSelected: e.label == currentItem,
                        onPressed: () => updateState(e),
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
      ),
    );
  }

  // NOTE: For this method may I can use Cubit for the logic (Take a look)
  updateState(SearcherTabModel e) {
    if (currentItem == e.label) return;
    setState(() => currentItem = e.label);
    controller.animateToPage(
      tabs.indexOf(e),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
