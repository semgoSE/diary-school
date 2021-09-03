import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class HomeworksGet {

  const HomeworksGet({
    required this.my,
    required this.other,
  });

  @HiveField(0)
  final List<Homework> my;
  @HiveField(1)
  final List<Homework> other;

  factory HomeworksGet.fromJson(Map<String,dynamic> json) => HomeworksGet(
    my: (json['my'] as List? ?? []).map((e) => Homework.fromJson(e as Map<String, dynamic>)).toList(),
    other: (json['other'] as List? ?? []).map((e) => Homework.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'my': my.map((e) => e.toJson()).toList(),
    'other': other.map((e) => e.toJson()).toList()
  };

  HomeworksGet clone() => HomeworksGet(
    my: my.map((e) => e.clone()).toList(),
    other: other.map((e) => e.clone()).toList()
  );


  HomeworksGet copyWith({
    List<Homework>? my,
    List<Homework>? other
  }) => HomeworksGet(
    my: my ?? this.my,
    other: other ?? this.other,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is HomeworksGet && my == other.my && other == other.other;

  @override
  int get hashCode => my.hashCode ^ other.hashCode;
}
