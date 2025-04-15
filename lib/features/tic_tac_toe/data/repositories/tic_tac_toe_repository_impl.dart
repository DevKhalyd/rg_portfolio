import 'dart:async';

import 'package:rg_portfolio/features/tic_tac_toe/data/data_sources/websocket_data_source.dart';
import 'package:rg_portfolio/features/tic_tac_toe/data/models/ws_message.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/entities/game_state_entity.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/repositories/tic_tac_toe_repository.dart';

// Continue with the TicTacToeRepositoryImpl class
// Chat: https://chatgpt.com/c/67ef75e7-48dc-8013-85fb-7a34a293434d

class TicTacToeRepositoryImpl extends TicTacToeRepository {
  TicTacToeRepositoryImpl({required this.webSocket});

  final WebSocketDataSource<WsMessage> webSocket;

  // Create a Stream to watch the connection status
  // to the server or see if the websocket is good enough to listen

  final StreamController<GameEntity> _gameStateController =
      StreamController<GameEntity>.broadcast();

  @override
  Future<bool> initializeConnection(String wsUrl) {
    return webSocket.connect(wsUrl);
  }

  @override
  Future<String?> createGame(String wsUrl) async {
    // Send the game creation request
    final request = WsMessage(type: MessageType.create, payload: null);

    webSocket.send(request);

    // Wait for a response from the server
    final message = await webSocket.messages.first;

    // Validate the message type and extract the gameId
    if (message.type == MessageType.create) {
      final payload = message.payload;
      if (payload is Map && payload['gameId'] != null) {
        return payload['gameId'] as String;
      }
    }

    // Throw an error if you want to notify the user about the failure
    // or return null if you want to handle it silently
    return null;
  }

  @override
  Future<bool> joinGame(String gameId) async {
    // Send the join request
    final request = WsMessage(
      type: MessageType.join,
      payload: {'gameId': gameId},
    );

    webSocket.send(request);

    // Wait for response from server
    final message = await webSocket.messages.first;

    // Check for expected response type
    if (message.type == MessageType.join) {
      final payload = message.payload;
      final gameEntity = GameEntity.fromJson(payload);
      // This is the first event before to start the game
      _gameStateController.add(gameEntity);
      return true;
    }

    // Handle errors or unexpected responses
    return false;
  }

  @override
  Future<void> sendMoveInGame({
    required String gameId,
    required String playerId,
    required int index,
  }) async {
    // Send the move request
    final request = WsMessage(
      type: MessageType.move,
      payload: {'gameId': gameId, 'playerId': playerId, 'index': index},
    );

    webSocket.send(request);

    // Wait for response from server
    final message = await webSocket.messages.first;

    // Check for expected response type
    if (message.type == MessageType.move) {
      final payload = message.payload;
      final gameEntity = GameEntity.fromJson(payload);
      _gameStateController.add(gameEntity);
    }
  }

  @override
  void dispose() {
    _gameStateController.close();
  }

  @override
  Stream<GameEntity> gameStateStream() {
    return _gameStateController.stream;
  }
}
