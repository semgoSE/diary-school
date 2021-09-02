import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/colors.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/mobX/sign_up.dart';
import 'package:diary_app/models/index.dart';

import 'package:diary_app/views/authentication/sign_up/sign_up_1.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_2.dart';
import 'package:diary_app/views/authentication/sign_up/sign_up_3.dart';
import 'package:diary_app/views/root/SheduleWeek/Homework/CreateHomework.dart';
import 'package:diary_app/views/root/bottom_navigation_panel.dart';
import 'package:diary_app/views/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'views/authentication/login.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AuthDataAdapter());
  Hive.registerAdapter(LessonAdapter());
  Hive.registerAdapter(TimetableAdapter());
  Hive.registerAdapter(SubjectAdapter());

  await Hive.openBox<Timetable>("lessons");
  await Hive.openBox<AuthData>("auth_data");
  await Hive.openBox<Timetable>("shedule_week");

  ThemeData themeData;
  CustomTheme theme;

  final Config config = Config();

  if (config.theme == ThemeConfig.light) {
    theme = LightTheme();
  } else {
    theme = DarkTheme();
  }

  config.setTheme(ThemeConfig.light, theme);

  //получаем тему здесь
  themeData = ThemeData(
      textTheme: TextTheme(
          headline6: GoogleFonts.manrope(
              color: theme.header_text, fontWeight: FontWeight.bold),),
      fontFamily: "Inter",
      backgroundColor: theme.background,
      accentColor: theme.accent,
      primaryColor: theme.text_primary,
      appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: theme.accent),
          backgroundColor: theme.header_background),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: theme.modal_card_background,
        contentTextStyle: TextStyle(color: theme.text_primary, fontSize: 17),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 50
      ));


  Box<AuthData> box = Hive.box<AuthData>("auth_data");
  AuthData init = AuthData(
      token: "", user: User(classId: 0, login: "", role: "test", userId: 0));
  AuthData? auth = box.get("value", defaultValue: init);
  config.setLogin(auth!.token != "");
  config.addAuthData(auth.token,
      PayloadToken(user_id: auth.user.userId, role: auth.user.role));

  initializeDateFormatting("ru_RU", "").then((value) {
    runApp(
      MultiProvider(
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
              return Observer(
                  builder: (_) => config.login
                      ? BottomNavigation()
                      : Scaffold(
                          body: StartPage(),
                          backgroundColor: themeData.backgroundColor,
                        ));
            },
            '/create_homework': (BuildContext context) {
              return CreateHomework();
            },
          },
        ),
      ),
    );
  });
}
