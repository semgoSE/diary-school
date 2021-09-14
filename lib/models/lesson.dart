import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'lesson.g.dart';
@immutable
@HiveType(typeId: 3)

class Lesson {

  const Lesson({
    required this.lessonId,
    required this.classId,
    required this.weekOfDay,
    required this.index,
    required this.office,
    required this.timeBegin,
    required this.timeEnd,
    required this.subjectId,
    this.teacherId,
    required this.subject,
  });

  @HiveField(0)
  final int lessonId;
  @HiveField(1)
  final int classId;
  @HiveField(2)
  final int weekOfDay;
  @HiveField(3)
  final int index;
  @HiveField(4)
  final String office;
  @HiveField(5)
  final String timeBegin;
  @HiveField(6)
  final String timeEnd;
  @HiveField(7)
  final int subjectId;
  @HiveField(8)
  final int? teacherId;
  @HiveField(9)
  final Subject subject;

  factory Lesson.fromJson(Map<String,dynamic> json) => Lesson(
    lessonId: json['lesson_id'] as int,
    classId: json['class_id'] as int,
    weekOfDay: json['week_of_day'] as int,
    index: json['index'] as int,
    office: json['office'] as String,
    timeBegin: json['time_begin'] as String,
    timeEnd: json['time_end'] as String,
    subjectId: json['subject_id'] as int,
    teacherId: json['teacher_id'] != null ? json['teacher_id'] as int : null,
    subject: Subject.fromJson(json['subject'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'lesson_id': lessonId,
    'class_id': classId,
    'week_of_day': weekOfDay,
    'index': index,
    'office': office,
    'time_begin': timeBegin,
    'time_end': timeEnd,
    'subject_id': subjectId,
    'teacher_id': teacherId,
    'subject': subject.toJson()
  };

  Lesson clone() => Lesson(
    lessonId: lessonId,
    classId: classId,
    weekOfDay: weekOfDay,
    index: index,
    office: office,
    timeBegin: timeBegin,
    timeEnd: timeEnd,
    subjectId: subjectId,
    teacherId: teacherId,
    subject: subject.clone()
  );


  Lesson copyWith({
    int? lessonId,
    int? classId,
    int? weekOfDay,
    int? index,
    String? office,
    String? timeBegin,
    String? timeEnd,
    int? subjectId,
    Optional<int?>? teacherId,
    Subject? subject
  }) => Lesson(
    lessonId: lessonId ?? this.lessonId,
    classId: classId ?? this.classId,
    weekOfDay: weekOfDay ?? this.weekOfDay,
    index: index ?? this.index,
    office: office ?? this.office,
    timeBegin: timeBegin ?? this.timeBegin,
    timeEnd: timeEnd ?? this.timeEnd,
    subjectId: subjectId ?? this.subjectId,
    teacherId: checkOptional(teacherId, this.teacherId),
    subject: subject ?? this.subject,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Lesson && lessonId == other.lessonId && classId == other.classId && weekOfDay == other.weekOfDay && index == other.index && office == other.office && timeBegin == other.timeBegin && timeEnd == other.timeEnd && subjectId == other.subjectId && teacherId == other.teacherId && subject == other.subject;

  @override
  int get hashCode => lessonId.hashCode ^ classId.hashCode ^ weekOfDay.hashCode ^ index.hashCode ^ office.hashCode ^ timeBegin.hashCode ^ timeEnd.hashCode ^ subjectId.hashCode ^ teacherId.hashCode ^ subject.hashCode;
}
