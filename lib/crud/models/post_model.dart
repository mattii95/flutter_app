// To parse this JSON data, do
//
//     final postModel = postModelFromMap(jsonString);

import 'dart:convert';

PostModel postModelFromMap(String str) => PostModel.fromMap(json.decode(str));

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
