

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
      "payload": {
        "user_id": payload.user_id,
        "role": payload.role
      }
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
      var response = await http.post(route!, body: jsonEncode(body), headers: {
        "Content-Type": "application/json"
      });
      return jsonDecode(response.body);
    } catch (e) {
      return "Жопа";
    }
    
    // try {
    //   var response = await http.post(route!, body: body);
    //   print(response);
    //   return null;
    //   // return jsonDecode(response.body);
    // } catch (e) {
    //   // print(e);
    //   return null;
    // }
  }

}

class PayloadToken {
  final int user_id;
  final String role;

  PayloadToken({ required this.user_id, required this.role });
}
