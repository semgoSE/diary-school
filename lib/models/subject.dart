import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'subject.g.dart';
@immutable
@HiveType(typeId: 3)

class Subject {

  const Subject({
    required this.subjectId,
    required this.discipline,
  });

  @HiveField(0)
  final int subjectId;
  @HiveField(1)
  final String discipline;

  factory Subject.fromJson(Map<String,dynamic> json) => Subject(
    subjectId: json['subject_id'] as int,
    discipline: json['discipline'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'subject_id': subjectId,
    'discipline': discipline
  };

  Subject clone() => Subject(
    subjectId: subjectId,
    discipline: discipline
  );


  Subject copyWith({
    int? subjectId,
    String? discipline
  }) => Subject(
    subjectId: subjectId ?? this.subjectId,
    discipline: discipline ?? this.discipline,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Subject && subjectId == other.subjectId && discipline == other.discipline;

  @override
  int get hashCode => subjectId.hashCode ^ discipline.hashCode;
}
