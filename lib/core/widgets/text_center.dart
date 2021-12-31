import 'package:flutter/material.dart';

class TextCenter extends StatelessWidget {
  const TextCenter(this.data, {Key? key, this.style}) : super(key: key);

  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(data, style: style),
    );
  }
}
