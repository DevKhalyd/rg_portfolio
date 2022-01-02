import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc.dart';
import '../shared/selectable_word.dart';

const _space = 30.0;

class FooterHome extends StatelessWidget {
  const FooterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = context.read<HomeBloc>().homeRepository;

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
            const Divider(),
            Expanded(
                child: Row(
              children: [
                const SizedBox(width: _space),
                SelectableWord(onPressed: () {}, label: 'About'),
                const Spacer(),
                SelectableWord(onPressed: repo.openLinkedIn, label: 'LinkedIn'),
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
