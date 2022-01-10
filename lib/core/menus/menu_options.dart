import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../extensions/build_context_ext.dart';
import '../utils/assets.dart';
import '../utils/utils.dart';
import '../widgets/custom_toast.dart';
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
            color: Colors.white,
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
                      SmartDialog.showToast(
                        '',
                        widget: const CustomToast(
                          'Email copied to clipboard',
                        ),
                        time: const Duration(seconds: 3),
                      );
                      Clipboard.setData(const ClipboardData(text: Utils.email));
                    },
                  ),
                  IconOption(
                    asset: Assets.questionMarkIcon,
                    label: 'Web Questions',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (c) {
                            return AlertDialog(
                              title: const Text('Web State'),
                              content: const Text(
                                  'Each month I launch a new version of my web. Please stay tuned for the next one.'),
                              actions: [
                                ElevatedButton(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.pop(c),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  const IconOption(
                    asset: Assets.downloadIcon,
                    label: 'Download CV',
                    url: 'https://rg-server.herokuapp.com/cv',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
