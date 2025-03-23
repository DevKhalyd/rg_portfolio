import 'package:flutter/material.dart';

/// The icon that is shown in each tab
class SearcherIconTab extends StatelessWidget {
  const SearcherIconTab({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onHover,
  });

  final IconData icon;
  final bool isSelected, onHover;

  @override
  Widget build(BuildContext context) {
    final listOnHover = [Colors.blueAccent, Colors.blueAccent];
    final listOnUnselected = [Colors.grey, Colors.grey];

    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.topLeft,
            radius: 0.5,
            colors: isSelected
                ? [Colors.green, Colors.blue, Colors.red, Colors.yellow]
                : onHover
                    ? listOnHover
                    : listOnUnselected,
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ));
  }
}
