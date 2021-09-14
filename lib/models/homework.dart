import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class Homework {

  const Homework({
    required this.homeworkId,
    this.authorId,
    this.author,
    required this.source,
    required this.isPublic,
    required this.date,
    required this.lessonId,
    required this.taskId,
    required this.task,
  });

  @HiveField(0)
  final int homeworkId;
  @HiveField(1)
  final int? authorId;
  @HiveField(2)
  final SmallUser? author;
  @HiveField(3)
  final String source;
  @HiveField(4)
  final bool isPublic;
  @HiveField(5)
  final String date;
  @HiveField(6)
  final int lessonId;
  @HiveField(7)
  final int taskId;
  @HiveField(8)
  final Task task;

  factory Homework.fromJson(Map<String,dynamic> json) => Homework(
    homeworkId: json['homework_id'] as int,
    authorId: json['author_id'] != null ? json['author_id'] as int : null,
    author: json['author'] != null ? SmallUser.fromJson(json['author'] as Map<String, dynamic>) : null,
    source: json['source'] as String,
    isPublic: json['isPublic'] as bool,
    date: json['date'] as String,
    lessonId: json['lesson_id'] as int,
    taskId: json['task_id'] as int,
    task: Task.fromJson(json['task'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'homework_id': homeworkId,
    'author_id': authorId,
    'author': author?.toJson(),
    'source': source,
    'isPublic': isPublic,
    'date': date,
    'lesson_id': lessonId,
    'task_id': taskId,
    'task': task.toJson()
  };

  Homework clone() => Homework(
    homeworkId: homeworkId,
    authorId: authorId,
    author: author?.clone(),
    source: source,
    isPublic: isPublic,
    date: date,
    lessonId: lessonId,
    taskId: taskId,
    task: task.clone()
  );


  Homework copyWith({
    int? homeworkId,
    Optional<int?>? authorId,
    Optional<SmallUser?>? author,
    String? source,
    bool? isPublic,
    String? date,
    int? lessonId,
    int? taskId,
    Task? task
  }) => Homework(
    homeworkId: homeworkId ?? this.homeworkId,
    authorId: checkOptional(authorId, this.authorId),
    author: checkOptional(author, this.author),
    source: source ?? this.source,
    isPublic: isPublic ?? this.isPublic,
    date: date ?? this.date,
    lessonId: lessonId ?? this.lessonId,
    taskId: taskId ?? this.taskId,
    task: task ?? this.task,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Homework && homeworkId == other.homeworkId && authorId == other.authorId && author == other.author && source == other.source && isPublic == other.isPublic && date == other.date && lessonId == other.lessonId && taskId == other.taskId && task == other.task;

  @override
  int get hashCode => homeworkId.hashCode ^ authorId.hashCode ^ author.hashCode ^ source.hashCode ^ isPublic.hashCode ^ date.hashCode ^ lessonId.hashCode ^ taskId.hashCode ^ task.hashCode;
}
