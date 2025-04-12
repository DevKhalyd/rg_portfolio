abstract class WebSocketDataSource<T> {
  /// Connects to the WebSocket server at the given [url].
  ///
  /// Returns a [Future] that completes with `true` if the connection was
  /// successful, or `false` if it failed.
  Future<bool> connect(String url);
  void disconnect();
  void send(T message);
  Stream<T> get messages;
}
