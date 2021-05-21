import 'package:dairy_app/helpers/AuthModal.dart';
import 'package:dairy_app/helpers/Vibrations.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:dairy_app/redux/gv.dart';
import 'package:dairy_app/views/main/NewsFeed.dart';
import 'package:dairy_app/views/main/SheduleWeek.dart';
import 'package:dairy_app/views/main/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigation extends StatefulWidget {
  var store;
  BottomNavigation(this.store);
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<BottomNavigation> {
  int _currentIndex = 0;
  bool isLoad = true;
  var store;

  @override
  void initState() {
    checkLogin();
    store = widget.store;
    super.initState();
  }

  void checkLogin() async {
    await Vibrations.canVibrate();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("user_id") == null) {
      // Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (r) => false);
    } else {
      API.token = await prefs.getString("token");
      API.user_id = await prefs.getInt("user_id");
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
    final List<Widget> _children = [
      NewsFeed(store),
      SheduleWeek(store),
      User(store)
    ];

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return (new StoreConnector<StateAppStore, StateAppStore>(
        builder: (context, state) {
          return (Scaffold(
            backgroundColor: HexColor("#ffffff"),
            appBar: state.appBar,
            body: !isLoad
                ? _children[_currentIndex]
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
        },
        converter: (store) => store.state));
  }
}
