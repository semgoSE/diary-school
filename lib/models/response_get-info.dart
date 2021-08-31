import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'response_get-info.g.dart';

@immutable
@HiveType(typeId: 8)
class ResponseGetInfo {

  const ResponseGetInfo({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final GetInfo msg;

  factory ResponseGetInfo.fromJson(Map<String,dynamic> json) => ResponseGetInfo(
    success: json['success'] as bool,
    msg: GetInfo.fromJson(json['msg'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.toJson()
  };

  ResponseGetInfo clone() => ResponseGetInfo(
    success: success,
    msg: msg.clone()
  );


  ResponseGetInfo copyWith({
    bool? success,
    GetInfo? msg
  }) => ResponseGetInfo(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseGetInfo && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
