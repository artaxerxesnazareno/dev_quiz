import 'dart:convert';

import 'package:dev_quiz/shared/models/awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({required this.title, required this.awnsers})
    : assert(awnsers.length == 4);

  factory QuestionModel.fromMap(Map<String, dynamic> json) {
    return QuestionModel(
      title: json["title"],
      awnsers: List.of(json["awnsers"])
          .map((i) => AwnserModel.fromMap(i))
          .toList(),
    );
  }

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "awnsers": List<dynamic>.from(awnsers.map((x) => x.toJson())),
    };
  }
}
