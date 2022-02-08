import 'package:flutter/material.dart';

// Ref: https://stackoverflow.com/questions/52982113/how-to-give-gradient-for-bottom-navigation-bar-icons-in-flutter

class SearcherTab extends StatelessWidget {
  const SearcherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 0.5,
          colors: <Color>[Colors.green, Colors.blue, Colors.red, Colors.yellow],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: const Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
