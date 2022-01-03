import 'package:flutter/material.dart';

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
      final style = styleName(_colors[counter]);
      return TextSpan(
        text: e,
        style: style,
      );
    }).toList();

    return RichText(
        text: TextSpan(
            text: 'R', style: styleName(_colors[0]), children: widgets));
  }

  TextStyle styleName(Color color) {
    // NOTE: Verify that the fontsize works in diffent screen sizes...
    return TextStyle(
      color: color,
      fontSize: 100,
      fontFamily: Utils.readexProFont,
    );
  }
}
