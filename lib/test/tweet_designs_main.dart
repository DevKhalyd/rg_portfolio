import 'package:flutter/material.dart';

import '../features/twitter/widgets/desktop/twitterMedia/twitter_media_container.dart';

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
        backgroundColor: Colors.white,
        body: Center(
          child: TwitterMediaContainer(),
        ),
      ),
    );
  }
}
