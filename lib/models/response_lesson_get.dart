import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class ResponseLessonGet {

  const ResponseLessonGet({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final Lesson msg;

  factory ResponseLessonGet.fromJson(Map<String,dynamic> json) => ResponseLessonGet(
    success: json['success'] as bool,
    msg: Lesson.fromJson(json['msg'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.toJson()
  };

  ResponseLessonGet clone() => ResponseLessonGet(
    success: success,
    msg: msg.clone()
  );


  ResponseLessonGet copyWith({
    bool? success,
    Lesson? msg
  }) => ResponseLessonGet(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLessonGet && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
