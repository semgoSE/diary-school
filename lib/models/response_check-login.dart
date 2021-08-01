import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';

part 'response_check-login.g.dart';

@immutable
@HiveType(typeId: 5)
class ResponseCheckLogin {

  const ResponseCheckLogin({
    required this.success,
    required this.msg,
  });

  @HiveField(0)
  final bool success;
  @HiveField(1)
  final String msg;

  factory ResponseCheckLogin.fromJson(Map<String,dynamic> json) => ResponseCheckLogin(
    success: json['success'] as bool,
    msg: json['msg'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'success': success,
    'msg': msg
  };

  ResponseCheckLogin clone() => ResponseCheckLogin(
    success: success,
    msg: msg
  );


  ResponseCheckLogin copyWith({
    bool? success,
    String? msg
  }) => ResponseCheckLogin(
    success: success ?? this.success,
    msg: msg ?? this.msg,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCheckLogin && success == other.success && msg == other.msg;

  @override
  int get hashCode => success.hashCode ^ msg.hashCode;
}
