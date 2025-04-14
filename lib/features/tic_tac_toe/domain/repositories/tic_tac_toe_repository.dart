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
  ///
  /// Returns true if the join operation was successful, false otherwise.
  Future<bool> joinGame(String gameId);

  /// Sends a move in the game.
  ///
  /// [index] is the index of the move in the game board.
  ///
  /// Return the new game state.
  Future<void> sendMoveInGame({
    required String gameId,
    required String playerId,
    required int index,
  });

  /// Dispose any resources used by the repository.
  void dispose();
}
