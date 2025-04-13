import 'dart:developer';

import 'package:rg_portfolio/features/tic_tac_toe/data/data_sources/websocket_data_source.dart';
import 'package:rg_portfolio/features/tic_tac_toe/data/models/ws_message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Rerefence: https://pub.dev/packages/web_socket_channel

/// A WebSocket data source implementation that uses the web_socket_channel package.
class WebSocketDataSourceImpl extends WebSocketDataSource<WsMessage> {
  WebSocketChannel? _channel;

  @override
  Future<bool> connect(String url) async {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    try {
      await _channel!.ready;
    } catch (e) {
      log('Failed to connect to WebSocket: $e');
      _channel!.sink.close();
      return false;
    }
    return true;
  }

  @override
  void send(WsMessage message) {
    _channel?.sink.add(message);
  }

  @override
  Stream<WsMessage> get messages {
    if (_channel == null) {
      throw Exception("WebSocket is not connected");
    }
    return _channel!.stream as Stream<WsMessage>;
  }

  @override
  void disconnect() {
    _channel?.sink.close();
  }
}
