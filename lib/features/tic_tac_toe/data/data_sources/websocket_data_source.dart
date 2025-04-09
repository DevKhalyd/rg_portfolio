abstract class WebSocketDataSource {
  void connect(String url);
  void send(String message);
  Stream<String> get messages;
  void disconnect();
}