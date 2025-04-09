import 'package:rg_portfolio/features/tic_tac_toe/data/data_sources/websocket_data_source.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/repositories/tic_tac_toe_repository.dart';

// Continue with the TicTacToeRepositoryImpl class
// Chat: https://chatgpt.com/c/67ef75e7-48dc-8013-85fb-7a34a293434d

class TicTacToeRepositoryImpl extends TicTacToeRepository {
  TicTacToeRepositoryImpl({required this.webSocketDataSource});

  final WebSocketDataSource webSocketDataSource;

  @override
  Future<String?> createGame(String wsUrl) {
    throw UnimplementedError();
  }
}
