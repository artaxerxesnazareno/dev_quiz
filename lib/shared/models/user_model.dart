import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final int score;

  UserModel({required this.name, required this.photoUrl, this.score = 0});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'] ?? 0,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
