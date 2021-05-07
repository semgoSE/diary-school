import 'dart:convert';

import 'package:dairy_app/data/SignUpData.dart';

import 'package:http/http.dart' as http;

class API {
  String _accessToken = "";
  int _userId;

  static String url = "https://b5386ba4c9c7.ngrok.io/";
  static String sign_up(SignUpData data) {
    auth("sign_up", jsonEncode(data));
  }

  static void auth(String method, String body) async {
    var url = Uri.parse(API.url + "auth/" + method);
    var response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    print(response.body);
  }
}

class Response {}

class Error {}
