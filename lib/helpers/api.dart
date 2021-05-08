import 'dart:convert';

import 'package:dairy_app/data/ResponseAuthData.dart';
import 'package:dairy_app/data/SignInData.dart';
import 'package:dairy_app/data/SignUpData.dart';

import 'package:http/http.dart' as http;

class API {
  String _accessToken = "";
  int _userId;

  static String url = "https://20df1a810bec.ngrok.io/";

  static Future<ResponseAuthData> sign_up(SignUpData data) async {
    var url = Uri.parse(API.url + "auth/sign_up");
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(response.body);
    return ResponseAuthData.fromJson(jsonDecode(response.body));
  }

  static Future<bool> sign_in(SignInData data) async {
    var url = Uri.parse(API.url + "auth/sign_in");
    var response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(response.body);
    return false;
  }
}

class Response {}

class Error {}
