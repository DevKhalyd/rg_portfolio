import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/repositories/tic_tac_toe_repository.dart';
import '../../../data/repositories/tic_tac_toe_repository_impl.dart';
import 'websocket_data_source_provider.dart';

part 'tic_tac_toe_repository_provider.g.dart';

@riverpod
TicTacToeRepository ticTacToeRepository(Ref ref) {
  final dataSource = ref.read(websocketDataSourceProvider);
  return TicTacToeRepositoryImpl(webSocket: dataSource);
}