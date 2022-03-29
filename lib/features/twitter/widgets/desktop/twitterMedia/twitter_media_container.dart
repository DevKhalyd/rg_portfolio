import 'package:flutter/material.dart';

/// The container for the media images
class TwitterMediaContainer extends StatelessWidget {
  const TwitterMediaContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                TwitterImageMedia(position: TwitterImagePosition.topLeft),
                TwitterImageMedia(),
                TwitterImageMedia(position: TwitterImagePosition.topRight),
              ],
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}

/// According to this positons the padding will be added to the image
enum TwitterImagePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  centerTop,
  centerBottom,
}

const _paddingSpace = 4.0;

class TwitterImageMedia extends StatelessWidget {
  const TwitterImageMedia({
    Key? key,
    this.position = TwitterImagePosition.centerTop,
  }) : super(key: key);

  final TwitterImagePosition position;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding;

    switch (position) {
      case TwitterImagePosition.topLeft:
        padding =
            const EdgeInsets.only(right: _paddingSpace, bottom: _paddingSpace);
        break;
      case TwitterImagePosition.topRight:
        padding =
            const EdgeInsets.only(left: _paddingSpace, bottom: _paddingSpace);
        break;
      case TwitterImagePosition.bottomLeft:
        padding =
            const EdgeInsets.only(right: _paddingSpace, top: _paddingSpace);
        break;
      case TwitterImagePosition.bottomRight:
        padding =
            const EdgeInsets.only(left: _paddingSpace, top: _paddingSpace);
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

    // According to the position add a round corner if needed

    return Expanded(
        child: Padding(
      padding: padding,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.yellow,
        ),
      ),
    ));
  }
}
