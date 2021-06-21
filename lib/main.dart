import 'package:diary_app/redux/redux.dart';
import 'package:diary_app/views/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'views/authentication/login.dart';
import 'views/root/bottom_navigation_panel.dart';

void main() async {
  final store =
      new Store<StateStore>(appReducers, initialState: new StateStore());
  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      theme: ThemeData(),
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) {
          return Login();
        },
        '/': (BuildContext context) {
          return Scaffold(body: StartPage());
        },
      },
    ),
  ));
}
