import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'response_lessons_get.g.dart';

@immutable
@HiveType(typeId: 9)
class ResponseLessonsGet {

  const ResponseLessonsGet({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final List<Timetable> msg;

  factory ResponseLessonsGet.fromJson(Map<String,dynamic> json) => ResponseLessonsGet(
    success: json['success'] as bool,
    msg: (json['msg'] as List? ?? []).map((e) => Timetable.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.map((e) => e.toJson()).toList()
  };

  ResponseLessonsGet clone() => ResponseLessonsGet(
    success: success,
    msg: msg.map((e) => e.clone()).toList()
  );


  ResponseLessonsGet copyWith({
    bool? success,
    List<Timetable>? msg
  }) => ResponseLessonsGet(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLessonsGet && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
