import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/tic_tac_toe/data/models/ws_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/data_sources/websocket_data_source.dart';
import '../../../data/data_sources/websocket_data_source_impl.dart';

part 'websocket_data_source_provider.g.dart';

@riverpod
WebSocketDataSource<WsMessage> websocketDataSource(Ref ref) {
  return WebSocketDataSourceImpl();
}
