import 'package:dairy_app/helpers/api.dart';
import 'package:dairy_app/models/store.dart';
import 'package:dairy_app/views/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './views/sign_in/sign_in.dart';

void main() async {
  await Hive.initFlutter();
  bool isAuth = false;

  runApp(
    MaterialApp(
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
        }
      },
    ),
  );
}