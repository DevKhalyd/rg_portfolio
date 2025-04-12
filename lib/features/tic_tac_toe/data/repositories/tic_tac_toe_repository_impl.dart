import 'package:rg_portfolio/features/tic_tac_toe/data/data_sources/websocket_data_source.dart';
import 'package:rg_portfolio/features/tic_tac_toe/data/models/ws_message.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/repositories/tic_tac_toe_repository.dart';

// Continue with the TicTacToeRepositoryImpl class
// Chat: https://chatgpt.com/c/67ef75e7-48dc-8013-85fb-7a34a293434d

class TicTacToeRepositoryImpl extends TicTacToeRepository {
  TicTacToeRepositoryImpl({required this.webSocket});

  final WebSocketDataSource<WsMessage> webSocket;

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
  Future<void> joinGame(String wsUrl, String gameId) {
    throw UnimplementedError();
  }
}
