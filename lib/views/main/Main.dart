import 'package:dairy_app/helpers/AuthModal.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<Main> {
  int _currentIndex = 0;
  bool isLoad = true;
  final List<Widget> _children = [];

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("user_id") == null) {
      // Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (r) => false);
    } else {
      API.token = await prefs.getString("token");
      API.user_id = await prefs.getInt("user_id");
      var data = await API.get_shedule_week({'date': '2021-05-12'});
      setState(() {
        isLoad = false;
      });
    }
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: HexColor("#ffffff"),
      appBar: AppBar(
        backgroundColor: HexColor("#ffffff"),
        elevation: 0,
        title: Text(
          "Дневник",
          style: TextStyle(color: HexColor("#000000")),
        ),
      ),
      body: !isLoad
          ? ListView(children: [])
          : Container(
              alignment: Alignment.center,
              child: Spinner(),
            ),
      bottomNavigationBar: !isLoad
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              backgroundColor: HexColor("#ffffff"),
              currentIndex: _currentIndex,
              selectedItemColor: HexColor("#2975cc"),
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "res/newsfeed_outline_28.svg",
                      color: HexColor("#2975cc"),
                    ),
                    icon: SvgPicture.asset(
                      "res/newsfeed_outline_28.svg",
                      color: HexColor("#99a2ad"),
                    ),
                    label: "Сводка"),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "res/book_outline_28.svg",
                      color: HexColor("#2975cc"),
                    ),
                    icon: SvgPicture.asset(
                      "res/book_outline_28.svg",
                      color: HexColor("#99a2ad"),
                    ),
                    label: "Расписание"),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "res/user_outline_28.svg",
                      color: HexColor("#2975cc"),
                    ),
                    icon: SvgPicture.asset(
                      "res/user_outline_28.svg",
                      color: HexColor("#99a2ad"),
                    ),
                    label: "Профиль")
              ],
            )
          : null,
    ));
  }
}
