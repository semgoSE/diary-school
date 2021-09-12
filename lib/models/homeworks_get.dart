import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class HomeworksGet {

  const HomeworksGet({
    required this.myHomeworks,
    required this.otherHomeworks,
  });

  @HiveField(0)
  final List<Homework> myHomeworks;
  @HiveField(1)
  final List<Homework> otherHomeworks;

  factory HomeworksGet.fromJson(Map<String,dynamic> json) => HomeworksGet(
    myHomeworks: (json['my_homeworks'] as List? ?? []).map((e) => Homework.fromJson(e as Map<String, dynamic>)).toList(),
    otherHomeworks: (json['other_homeworks'] as List? ?? []).map((e) => Homework.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'my_homeworks': myHomeworks.map((e) => e.toJson()).toList(),
    'other_homeworks': otherHomeworks.map((e) => e.toJson()).toList()
  };

  HomeworksGet clone() => HomeworksGet(
    myHomeworks: myHomeworks.map((e) => e.clone()).toList(),
    otherHomeworks: otherHomeworks.map((e) => e.clone()).toList()
  );


  HomeworksGet copyWith({
    List<Homework>? myHomeworks,
    List<Homework>? otherHomeworks
  }) => HomeworksGet(
    myHomeworks: myHomeworks ?? this.myHomeworks,
    otherHomeworks: otherHomeworks ?? this.otherHomeworks,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is HomeworksGet && myHomeworks == other.myHomeworks && otherHomeworks == other.otherHomeworks;

  @override
  int get hashCode => myHomeworks.hashCode ^ otherHomeworks.hashCode;
}
