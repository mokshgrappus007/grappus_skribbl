part of 'session_bloc.dart';

class SessionState extends Equatable {
  const SessionState({
    this.currentPlayerId,
    this.players = const {},
    this.points = const DrawingPointsWrapper(points: null, paint: null),
    this.eventType = EventType.invalid,
    this.messages = const [],
    this.correctAnswer = '',
    this.remainingTime = roundDuration,
    this.numOfCorrectGuesses = 0,
    this.round = 1,
    this.isDrawing = '',
  });

  factory SessionState.fromJson(Map<String, dynamic> json) => SessionState(
        currentPlayerId: json['currentPlayerId'] as String,
        isDrawing: json['isDrawing'] as String,
        numOfCorrectGuesses: json['numOfCorrectGuesses'] as int,
        remainingTime: json['secondsPassed'] as int,
        round: json['round'] as int,
        players: (json['players'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, Player.fromJson(e as String)),
            ) ??
            const {},
        points: DrawingPointsWrapper.fromJson(
          json['points'] as Map<String, dynamic>,
        ),
        correctAnswer: json['correctAnswer'].toString(),
        eventType:
            EventType.fromJson(json['eventType'] as Map<String, dynamic>),
        messages: List<ChatModel>.from(
          (json['messages'] as List<dynamic>).map<ChatModel>(
            (x) => ChatModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );
  static const roundDuration = 6000;

  final String? currentPlayerId;
  final Map<String, Player> players;
  final DrawingPointsWrapper points;
  final EventType eventType;
  final List<ChatModel> messages;
  final String correctAnswer;
  final int remainingTime;
  final int numOfCorrectGuesses;
  final int round;
  final String isDrawing;

  SessionState copyWith({
    String? currentPlayerId,
    Map<String, Player>? players,
    DrawingPointsWrapper? points,
    EventType? eventType,
    List<ChatModel>? messages,
    String? correctAnswer,
    String? isDrawing,
    int? remainingTime,
    int? numOfCorrectGuesses,
    int? round,
  }) {
    return SessionState(
      currentPlayerId: currentPlayerId ?? this.currentPlayerId,
      players: players ?? this.players,
      points: points ?? this.points,
      eventType: eventType ?? this.eventType,
      messages: messages ?? this.messages,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      remainingTime: remainingTime ?? this.remainingTime,
      numOfCorrectGuesses: numOfCorrectGuesses ?? this.numOfCorrectGuesses,
      round: round ?? this.round,
      isDrawing: isDrawing ?? this.isDrawing,
    );
  }

  @override
  List<Object?> get props => [
        points,
        currentPlayerId,
        players,
        eventType,
        messages,
        correctAnswer,
        remainingTime,
        numOfCorrectGuesses,
        round,
        isDrawing,
      ];

  Map<String, dynamic> toJson() => {
        'players': Map<String, Player>.from(players),
        'currentPlayerId': currentPlayerId,
        'points': points.toJson(),
        'eventType': eventType.toJson(),
        'messages': messages.map((x) => x.toMap()).toList(),
        'correctAnswer': correctAnswer,
        'secondsPassed': remainingTime,
        'numOfCorrectGuesses': numOfCorrectGuesses,
        'round': round,
        'isDrawing': isDrawing,
      };

  @override
  String toString() {
    return encodedJson();
  }

  String encodedJson() {
    return jsonEncode(toJson());
  }
}
