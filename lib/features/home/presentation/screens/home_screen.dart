import 'package:flutter/material.dart';

import '../widgets/body/body_home.dart';
import '../widgets/header/header_home.dart';

/// The main page of my portfolio
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderHome(),
          const BodyHome(),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
