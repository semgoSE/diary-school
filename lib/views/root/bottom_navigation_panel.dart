import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  bool _isLoad = true;

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
      //TODO API
      setState(() {
        _isLoad = false;
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
    final List<Widget> _children = [
      // NewsFeed(store),
      // SheduleWeek(store),
      // User(store)
    ];

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return (Scaffold(
      backgroundColor: HexColor("#ffffff"),
      body: !_isLoad
          ? _children[_currentIndex]
          : Container(
              alignment: Alignment.center,
              child: Container(),
            ),
      bottomNavigationBar: !_isLoad
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
            ) : Container(),
    ));
  }
}