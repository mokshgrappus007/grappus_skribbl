// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Player {
   String userId;
   String name;
   String imagePath;
  final bool hasAnsweredCorrectly;
  final int score;
  final bool isDrawing;
  final int numOfGuesses;

  Player({
    required this.userId,
    required this.name,
    required this.imagePath,
    this.hasAnsweredCorrectly = false,
    this.score = 0,
    this.isDrawing = false,
    this.numOfGuesses = 0,
  });

  Player copyWith({
    String? userId,
    String? name,
    String? imagePath,
    bool? hasAnsweredCorrectly,
    int? score,
    bool? isDrawing,
    int? numOfGuesses,
  }) {
    return Player(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      hasAnsweredCorrectly: hasAnsweredCorrectly ?? this.hasAnsweredCorrectly,
      score: score ?? this.score,
      isDrawing: isDrawing ?? this.isDrawing,
      numOfGuesses: numOfGuesses ?? this.numOfGuesses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'imagePath': imagePath,
      'hasAnsweredCorrectly': hasAnsweredCorrectly,
      'score': score,
      'isDrawing': isDrawing,
      'numOfGuesses': numOfGuesses,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      userId: map['userId'] as String,
      name: map['name'] as String,
      imagePath: map['imagePath'] as String,
      hasAnsweredCorrectly: (map['hasAnsweredCorrectly'] ?? false) as bool,
      score: map['score'] as int,
      isDrawing: map['isDrawing'] as bool,
      numOfGuesses: map['numOfGuesses'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) =>
      Player.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
