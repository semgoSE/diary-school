import 'package:dairy_app/redux/gv.dart';
import 'package:dairy_app/views/main/BottomNavigation.dart';
import 'package:dairy_app/views/sign_in/sign_in.dart';
import 'package:dairy_app/helpers/WebView.dart';
import 'package:dairy_app/views/sign_up/sign_up_1.dart';
import 'package:dairy_app/views/sign_up/sign_up_2.dart';
import 'package:dairy_app/views/sign_up/sign_up_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './views/sign_in/sign_in.dart';

void main() async {
  final store = new Store<StateAppStore>(appReducers,
      initialState: StateAppStore(appBar: null));
  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      theme: ThemeData(),
      initialRoute: "/",
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
        },
        '/': (BuildContext context) {
          return BottomNavigation(store);
        }
      },
    ),
  ));
}
