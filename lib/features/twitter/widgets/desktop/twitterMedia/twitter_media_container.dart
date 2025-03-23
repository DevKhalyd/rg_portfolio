import 'package:flutter/material.dart';
import 'twitter_image_media.dart';

/// The container for the media images
class TwitterMediaContainer extends StatelessWidget {
  const TwitterMediaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: 600,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderValue),
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
          Expanded(
              child: Row(
            children: const [
              TwitterImageMedia(position: TwitterImagePosition.bottomLeft),
              TwitterImageMedia(
                position: TwitterImagePosition.centerBottom,
              ),
              TwitterImageMedia(position: TwitterImagePosition.bottomRight),
            ],
          ))
        ],
      ),
    );
  }
}
