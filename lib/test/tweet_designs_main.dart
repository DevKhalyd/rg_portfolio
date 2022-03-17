import 'package:flutter/material.dart';

import '../features/twitter/widgets/desktop/menu_twitter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: MenuTwitter(),
        ),
      ),
    );
  }
}
