import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/routes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/selectable_word.dart';

const _space = 30.0;

class FooterHome extends StatelessWidget {
  const FooterHome({super.key});

  @override
  Widget build(BuildContext context) {
    // If the height is less than 750, then the footer is not shown
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
                children: const [SizedBox(width: _space), Text('Mexico')],
              ),
            ),
            if (shouldShownFooterComplete) const Divider(),
            if (shouldShownFooterComplete)
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: _space),
                    SelectableWord(
                      onPressed: () {
                        context.pushNamed(Routes.search);
                      },
                      label: 'About',
                    ),
                    const Spacer(),
                    SelectableWord(
                      onPressed: () => Utils.launchURL(Utils.linkedInUrl),
                      label: 'LinkedIn',
                    ),
                    const SizedBox(width: _space),
                    SelectableWord(
                      onPressed: () => Utils.launchURL(Utils.githubUrl),
                      label: 'GitHub',
                    ),
                    const SizedBox(width: _space),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
