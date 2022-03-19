import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
    this.data, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.decoration,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
  }) : super(key: key);

  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
