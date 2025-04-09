import 'package:rg_portfolio/features/tic_tac_toe/data/data_sources/websocket_data_source.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Rerefence: https://pub.dev/packages/web_socket_channel

class WebSocketDataSourceImpl extends WebSocketDataSource {
  WebSocketChannel? _channel;

  @override
  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  @override
  void send(String message) {
    _channel?.sink.add(message);
  }

  @override
  Stream<String> get messages {
    if (_channel == null) {
      throw Exception("WebSocket is not connected");
    }
    return _channel!.stream.map((event) => event.toString());
  }

  @override
  void disconnect() {
    _channel?.sink.close();
  }
}
