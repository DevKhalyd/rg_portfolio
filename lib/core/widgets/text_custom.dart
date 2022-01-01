import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
    this.data, {
    Key? key,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
