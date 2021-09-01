

import 'dart:convert';

import 'package:diary_app/api/config.dart';
import 'package:diary_app/models/index.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class UserApi {

  String url = URL; //адресс сервера
  String route = "/"; //марщрут


  Response? response;
  late Dio dio;

  Map<String, dynamic> body = new Map();

  UserApi(String token, PayloadToken payload) {
    dio = Dio(BaseOptions(baseUrl: url));
    
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
    route =  "/" + path;
  }

  //редактируем тело
  void setBody(Map<String, dynamic> obj) {
    this.body.addAll(obj);
  }

  //отправляем запрос
  Future<dynamic> request() async {
    try {
      response = await dio.post(route, data: body);
      return response!.data;
    } catch (e) {
      print(e);
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
