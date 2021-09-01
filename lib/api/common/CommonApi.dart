import 'dart:convert';

import 'package:diary_app/api/config.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CommonApi {
  String url = URL; //адресс сервера
  String route = "/"; //маршрут

  String? json_body; 
  
  late Dio dio;

  CommonApi() {
    dio = Dio(BaseOptions(baseUrl: url));
  }

  //редактируем маршрут
  void setPath(String path) {
    route = "/" + path;
  }

  //редактируем тело
  void setBody (Object obj) {
    json_body= jsonEncode(obj);
  }

  //отправляем запрос
  Future<dynamic> request() async {
    try {
      var response = await dio.post(route, data: json_body);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
