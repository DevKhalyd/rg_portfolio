import 'package:rg_portfolio/features/tic_tac_toe/data/data_sources/websocket_data_source.dart';
import 'package:rg_portfolio/features/tic_tac_toe/data/models/ws_message.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/repositories/tic_tac_toe_repository.dart';

// Continue with the TicTacToeRepositoryImpl class
// Chat: https://chatgpt.com/c/67ef75e7-48dc-8013-85fb-7a34a293434d

class TicTacToeRepositoryImpl extends TicTacToeRepository {
  TicTacToeRepositoryImpl({required this.webSocket});

  final WebSocketDataSource webSocket;

  @override
  Future<bool> initializeConnection(String wsUrl) {
    return webSocket.connect(wsUrl);
  }

  @override
  Future<String?> createGame(String wsUrl) async {
    // Send message to create a new game
    final request = WsMessage(
      type: MessageType.gameCreated,
      // TODO: Verify we don't need to send a payload for game creation
      payload: null,
    );

    webSocket.send(request);

  }
  
  @override
  Future<void> joinGame(String wsUrl, String gameId) {
    throw UnimplementedError();
  }
}
