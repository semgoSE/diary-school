import 'package:diary_app/components/colors.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_1.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_2.dart';
import 'package:diary_app/views/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:redux/redux.dart';
import 'views/authentication/login.dart';
import 'views/root/bottom_navigation_panel.dart';

void main() async {
  final store =
      new Store<StateStore>(appReducers, initialState: new StateStore());

  ThemeData themeData;
  var theme;

  if (store.state.theme == "light") {
    theme = LightTheme();
  } else {
    theme = DarkTheme();
  }

  //получаем тему здесь
  themeData = ThemeData(
      textTheme:
          TextTheme(headline6: TextStyle(color: theme.header['header_text'])),
      backgroundColor: theme.background,
      accentColor: theme.accent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: theme.accent),
          backgroundColor: theme.header["header_background"]));

  //получаем из темы Theme.of(context).backgroundColor,

  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      theme: themeData,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) {
          return Login();
        },
        '/sign_up_1': (BuildContext context) {
          return SignUp1();
        },
        '/sign_up_2': (BuildContext context) {
          return SignUp2();
        },
        '/': (BuildContext context) {
          return Scaffold(
              body: StartPage(), backgroundColor: themeData.backgroundColor);
        },
      },
    ),
  ));
}
