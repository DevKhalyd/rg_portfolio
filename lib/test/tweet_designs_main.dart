import 'package:flutter/material.dart';

import '../features/twitter/widgets/desktop/contentHeader/twitter_numbers_label.dart';

// TODO: Add the link and the join time

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              TwitterNumbersLabel(label: 'Following', number: '38'),
              SizedBox(width: 8),
              TwitterNumbersLabel(label: 'Followers', number: '178.1k'),
            ],
          ),
        ),
      ),
    );
  }
}
