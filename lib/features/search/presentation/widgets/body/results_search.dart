import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/core/providers/providers.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/search/presentation/riverpod/search_providers.dart';

import '../../../../../core/widgets/text_custom.dart';
import '../../mixins/searcher_mixin.dart';

/// The results of the search to show in the screen
class ResultsSearch extends ConsumerWidget with SearcherMixin {
  const ResultsSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchableItems = ref.read(searchableItemsProvider);
    final searchQuery = ref.read(searchQueryProvider);
    final results = getResults(searchableItems, searchQuery);
    return ListView(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: isEnoughSpace(context) ? 0 : side),
          child: TextCustom(
            getMessage(results.length),
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 30),
        // TODO: If there are no results, show a message
        ...results,
      ],
    );
  }

  List<Widget> getResults(List<SearchItem> searchableItems, String query) {
    final results = <Widget>[];

    if (query.isEmpty) {
      return results;
    }

    // TODO: What about implementing binary search? When the list grows, it will be more efficient
    for (var element in searchableItems) {
      if (element.label.toLowerCase().contains(query.toLowerCase())) {
        results.addAll(element.results);
        break;
      }
    }
    return results;
  }

  // Error: this is method is called each time the window has a resize
  String getMessage(int results) {
    return 'About $results results (0.${getTimeInSeconds()} seconds)';
  }
}
