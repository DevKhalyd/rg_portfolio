import 'package:flutter/material.dart';

import '../widgets/body/body_home.dart';
import '../widgets/footer/footer_home.dart';
import '../widgets/header/header_home.dart';

// Note: I should migrate component by component from the smallest to the largest
// and understand how the providers works for riverpod

/// The main page of my portfolio
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          // In progress to migrate to riverpod
          HeaderHome(),
          BodyHome(),
          // Footer Migration finished
          FooterHome(),
        ],
      ),
    );
  }
}
