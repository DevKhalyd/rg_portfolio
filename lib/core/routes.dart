import 'package:flutter/material.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/search/presentation/screen/search_screen.dart';
import '../features/twitter/screens/twitter_screen.dart';

abstract class Routes {
  static const initialRoute = home;

  /// The first route to show in the screen
  static const home = '/home';
  static const search = '/search';
  static const twitter = '/twitter';

  static final routes = <String, WidgetBuilder>{
    home: (_) => const HomeScreen(),
    search: (_) => const SearchScreen(),
    twitter: (_) => const TwitterScreen(),
  };
}
