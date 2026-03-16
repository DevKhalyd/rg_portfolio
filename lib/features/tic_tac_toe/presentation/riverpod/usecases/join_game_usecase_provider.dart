import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/join_game_usecase.dart';
import '../providers/tic_tac_toe_repository_provider.dart';

part 'join_game_usecase_provider.g.dart';

@riverpod
JoinGameUseCase joinGameUseCase(Ref ref) {
  final repo = ref.read(ticTacToeRepositoryProvider);
  return JoinGameUseCase(repo);
}