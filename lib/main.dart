import 'package:diary_app/components/colors.dart';
import 'package:diary_app/models/auth_data.dart';
import 'package:diary_app/models/user.dart';
import 'package:diary_app/redux/redux.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_1.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_2.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_3.dart';
import 'package:diary_app/views/root/bottom_navigation_panel.dart';
import 'package:diary_app/views/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:redux/redux.dart';
import 'views/authentication/login.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AuthDataAdapter());
  await Hive.openBox<dynamic>("auth_data");

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
      primaryColor: theme.textPrimary,
      appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: theme.accent),
          backgroundColor: theme.header["header_background"]));

  //получаем из темы Theme.of(context).backgroundColor,

  Box box = Hive.box("auth_data");

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
        '/sign_up_3': (BuildContext context) {
          return SignUp3();
        },
        '/': (BuildContext context) {
          return box.get("login", defaultValue: false) ? BottomNavigation() : Scaffold(
            body: StartPage(),
            backgroundColor: themeData.backgroundColor,
          );
        },
      },
    ),
  ));
}
