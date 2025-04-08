enum MessageType { gameCreated, joined, update, error, state }

/// A class representing a WebSocket message.
/// 
/// The type indicates the kind of message (e.g., game created, joined, update, error, state).
/// 
/// The payload contains the data associated with the message.
class WsMessage {
  final MessageType type;
  final dynamic payload;

  const WsMessage({required this.type, required this.payload});

  factory WsMessage.fromJson(Map<String, dynamic> json) {
    return WsMessage(
      type: MessageType.values[json['type'] as int],
      payload: json['payload'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type.index, 'payload': payload};
  }
}
