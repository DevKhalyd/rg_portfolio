import 'package:go_router/go_router.dart';
import 'package:rg_portfolio/core/router/routes.dart';
import 'package:rg_portfolio/features/home/presentation/screens/home_screen.dart';
import 'package:rg_portfolio/features/search/presentation/screen/search_screen.dart';
import 'package:rg_portfolio/features/tic_tac_toe/presentation/screens/tic_tac_toe_game_screen.dart';

import '../../features/tic_tac_toe/presentation/screens/tic_tac_toe_screen.dart';

// TODO: Define the redirection to unkonwn routes

final router = GoRouter(
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: initialRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: searchRoute,
      builder:
          (context, state) =>
              SearchScreen(query: state.uri.queryParameters['q'] ?? ''),
    ),
    GoRoute(
      path: ticTacToeRoute,
      builder: (context, state) => const TicTacToeScreen(),
    ),
    GoRoute(
      path: ticTacToeGameRoute,
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>?;

        return TicTacToeGameScreen(gameID: extras?['gameID'] as String? ?? '');
      },
    ),
  ],
);
