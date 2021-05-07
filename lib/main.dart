import 'package:dairy_app/views/sign_in/sign_in.dart';
import 'package:dairy_app/helpers/WebView.dart';
import 'package:dairy_app/views/sign_up/sign_up_1.dart';
import 'package:dairy_app/views/sign_up/sign_up_2.dart';
import 'package:dairy_app/views/sign_up/sign_up_3.dart';
import 'package:flutter/material.dart';
import './views/sign_in/sign_in.dart';

void main() async {
  runApp(
    MaterialApp(
      theme: ThemeData(),
      initialRoute: "/sign_in",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/sign_in': (BuildContext context) {
          return SignIn();
        },
        '/sign_up_1': (BuildContext context) {
          return SignUp_1();
        },
        '/sign_up_2': (BuildContext context) {
          return SignUp_2();
        },
        '/sign_up_3': (BuildContext context) {
          return SignUp_3();
        },
        '/webview': (BuildContext context) {
          return WebView();
        }
      },
    ),
  );
}
