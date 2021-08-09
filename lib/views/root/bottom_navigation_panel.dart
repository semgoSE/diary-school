import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Container(),
      Container(),
      Container()
    ];

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Сводка"),
        textTheme: Theme.of(context).textTheme),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              backgroundColor: HexColor("#ffffff"),
              currentIndex: _currentIndex,
              selectedItemColor: HexColor("#2975cc"),
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "resource/icons/newsfeed_outline_28.svg",
                      color: HexColor("#2975cc"),
                    ),
                    icon: SvgPicture.asset(
                      "resource/icons/newsfeed_outline_28.svg",
                      color: HexColor("#99a2ad"),
                    ),
                    label: "Сводка"),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "resource/icons/calendar_outline_28.svg.svg",
                      color: HexColor("#2975cc"),
                    ),
                    icon: SvgPicture.asset(
                      "resource/icons/calendar_outline_28.svg.svg",
                      color: HexColor("#99a2ad"),
                    ),
                    label: "Расписание"),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "resource/icons/user_outline_28.svg",
                      color: HexColor("#2975cc"),
                    ),
                    icon: SvgPicture.asset(
                      "resource/icons/user_outline_28.svg",
                      color: HexColor("#99a2ad"),
                    ),
                    label: "Профиль")
              ],
            ),
    );
  }
}
