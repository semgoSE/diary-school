

import 'dart:convert';

import 'package:diary_app/api/config.dart';
import 'package:http/http.dart' as http;


class CommonApi {

  String url_server = URL; //адресс сервера
  Uri? route;//марщрут

  String? json_body; //тело запроса

  CommonApi() {
    this.url_server = URL;
  }


 //редактируем маршрут
  void setPath(String path) {
    route = Uri.https(URL, path);
  }

  //редактируем тело
  void setBody(Object obj) {
    json_body = jsonEncode(obj);
  }



  //отправляем запрос
  Future<dynamic> request() async {
    try {
      var response = await http.post(route!, body: json_body);
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

}