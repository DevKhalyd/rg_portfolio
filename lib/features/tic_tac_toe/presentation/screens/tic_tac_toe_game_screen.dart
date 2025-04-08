import 'package:flutter/material.dart';

class TicTacToeGameScreen extends StatelessWidget {
  const TicTacToeGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe Game')),
      body: Center(child: Text('Hey there! This is the game screen.')),
    );
  }
}
