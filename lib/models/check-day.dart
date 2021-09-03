import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class CheckDay {

  const CheckDay({
    required this.name,
    required this.date,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String date;

  factory CheckDay.fromJson(Map<String,dynamic> json) => CheckDay(
    name: json['name'] as String,
    date: json['date'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'date': date
  };

  CheckDay clone() => CheckDay(
    name: name,
    date: date
  );


  CheckDay copyWith({
    String? name,
    String? date
  }) => CheckDay(
    name: name ?? this.name,
    date: date ?? this.date,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is CheckDay && name == other.name && date == other.date;

  @override
  int get hashCode => name.hashCode ^ date.hashCode;
}
