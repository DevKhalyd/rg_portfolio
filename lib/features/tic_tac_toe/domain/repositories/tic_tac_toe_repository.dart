abstract class TicTacToeRepository {
  /// Initializes the connection to the WebSocket server.
  ///
  /// This method should be called before any other operations to ensure that the
  /// connection is established.
  ///
  /// Returns true if the connection was successful, false otherwise.
  Future<bool> initializeConnection(String wsUrl);

  /// Creates a new game and returns the game ID.
  ///
  /// The [wsUrl] parameter is the WebSocket URL to connect to the game server.
  Future<String?> createGame(String wsUrl);

  /// Joins an existing game with the given [gameId].
  Future<void> joinGame(String wsUrl, String gameId);
}

// Stream<void> getGameStream();
// Future<void> sendMove(dynamic move);
