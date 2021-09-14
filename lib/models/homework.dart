import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class Homework {

  const Homework({
    required this.homeworkId,
    this.authorId,
    required this.source,
    required this.isPublic,
    required this.date,
    required this.lessonId,
    required this.taskId,
    required this.task,
    this.author,
  });

  @HiveField(0)
  final int homeworkId;
  @HiveField(1)
  final int? authorId;
  @HiveField(2)
  final String source;
  @HiveField(3)
  final bool isPublic;
  @HiveField(4)
  final String date;
  @HiveField(5)
  final int lessonId;
  @HiveField(6)
  final int taskId;
  @HiveField(7)
  final Task task;
  @HiveField(8)
  final SmallUser? author;

  factory Homework.fromJson(Map<String,dynamic> json) => Homework(
    homeworkId: json['homework_id'] as int,
    authorId: json['author_id'] != null ? json['author_id'] as int : null,
    source: json['source'] as String,
    isPublic: json['isPublic'] as bool,
    date: json['date'] as String,
    lessonId: json['lesson_id'] as int,
    taskId: json['task_id'] as int,
    task: Task.fromJson(json['task'] as Map<String, dynamic>),
    author: json['author'] != null ? SmallUser.fromJson(json['author'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'homework_id': homeworkId,
    'author_id': authorId,
    'source': source,
    'isPublic': isPublic,
    'date': date,
    'lesson_id': lessonId,
    'task_id': taskId,
    'task': task.toJson(),
    'author': author?.toJson()
  };

  Homework clone() => Homework(
    homeworkId: homeworkId,
    authorId: authorId,
    source: source,
    isPublic: isPublic,
    date: date,
    lessonId: lessonId,
    taskId: taskId,
    task: task.clone(),
    author: author?.clone()
  );


  Homework copyWith({
    int? homeworkId,
    Optional<int?>? authorId,
    String? source,
    bool? isPublic,
    String? date,
    int? lessonId,
    int? taskId,
    Task? task,
    Optional<SmallUser?>? author
  }) => Homework(
    homeworkId: homeworkId ?? this.homeworkId,
    authorId: checkOptional(authorId, this.authorId),
    source: source ?? this.source,
    isPublic: isPublic ?? this.isPublic,
    date: date ?? this.date,
    lessonId: lessonId ?? this.lessonId,
    taskId: taskId ?? this.taskId,
    task: task ?? this.task,
    author: checkOptional(author, this.author),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Homework && homeworkId == other.homeworkId && authorId == other.authorId && source == other.source && isPublic == other.isPublic && date == other.date && lessonId == other.lessonId && taskId == other.taskId && task == other.task && author == other.author;

  @override
  int get hashCode => homeworkId.hashCode ^ authorId.hashCode ^ source.hashCode ^ isPublic.hashCode ^ date.hashCode ^ lessonId.hashCode ^ taskId.hashCode ^ task.hashCode ^ author.hashCode;
}
