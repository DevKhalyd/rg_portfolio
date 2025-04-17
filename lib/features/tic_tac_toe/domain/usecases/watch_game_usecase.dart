import 'package:rg_portfolio/core/interfaces/use_case.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/entities/game_state_entity.dart';

import '../repositories/tic_tac_toe_repository.dart';

class WatchGameStateUseCase implements UseCase<Stream<GameEntity>, void> {
  final TicTacToeRepository repository;

  WatchGameStateUseCase(this.repository);

  @override
  Stream<GameEntity> call(void _) {
    return repository.gameStateStream() as Stream<GameEntity>;
  }
}
