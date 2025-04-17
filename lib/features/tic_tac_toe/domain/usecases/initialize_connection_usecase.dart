import 'package:rg_portfolio/core/interfaces/use_case.dart';

import '../repositories/tic_tac_toe_repository.dart';

class InitializeConnectionUseCase implements UseCase<Future<bool>, String> {
  final TicTacToeRepository repository;

  InitializeConnectionUseCase(this.repository);

  @override
  Future<bool> call(String wsUrl) {
    return repository.initializeConnection(wsUrl);
  }
}
