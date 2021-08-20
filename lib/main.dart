import 'package:diary_app/components/colors.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/mobX/sign_up.dart';
import 'package:diary_app/models/auth_data.dart';
import 'package:diary_app/models/lesson.dart';
import 'package:diary_app/models/timetable.dart';
import 'package:diary_app/models/user.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_1.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_2.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_3.dart';
import 'package:diary_app/views/root/bottom_navigation_panel.dart';
import 'package:diary_app/views/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/authentication/login.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AuthDataAdapter());
  Hive.registerAdapter(TimetableAdapter());
  await Hive.openBox<Timetable>("lessons");
  await Hive.openBox<AuthData>("auth_data");

  ThemeData themeData;
  var theme;

  final Config config = Config();

  if (config.theme == ThemeConfig.light) {
    theme = LightTheme();
  } else {
    theme = DarkTheme();
  }

  //получаем тему здесь
  themeData = ThemeData(
      textTheme:
          TextTheme(headline6: TextStyle(color: theme.header['header_text'])),
      fontFamily: "Inter",
      backgroundColor: theme.background,
      accentColor: theme.accent,
      primaryColor: theme.textPrimary,
      appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: theme.accent),
          backgroundColor: theme.header["header_background"]));

  //получаем из темы Theme.of(context).backgroundColor,

  Box<AuthData> box = Hive.box<AuthData>("auth_data");
  AuthData init = AuthData(token: "", user: User(classId: 0, login: "", role: "test", userId: 0));
  AuthData? auth = box.get("auth_data", defaultValue: init);
  config.setLogin(auth!.token != "");

  runApp(MultiProvider(
    providers: [
      Provider<Config>(create: (_) => config),
      Provider<SignUp>(create: (_) => SignUp()),
      Provider<SheduleWeek>(create: (_) => SheduleWeek())
    ],
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
          return Observer(builder: (_) => config.login ? BottomNavigation() : Scaffold(
            body: StartPage(),
            backgroundColor: themeData.backgroundColor,
          ));
        },
      },
    ),
    ),
  );
}
