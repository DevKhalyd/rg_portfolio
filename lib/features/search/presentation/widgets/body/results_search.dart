import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_bloc.dart';

/// The results of the search to show in the screen
class ResultsSearch extends StatelessWidget {
  const ResultsSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = context.read<HomeBloc>().homeRepository;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final results = repo.currentSearchItem.results;
        return ListView(
          children: [
            const SizedBox(height: 40),
            ...results,
          ],
        );
      },
    );
  }
}
