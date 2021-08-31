import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'get_info.g.dart';

@immutable
@HiveType(typeId: 3)
class GetInfo {

  const GetInfo({
    required this.lesson,
  });

  @HiveField(0)
  final Lesson lesson;

  factory GetInfo.fromJson(Map<String,dynamic> json) => GetInfo(
    lesson: Lesson.fromJson(json['lesson'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'lesson': lesson.toJson()
  };

  GetInfo clone() => GetInfo(
    lesson: lesson.clone()
  );


  GetInfo copyWith({
    Lesson? lesson
  }) => GetInfo(
    lesson: lesson ?? this.lesson,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is GetInfo && lesson == other.lesson;

  @override
  int get hashCode => lesson.hashCode;
}
