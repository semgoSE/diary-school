import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'response_sign_up.g.dart';

@immutable
@HiveType(typeId: 7)
class ResponseSignUp {

  const ResponseSignUp({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final AuthData msg;

  factory ResponseSignUp.fromJson(Map<String,dynamic> json) => ResponseSignUp(
    success: json['success'] as bool,
    msg: AuthData.fromJson(json['msg'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg.toJson()
  };

  ResponseSignUp clone() => ResponseSignUp(
    success: success,
    msg: msg.clone()
  );


  ResponseSignUp copyWith({
    bool? success,
    AuthData? msg
  }) => ResponseSignUp(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSignUp && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
