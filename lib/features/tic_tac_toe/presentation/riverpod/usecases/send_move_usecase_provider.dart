import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/send_move_usecase.dart';
import '../providers/tic_tac_toe_repository_provider.dart';

part 'send_move_usecase_provider.g.dart';

@riverpod
SendMoveUseCase sendMoveUseCase(Ref ref) {
  final repo = ref.read(ticTacToeRepositoryProvider);
  return SendMoveUseCase(repo);
}
