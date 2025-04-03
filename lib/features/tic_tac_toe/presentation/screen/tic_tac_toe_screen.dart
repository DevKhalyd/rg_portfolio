import 'package:flutter/material.dart';

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Go to Tic Tac Toe'),
        ),
      ),
    );
  }
}
