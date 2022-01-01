import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/build_context_ext.dart';
import '../utils/assets.dart';
import '../utils/utils.dart';
import 'widgets/icon_option.dart';

/// Contains my social media and the email to copy in the clipboard
class MenuOptions extends StatelessWidget {
  const MenuOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (context.width / 2) * .6;

    return Container(
        constraints: const BoxConstraints(
          maxWidth: 520,
          minWidth: 500,
          minHeight: 550,
        ),
        // NOTE: Change according to the theme
        height: context.getPercentHeight(.5),
        width: width,
        decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ]),
        child: Column(
          children: [
            SizedBox(
              height: context.getPercentHeight(.01),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  const IconOption(
                    asset: Assets.linkedinIcon,
                    label: 'LinkedIn',
                    url: Utils.linkedInUrl,
                  ),
                  const IconOption(
                    asset: Assets.githubIcon,
                    label: 'GitHub',
                    url: Utils.githubUrl,
                  ),
                  const IconOption(
                    asset: Assets.stackOverflowIcon,
                    label: 'StackOverlow',
                    url: Utils.stackOverflowUrl,
                  ),
                  const IconOption(
                    asset: Assets.upworkIcon,
                    label: 'Upwork',
                    url: Utils.upworkUrl,
                  ),
                  IconOption(
                    asset: Assets.gmailIcon,
                    label: 'Gmail',
                    onPressed: () {
                      // TODO: Show a message that says: Copy to clipboard (With a check mark)
                      Clipboard.setData(const ClipboardData(text: Utils.email));
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
