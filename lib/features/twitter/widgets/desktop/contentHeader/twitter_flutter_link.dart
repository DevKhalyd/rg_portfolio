import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/widgets/widgets.dart';

import '../../../../home/presentation/widgets/shared/selectable_word.dart';

class TwitterFlutterLink extends StatelessWidget {
  const TwitterFlutterLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.link),
        const SizedBox(width: 2.0),
        SelectableWord(
          label: 'flutter.dev',
          color: Colors.blue,
          fontSize: 18,
          onPressed: () {},
        )
      ],
    );
  }
}

class _TwitterLink extends StatefulWidget {
  const _TwitterLink({Key? key}) : super(key: key);

  @override
  State<_TwitterLink> createState() => _TwitterLinkState();
}

class _TwitterLinkState extends State<_TwitterLink> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: const TextCustom(
        'flutter.dev',
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
