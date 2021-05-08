import 'package:json_annotation/json_annotation.dart';

part 'AuthData.g.dart';

@JsonSerializable()
class AuthData {
  int id;
  String type;
  String token;
  String cookie;

  AuthData(
      {this.token = "",
      this.cookie = "",
      this.id = 0,
      this.type = TypeAuthData.VK});

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

class TypeAuthData {
  static const String VK = "VK";
}
