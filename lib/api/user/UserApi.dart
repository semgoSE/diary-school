

import 'dart:convert';

import 'package:diary_app/api/config.dart';
import 'package:diary_app/models/index.dart';
import 'package:http/http.dart' as http;


class UserApi {

  String url_server = URL; //адресс сервера
  Uri? route;//марщрут

  Map<String, dynamic> body = new Map();

  UserApi(String token, PayloadToken payload) {
    this.url_server = URL;
    this.body.addAll({
      "token": token,
      "payload": payload
    });
  }


 //редактируем маршрут
  void setPath(String path) {
    route = Uri.https(URL, path);
  }

  //редактируем тело
  void setBody(Map<String, dynamic> obj) {
    this.body.addAll(obj);
  }

  //отправляем запрос
  Future<dynamic> request() async {
    try {
      var response = await http.post(route!, body: body);
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

}

class PayloadToken {
  final int user_id;
  final UserRoleEnum role;

  PayloadToken({ required this.user_id, required this.role });
}
