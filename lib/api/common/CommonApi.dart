import 'dart:convert';

import 'package:diary_app/api/config.dart';
import 'package:http/http.dart' as http;

class CommonApi {

  String url_server = "https://diary-school.herokuapp.com/"; //адресс сервера
  Uri? route;//марщрут

  String? json_body; //тело запроса

  CommonApi() {
    this.url_server = URL;
    this.route = new Uri(path: url_server);
  }


 //редактируем маршрут
  void setPath(String path) {
    route = new Uri(path: url_server! + path);
  }

  //редактируем тело
  void setBody(Object obj) {
    json_body = jsonEncode(obj);
  }



  //отправляем запрос
  Future<dynamic> request() async {
    http.post(route!, body: json_body).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      return jsonDecode(response.body);
    }).catchError((error){
      print("Не работает инет");
    });
  }

}