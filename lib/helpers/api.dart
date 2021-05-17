import 'dart:convert';

import 'package:dairy_app/data/ResponseAuthData.dart';
import 'package:dairy_app/data/SignInData.dart';
import 'package:dairy_app/data/SignUpData.dart';

import 'package:http/http.dart' as http;

class API {
  static String token = "";
  static int user_id;

  static String url = "https://diary-school.herokuapp.com/v1.0/";

  static Future<dynamic> sign_up(SignUpData data) async {
    var url = Uri.parse(API.url + "auth/sign_up");
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }

  static Future<dynamic> sign_in(SignInData data) async {
    var url = Uri.parse(API.url + "auth/sign_in");
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }

  static Future<dynamic> get_shedule_week(dynamic params) async {
    var url = Uri.parse(API.url + "dairy/week_schedule");
    var data = {
      'params': params,
      'auth': {'token': API.token, 'user_id': API.user_id}
    };
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return jsonDecode(response.body);
  }
}

class Response {}

class Error {}
