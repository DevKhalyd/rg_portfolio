import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/tic_tac_toe/domain/usecases/watch_game_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers/tic_tac_toe_repository_provider.dart';

part 'watch_game_state_usecase_provider.g.dart';

@riverpod
WatchGameStateUseCase watchGameStateUseCase(Ref ref) {
  final repo = ref.read(ticTacToeRepositoryProvider);
  return WatchGameStateUseCase(repo);
}

