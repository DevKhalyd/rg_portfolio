import 'package:flutter/material.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/search/presentation/screen/search_screen.dart';

abstract class Routes {
  /// The first route to show in the screen
  static const String home = '/home';
  static const search = '/search';
  
  static final routes = <String, WidgetBuilder>{
    home: (_) => const HomeScreen(),
    search: (_) => const SearchScreen(),
  };
}

test() {
  // Basically I can put how to show the dialog... if its a stack or a simple dialog
  //showDialog(context: context, builder: builder);
}
