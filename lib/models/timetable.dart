import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'timetable.g.dart';

@immutable
@HiveType(typeId: 14)
class Timetable {

  const Timetable({
    required this.weekOfDay,
    required this.lessons,
  });

  @HiveField(0)
  final int weekOfDay;
  @HiveField(1)
  final List<Lesson> lessons;

  factory Timetable.fromJson(Map<String,dynamic> json) => Timetable(
    weekOfDay: json['week_of_day'] as int,
    lessons: (json['lessons'] as List? ?? []).map((e) => Lesson.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'week_of_day': weekOfDay,
    'lessons': lessons.map((e) => e.toJson()).toList()
  };

  Timetable clone() => Timetable(
    weekOfDay: weekOfDay,
    lessons: lessons.map((e) => e.clone()).toList()
  );


  Timetable copyWith({
    int? weekOfDay,
    List<Lesson>? lessons
  }) => Timetable(
    weekOfDay: weekOfDay ?? this.weekOfDay,
    lessons: lessons ?? this.lessons,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Timetable && weekOfDay == other.weekOfDay && lessons == other.lessons;

  @override
  int get hashCode => weekOfDay.hashCode ^ lessons.hashCode;
}
