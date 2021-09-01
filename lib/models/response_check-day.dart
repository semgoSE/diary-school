import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

class ResponseCheckDay {

  const ResponseCheckDay({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final Msg msg;

  factory ResponseCheckDay.fromJson(Map<String,dynamic> json) => ResponseCheckDay(
    success: json['success'] as bool,
    msg: Msg.fromJson(json['msg'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.toJson()
  };

  ResponseCheckDay clone() => ResponseCheckDay(
    success: success,
    msg: msg.clone()
  );


  ResponseCheckDay copyWith({
    bool? success,
    Msg? msg
  }) => ResponseCheckDay(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCheckDay && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}

class Msg {

  const Msg({
    required this.name,
    required this.date,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String date;

  factory Msg.fromJson(Map<String,dynamic> json) => Msg(
    name: json['name'] as String,
    date: json['date'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'date': date
  };

  Msg clone() => Msg(
    name: name,
    date: date
  );


  Msg copyWith({
    String? name,
    String? date
  }) => Msg(
    name: name ?? this.name,
    date: date ?? this.date,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Msg && name == other.name && date == other.date;

  @override
  int get hashCode => name.hashCode ^ date.hashCode;
}
