import 'dart:convert';

import 'package:dairy_app/data/ResponseAuthData.dart';
import 'package:dairy_app/data/SignInData.dart';
import 'package:dairy_app/data/SignUpData.dart';

import 'package:http/http.dart' as http;

class API {
  static String token = "";
  static int user_id;

  static String url = "https://secret-hollows-00848.herokuapp.com/v1.1/";

  static Future<dynamic> sign_up(dynamic data) async {
    var url = Uri.parse(API.url + "authorization/sign_up");
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }

  static Future<dynamic> login(dynamic data) async {
    var url = Uri.parse(API.url + "authorization/login");
    try {
      var response = await http.post(url,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> get_lessons() async {
    var url = Uri.parse(API.url + "lesson/get_lessons");
    var data = {
      'auth': {'token': API.token, 'user_id': API.user_id}
    };
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }

  static Future<dynamic> parse_lessons() async {
    var url = Uri.parse(API.url + "lesson/parse_lessons");
    var data = {
      'auth': {'token': API.token, 'user_id': API.user_id}
    };
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }
}

class Response {}

class Error {}
