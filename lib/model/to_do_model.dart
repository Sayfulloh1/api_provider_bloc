


import 'dart:convert';

List<ToDoModel> toDoModelFromJson(String str) => List<ToDoModel>.from(json.decode(str).map((x) => ToDoModel.fromJson(x)));

String toDoModelToJson(List<ToDoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
