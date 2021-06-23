import 'package:diary_app/components/colors.dart';
import 'package:diary_app/redux/redux.dart';
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

  ThemeData theme = new ThemeData();
  var colors;

  if (store.state.theme == "light") {
    colors = LightTheme();
  } else {
    colors = DarkTheme();
  }

  theme = ThemeData(
      appBarTheme: AppBarTheme(
          color: colors.header['header_text'],
          elevation: 1,
          foregroundColor: colors.header['header_text'],
          iconTheme: IconThemeData(color: colors.accent),
          backgroundColor: colors.header["header_background"],
          toolbarTextStyle: TextStyle(color: colors.header['header_text']),
          titleTextStyle: TextStyle(color: colors.header['header_text'])));

  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      theme: theme,
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
