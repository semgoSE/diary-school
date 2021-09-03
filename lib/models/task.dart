import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class Task {

  const Task({
    required this.taskId,
    required this.text,
  });

  @HiveField(0)
  final int taskId;
  @HiveField(1)
  final String text;

  factory Task.fromJson(Map<String,dynamic> json) => Task(
    taskId: json['task_id'] as int,
    text: json['text'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'task_id': taskId,
    'text': text
  };

  Task clone() => Task(
    taskId: taskId,
    text: text
  );


  Task copyWith({
    int? taskId,
    String? text
  }) => Task(
    taskId: taskId ?? this.taskId,
    text: text ?? this.text,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Task && taskId == other.taskId && text == other.text;

  @override
  int get hashCode => taskId.hashCode ^ text.hashCode;
}
