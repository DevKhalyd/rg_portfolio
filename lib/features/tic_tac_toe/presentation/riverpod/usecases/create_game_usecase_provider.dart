import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/create_game_usecase.dart';
import '../providers/tic_tac_toe_repository_provider.dart';

part 'create_game_usecase_provider.g.dart';

@riverpod
CreateGameUseCase createGameUseCase(Ref ref) {
  final repo = ref.read(ticTacToeRepositoryProvider);
  return CreateGameUseCase(repo);
}
