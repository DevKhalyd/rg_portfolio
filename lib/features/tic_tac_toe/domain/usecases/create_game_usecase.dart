import 'package:rg_portfolio/core/interfaces/use_case.dart';

import '../repositories/tic_tac_toe_repository.dart';

class CreateGameUseCase implements UseCase<Future<String?>, String> {
  final TicTacToeRepository repository;

  CreateGameUseCase(this.repository);

  @override
  Future<String?> call(String wsUrl) {
    return repository.createGame(wsUrl);
  }
}
