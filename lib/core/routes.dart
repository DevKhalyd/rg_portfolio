import 'package:flutter/material.dart';

import '../features/home/presentation/screens/home_screen.dart';

abstract class Routes {
  /// The first route to show in the screen
  static const String home = '/';

  static final routes = <String, WidgetBuilder>{
    home: (context) => const HomeScreen(),
  };
}

test() {
  // Basically I can put how to show the dialog... if its a stack or a simple dialog
  //showDialog(context: context, builder: builder);
}
