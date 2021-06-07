import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'views/authentication/login.dart';
import 'views/root/bottom_navigation_panel.dart';

void main() async {
  runApp(StoreProvider(
    store: null,
    child: MaterialApp(
      theme: ThemeData(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) {
          return Login();
        },
        '/': (BuildContext context) {
          return BottomNavigation();
        },
      },
    ),
  ));
}
