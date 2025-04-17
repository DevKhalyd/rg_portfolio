class SendMoveParams {
  final String gameId;
  final String playerId;
  final int index;

  SendMoveParams({
    required this.gameId,
    required this.playerId,
    required this.index,
  });
}