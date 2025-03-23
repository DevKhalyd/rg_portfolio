import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/routes.dart';
import '../../bloc/home_bloc.dart';
import '../shared/selectable_word.dart';

const _space = 30.0;

class FooterHome extends StatelessWidget {
  const FooterHome({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = context.read<HomeBloc>().homeRepository;

    if (context.height <= 750) return const SizedBox.shrink();

    final shouldShownFooterComplete =
        context.getCurrentRouteName() != Routes.search;

    return Expanded(
      child: Container(
        color: const Color.fromRGBO(242, 242, 242, 1.0),
        child: Column(
          children: [
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: _space),
                Text('Mexico'),
              ],
            )),
            if (shouldShownFooterComplete) const Divider(),
            if (shouldShownFooterComplete)
              Expanded(
                  child: Row(
                children: [
                  const SizedBox(width: _space),
                  SelectableWord(
                      onPressed: () {
                        final homeRepository =
                            context.read<HomeBloc>().homeRepository;
                        // The about part
                        homeRepository
                            .updateSearchItem(homeRepository.searchItems[0]);
                        context.pushNamed(Routes.search);
                      },
                      label: 'About'),
                  const Spacer(),
                  SelectableWord(
                      onPressed: repo.openLinkedIn, label: 'LinkedIn'),
                  const SizedBox(width: _space),
                  SelectableWord(onPressed: repo.openGitHub, label: 'GitHub'),
                  const SizedBox(width: _space),
                ],
              )),
          ],
        ),
      ),
    );
  }
}
