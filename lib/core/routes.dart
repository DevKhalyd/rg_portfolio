import 'package:flutter/material.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/search/presentation/screen/search_screen.dart';

abstract class Routes {
  static const initialRoute = home;

  /// The first route to show in the screen
  static const home = '/home';
  static const search = '/search';

  static final routes = <String, WidgetBuilder>{
    home: (_) => const HomeScreen(),
    search: (_) => const SearchScreen(),
  };
}
