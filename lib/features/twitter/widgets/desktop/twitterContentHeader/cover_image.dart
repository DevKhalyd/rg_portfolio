import 'package:flutter/material.dart';

import '../../../../../core/utils/local_images.dart';

/// The main image from the profile
class CoverImage extends StatelessWidget {
  const CoverImage({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      LocalImages.flutterCover,
      height: height,
      width: width,
    );
  }
}
