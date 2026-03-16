enum PlayerTurn { X, O }

enum Winner { X, O, draw, inGame }

class GameEntity {
  final String id;
  final List<String?> board;
  final PlayersId playersId;
  final PlayerTurn currentTurn;
  final Winner winner;

  const GameEntity({
    required this.id,
    required this.board,
    required this.playersId,
    required this.currentTurn,
    required this.winner,
  });

  factory GameEntity.fromJson(Map<String, dynamic> json) {
    return GameEntity(
      id: json['id'] as String,
      board: (json['board'] as List).map((e) => e as String?).toList(),
      playersId: PlayersId.fromJson(json['playersId']),
      currentTurn: PlayerTurn.values.byName(json['currentTurn']),
      winner: Winner.values.byName(json['winner'] ?? 'inGame'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'board': board,
      'playersId': playersId.toJson(),
      'currentTurn': currentTurn.name,
      'winner': winner == Winner.inGame ? null : winner.name,
    };
  }
}

class PlayersId {
  final String? first;
  final String? second;

  PlayersId({this.first, this.second});

  factory PlayersId.fromJson(Map<String, dynamic> json) {
    return PlayersId(
      first: json['first'] as String?,
      second: json['second'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'first': first, 'second': second};
  }
}
