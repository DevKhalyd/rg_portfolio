import 'package:rg_portfolio/core/interfaces/use_case.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/dto/send_move_params.dart';

import '../repositories/tic_tac_toe_repository.dart';

class SendMoveUseCase implements UseCase<Future<void>, SendMoveParams> {
  final TicTacToeRepository repository;

  SendMoveUseCase(this.repository);

  @override
  Future<void> call(SendMoveParams params) {
    return repository.sendMoveInGame(
      gameId: params.gameId,
      playerId: params.playerId,
      index: params.index,
    );
  }
}
