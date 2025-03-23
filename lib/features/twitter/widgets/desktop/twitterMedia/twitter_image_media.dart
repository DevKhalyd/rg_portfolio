import 'package:flutter/material.dart';

const borderValue = 16.0;

/// According to this positons the padding will be added to the image
enum TwitterImagePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  centerTop,
  centerBottom,
}
const _url =
    'https://pbs.twimg.com/media/FO8tG7TXwAsC5wT?format=jpg&name=large';

const _paddingSpace = 2.0;

class TwitterImageMedia extends StatelessWidget {
  const TwitterImageMedia({
    super.key,
    this.position = TwitterImagePosition.centerTop,
  });

  final TwitterImagePosition position;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding;
    var borderRadius = const BorderRadius.only();

    const radius = Radius.circular(_paddingSpace + 8.0);

    switch (position) {
      case TwitterImagePosition.topLeft:
        padding =
            const EdgeInsets.only(right: _paddingSpace, bottom: _paddingSpace);
        borderRadius = const BorderRadius.only(topLeft: radius);
        break;
      case TwitterImagePosition.topRight:
        padding =
            const EdgeInsets.only(left: _paddingSpace, bottom: _paddingSpace);
        borderRadius = const BorderRadius.only(topRight: radius);
        break;
      case TwitterImagePosition.bottomLeft:
        padding =
            const EdgeInsets.only(right: _paddingSpace, top: _paddingSpace);
        borderRadius = const BorderRadius.only(bottomLeft: radius);
        break;
      case TwitterImagePosition.bottomRight:
        padding =
            const EdgeInsets.only(left: _paddingSpace, top: _paddingSpace);
        borderRadius = const BorderRadius.only(bottomRight: radius);
        break;
      case TwitterImagePosition.centerTop:
        padding = const EdgeInsets.only(
          bottom: _paddingSpace,
          left: _paddingSpace,
          right: _paddingSpace,
        );
        break;
      case TwitterImagePosition.centerBottom:
        padding = const EdgeInsets.only(
          top: _paddingSpace,
          left: _paddingSpace,
          right: _paddingSpace,
        );
    }

    return Expanded(
        child: Padding(
      padding: padding,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderValue),
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            _url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
