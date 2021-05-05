import 'package:dairy_app/helpers/api.dart';
import 'package:dairy_app/models/store.dart';
import 'package:dairy_app/views/sign_in/sign_in.dart';
import 'package:dairy_app/views/sign_up/WebView.dart';
import 'package:dairy_app/views/sign_up/sign_up_1.dart';
import 'package:dairy_app/views/sign_up/sign_up_2.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './views/sign_in/sign_in.dart';

void main() async {
  await Hive.initFlutter();
  bool isAuth = false;

  runApp(
    MaterialApp(
      theme: ThemeData(),
      initialRoute: "/sign_in",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Route'),
            ),
          );
        },
        '/sign_in': (BuildContext context) {
          return SignIn();
        },
        '/sign_up_1': (BuildContext context) {
          return SignUp_1();
        },
        'sign_up_2': (BuildContext context) {
          return SignUp_2();
        },
        '/webview': (BuildContext context) {
          return WebView();
        }
      },
    ),
  );
}
