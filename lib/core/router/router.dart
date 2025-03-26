import 'package:go_router/go_router.dart';
import 'package:rg_portfolio/core/router/routes.dart';
import 'package:rg_portfolio/features/home/presentation/screens/home_screen.dart';
import 'package:rg_portfolio/features/search/presentation/screen/search_screen.dart';

// TODO: Define the redirection to unkonwn routes

final router = GoRouter(
  initialLocation: initialRoute,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: initialRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: searchRoute,
      builder:
          (context, state) =>
              SearchScreen(query: state.uri.queryParameters['search'] ?? 'No query found'),
    ),
  ],
);
