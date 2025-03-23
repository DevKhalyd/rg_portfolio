import 'package:flutter/material.dart';

class TextCenter extends StatelessWidget {
  const TextCenter(this.data, {super.key, this.style});

  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(data, style: style),
    );
  }
}
