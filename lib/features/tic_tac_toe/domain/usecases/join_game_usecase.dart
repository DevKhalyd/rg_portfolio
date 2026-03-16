import 'package:rg_portfolio/core/interfaces/use_case.dart';

import '../repositories/tic_tac_toe_repository.dart';

class JoinGameUseCase implements UseCase<Future<bool>, String> {
  final TicTacToeRepository repository;

  JoinGameUseCase(this.repository);

  @override
  Future<bool> call(String gameId) {
    return repository.joinGame(gameId);
  }
}
