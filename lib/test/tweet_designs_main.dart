import 'package:flutter/material.dart';
import 'package:rg_portfolio/features/twitter/widgets/desktop/twitter_icon.dart';


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
          child: TwitterIcon(),
        ),
      ),
    );
  }
}
