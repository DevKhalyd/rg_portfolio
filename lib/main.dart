import 'package:flutter/material.dart';

import 'core/routes.dart';
import 'core/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),*/
      debugShowCheckedModeBanner: false,
      title: Utils.appName,
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }
}
