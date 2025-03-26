import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/text_custom.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../mixins/searcher_mixin.dart';

/// The results of the search to show in the screen
class ResultsSearch extends StatelessWidget with SearcherMixin {
  const ResultsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // final results = repo.currentSearchItem.results;
        return ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: isEnoughSpace(context) ? 0 : side),
              child: TextCustom(
                getMessage(0),
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Text('No results found because bloc is deprecated'),
          ],
        );
      },
    );
  }

  String getMessage(int results) {
    return 'About $results results (0.${getTimeInSeconds()} seconds)';
  }
}
