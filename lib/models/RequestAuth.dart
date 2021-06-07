import 'package:json_annotation/json_annotation.dart';

part 'RequestAuth.g.dart';

@JsonSerializable()
class RequestAuth {
  Type type;
  String login;
  String pasword;
  int vk_id;
  String vk_token;

  RequestAuth(this.type, this.login, this.pasword, this.vk_id, this.vk_token); 

  factory RequestAuth.fromJson(Map<String, dynamic> json) => _$RequestAuthFromJson(json);

  Map<String, dynamic> toJson() => _$RequestAuthToJson(this);
}

enum Type {
DEFAULT,
VK
}