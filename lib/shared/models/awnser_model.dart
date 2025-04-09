import 'dart:convert';

class AwnserModel {
  final String title;
  final bool isRight;

  AwnserModel({required this.title, required this.isRight});

  factory AwnserModel.fromMap(Map<String, dynamic> json) {
    return AwnserModel(title: json["title"], isRight: json["isRight"] ?? false);
  }

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));

  Map<String, dynamic> toJson() {
    return {"title": title, "isRight": isRight};
  }
}
