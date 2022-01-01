import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/utils/utils.dart';

class RolandoImage extends StatelessWidget {
  const RolandoImage({
    Key? key,
    this.maxRadius = 25,
    this.minRadius = 15,
  }) : super(key: key);

  final double maxRadius, minRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: minRadius,
      maxRadius: maxRadius,
      foregroundImage: const AssetImage(Utils.tempImage),
      backgroundColor: Colors.black,
    );
  }
}
