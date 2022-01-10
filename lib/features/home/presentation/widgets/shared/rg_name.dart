import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';

import '../../../../../core/utils/utils.dart';

final _colors = <Color>[
  Colors.blue,
  Colors.red,
  Colors.yellow[700]!,
  Colors.green,
];

/// My name with the Google Style
class RGName extends StatelessWidget {
  const RGName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final letters = 'olando'.split('');
    int counter = 0;

    final widgets = letters.map((e) {
      counter++;
      if (counter >= _colors.length) counter = 0;
      final style = styleName(_colors[counter], context);
      return TextSpan(
        text: e,
        style: style,
      );
    }).toList();

    return RichText(
        text: TextSpan(
            text: 'R',
            style: styleName(_colors[0], context),
            children: widgets));
  }

  TextStyle styleName(Color color, BuildContext context) {
    final fontSize = context.isMobileSize ? 70.0 : 100.0;

    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: Utils.readexProFont,
    );
  }
}
