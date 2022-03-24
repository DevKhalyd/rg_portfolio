import 'package:flutter/material.dart';

import '../features/twitter/widgets/desktop/contentHeader/twitter_joined_text.dart';

// TODO: Add the link text
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: TwitterJoinedText(),
        ),
      ),
    );
  }
}
