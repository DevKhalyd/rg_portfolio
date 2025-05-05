import 'package:flutter/material.dart';

class TicTacToeGameScreen extends StatelessWidget {
  const TicTacToeGameScreen({super.key, required this.gameID});

  final String gameID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game ID: $gameID')),
      body: Center(child: Text('Hey there! This is the game screen.')),
    );
  }
}
