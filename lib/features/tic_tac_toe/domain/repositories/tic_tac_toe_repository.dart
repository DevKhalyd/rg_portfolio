abstract class TicTacToeRepository {
  /// Creates a new game and returns the game ID.
  ///
  /// The [wsUrl] parameter is the WebSocket URL to connect to the game server.
  Future<String?> createGame(String wsUrl);
}

// Future<void> joinGame(String wsUrl, String gameId);
// Stream<void> getGameStream();
// Future<void> sendMove(dynamic move);