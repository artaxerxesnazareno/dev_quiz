import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse =>
      {
        'facil': Level.facil,
        'medio': Level.medio,
        'dificil': Level.dificil,
        'perito': Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse =>
      {
        Level.facil: 'Fácil',
        Level.medio: 'Médio',
        Level.dificil: 'Difícil',
        Level.perito: 'Perito',
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level,
  });

  factory QuizModel.fromMap(Map<String, dynamic> json) {
    return QuizModel(
      title: json["title"],
      questions: List.of(json["questions"])
          .map((i) => QuestionModel.fromMap(i))
          .toList(),
      questionAnswered: json["questionAnswered"] is String 
          ? int.parse(json["questionAnswered"]) 
          : json["questionAnswered"],
      image: json["imagem"] ?? json["image"],
      level: json["level"].toString().parse,
    );
  }

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
