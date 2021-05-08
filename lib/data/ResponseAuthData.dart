import 'package:json_annotation/json_annotation.dart';

part 'ResponseAuthData.g.dart';

@JsonSerializable()
class ResponseAuthData {
  final String token;
  final int userId;

  ResponseAuthData(this.token, this.userId);

  Map<String, dynamic> toJson() => _$ResponseAuthDataToJson(this);
  factory ResponseAuthData.fromJson(Map<String, dynamic> json) =>
      _$ResponseAuthDataFromJson(json);
}
