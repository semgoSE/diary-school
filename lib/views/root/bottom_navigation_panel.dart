import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleWeek.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
    return Observer(builder: (context) {
      SheduleWeek sheduleWeek =
          Provider.of<SheduleWeek>(context, listen: false);

      final List<Widget> _childrens = [
        Container(),
        SheduleWeekView(),
        Container()
      ];

      final List<PreferredSizeWidget> _headers = [
        AppBar(textTheme: Theme.of(context).textTheme, title: Text("Сводка")),
        AppBar(
            textTheme: Theme.of(context).textTheme,
            title: Column(
              children: [
                Container(
                    child: Text(DateFormat("d MMMM y", "ru_RU")
                        .format(sheduleWeek.date))),
                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text("Обновление", style: TextStyle(color: config.customTheme.text_secondary, fontSize: 12)),
                //       Container(
                //         child: Spinner(
                //           size: 9,
                //         ),
                //         padding: EdgeInsets.only(left: 8),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
            centerTitle: true),
        AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text("Профиль"),
        )
      ];

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: _headers[_currentIndex],
        body: _childrens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          backgroundColor: HexColor("#ffffff"),
          currentIndex: _currentIndex,
          selectedItemColor: HexColor("#2975cc"),
          onTap: onTap,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
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
              label: "Сводка",
            ),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  "resource/icons/calendar_outline_28.svg",
                  color: HexColor("#2975cc"),
                ),
                icon: SvgPicture.asset(
                  "resource/icons/calendar_outline_28.svg",
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
    });
  }
}
