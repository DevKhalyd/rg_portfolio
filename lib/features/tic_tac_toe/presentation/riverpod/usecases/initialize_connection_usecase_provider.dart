import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/usecases/initialize_connection_usecase.dart';
import '../providers/tic_tac_toe_repository_provider.dart';

part 'initialize_connection_usecase_provider.g.dart';

@riverpod
InitializeConnectionUseCase initializeConnectionUseCase(Ref ref) {
  final repo = ref.read(ticTacToeRepositoryProvider);
  return InitializeConnectionUseCase(repo);
}