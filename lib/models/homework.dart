import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class Homework {

  const Homework({
    required this.homeworkId,
    required this.authorId,
    required this.isPublic,
    required this.date,
    required this.lessonId,
    required this.taskId,
    required this.task,
  });

  @HiveField(0)
  final int homeworkId;
  @HiveField(1)
  final int authorId;
  @HiveField(2)
  final bool isPublic;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final int lessonId;
  @HiveField(5)
  final int taskId;
  @HiveField(6)
  final Task task;

  factory Homework.fromJson(Map<String,dynamic> json) => Homework(
    homeworkId: json['homework_id'] as int,
    authorId: json['author_id'] as int,
    isPublic: json['isPublic'] as bool,
    date: json['date'] as String,
    lessonId: json['lesson_id'] as int,
    taskId: json['task_id'] as int,
    task: Task.fromJson(json['task'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'homework_id': homeworkId,
    'author_id': authorId,
    'isPublic': isPublic,
    'date': date,
    'lesson_id': lessonId,
    'task_id': taskId,
    'task': task.toJson()
  };

  Homework clone() => Homework(
    homeworkId: homeworkId,
    authorId: authorId,
    isPublic: isPublic,
    date: date,
    lessonId: lessonId,
    taskId: taskId,
    task: task.clone()
  );


  Homework copyWith({
    int? homeworkId,
    int? authorId,
    bool? isPublic,
    String? date,
    int? lessonId,
    int? taskId,
    Task? task
  }) => Homework(
    homeworkId: homeworkId ?? this.homeworkId,
    authorId: authorId ?? this.authorId,
    isPublic: isPublic ?? this.isPublic,
    date: date ?? this.date,
    lessonId: lessonId ?? this.lessonId,
    taskId: taskId ?? this.taskId,
    task: task ?? this.task,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Homework && homeworkId == other.homeworkId && authorId == other.authorId && isPublic == other.isPublic && date == other.date && lessonId == other.lessonId && taskId == other.taskId && task == other.task;

  @override
  int get hashCode => homeworkId.hashCode ^ authorId.hashCode ^ isPublic.hashCode ^ date.hashCode ^ lessonId.hashCode ^ taskId.hashCode ^ task.hashCode;
}
