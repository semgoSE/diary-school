import 'dart:developer';

import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Cell.dart';
import 'package:dairy_app/components/Icons.dart';
import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:dairy_app/helpers/AuthModal.dart';
import 'package:dairy_app/helpers/Vibrations.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:dairy_app/redux/gv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:infinity_page_view/infinity_page_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:slimy_card/slimy_card.dart';

class SheduleWeek extends StatefulWidget {
  var store;
  SheduleWeek(this.store);
  @override
  State<StatefulWidget> createState() => SheduleWeekState();
}

class SheduleWeekState extends State<SheduleWeek> {
  var store;
  var res;
  InfinityPageController controller;
  int page;
  DateTime date;
  bool isHeader = false;

  @override
  void initState() {
    store = widget.store;
    date = DateTime.now();
    controller = InfinityPageController(initialPage: date.weekday - 1);
    getLessons();
    page = date.weekday - 1;

    super.initState();
  }

  void getLessons() {
    if (store.state.diary == null) {
      API
          .get_lessons()
          .then((data) => {
                setState(() {
                  res = data['data'];
                  if (data['data'].length != 0) {
                    isHeader = true;
                    store.dispatch(ActionSetDiary(res));
                    Vibrations.success();
                  } else {
                    Vibrations.warning();
                  }
                })
              })
          .catchError((e) => print(e.toString()));
    } else {
      setState(() {
        isHeader = true;
        res = store.state.diary;
      });
    }
  }

  void parseLessons() {
    showBarModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        topControl: Container(),
        builder: (context) => (WillPopScope(
            child: AuthModal(header: "Ищем расписание...", child: Spinner()),
            onWillPop: () => Future.value(false))));
    API.parse_lessons().then((data) {
      Navigator.pop(context);
      if (data['success']) {
        store.dispatch(ActionSetDiary(null));
        res = null;
        final snackBar = SnackBar(
            content: Text(data['data']),
            backgroundColor: HexColor("#4bb34b"),
            behavior: SnackBarBehavior.floating);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Vibrations.success();
        getLessons();
      } else {
        final snackBar = SnackBar(
            content: Text(data['data']),
            backgroundColor: HexColor("#e64646"),
            behavior: SnackBarBehavior.floating);
        Vibrations.warning();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void to() {
    controller.animateToPage(controller.page + 1,
        duration: new Duration(milliseconds: 300), curve: Curves.ease);
  }

  void back() {
    controller.animateToPage(controller.page - 1,
        duration: new Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChange(int i) {
    int o = (i - page);
    print(o);
    if (o == 1) {
      date = date.add(Duration(days: 1));
    } else if (o == -1) {
      date = date.add(Duration(days: -1));
    } else {
      if (o == 6) {
        date = date.add(Duration(days: -1));
      } else {
        date = date.add(Duration(days: 1));
      }
    }

    page = i;
  }

  Widget itemList(dynamic data) {
    return Container(
      child: SlimyCard(
        topCardHeight: 190,
        color: Colors.orange[50],
        bottomCardHeight: 150,
        bottomCardWidget: Container(
            padding: EdgeInsets.all(12),
            child: (Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Средняя оценка",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Expanded(child: Text("5"))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Д.з",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Expanded(child: Text("ничего нет"))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Комментарий",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    Expanded(child: Text(""))
                  ],
                )
              ],
            ))),
        topCardWidget: Container(
          child: Column(
            children: [
              Text(data['index_day'].toString(),
                  style: TextStyle(
                      color: HexColor("#000000"),
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Text(data['subject']['discipline'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
              ),
              Container(
                  child: Text(
                data['time_begin'] + " - " + data['time_end'],
                textAlign: TextAlign.center,
                style: TextStyle(color: HexColor("#99a2ad"), fontSize: 14),
              )),

              Container(
                child: Row(children: [
                  Expanded(
                      child: Container(
                    child: Text(
                      data['office'],
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  ))
                ]),
              ),
              // Container(height: 20)
            ],
          ),
          padding: EdgeInsets.all(12),
        ),
      ),
      padding: EdgeInsets.all(12),
    );
  }

  String getWeekday(int i) {
    switch (i) {
      case 1:
        return "Понедельник";
        break;
      case 2:
        return "Вторник";
        break;
      case 3:
        return "Среда";
        break;
      case 4:
        return "Четверг";
        break;
      case 5:
        return "Пятница";
        break;
      case 6:
        return "Субота";
        break;
      case 7:
        return "Воскресенье";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateAppStore, dynamic>(converter: (store) {
      return (appBar) => store.dispatch(ActionSetAppBar(appBar));
    }, builder: (context, setAppBar) {
      setAppBar(isHeader
          ? AppBar(
              title: Column(children: [
                Text(getWeekday(date.weekday),
                    style: TextStyle(color: HexColor("#000000"))),
                Text(date.toString(),
                    style: TextStyle(color: HexColor("#99a2ad"), fontSize: 12))
              ]),
              backgroundColor: HexColor("#ffffff"),
              leading: IconButton(
                  icon: SvgPicture.asset("res/chevron_left_outline_28.svg",
                      color: HexColor("#2975cc")),
                  onPressed: back),
              actions: [
                IconButton(
                    icon: SvgPicture.asset("res/chevron_right_outline_28.svg",
                        color: HexColor("#2975cc")),
                    onPressed: to)
              ],
              centerTitle: true,
              elevation: 0,
            )
          : null);
      return (res == null
          ? Container(child: Spinner(), alignment: Alignment.center)
          : res.length == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "res/search_like_outline_56.svg",
                        height: 120,
                        width: 120,
                        color: HexColor("#2787F5"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      child: Text("Расписание не найдено. ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        child: ButtonPrimary(
                      text: "Далее",
                      click: () {
                        parseLessons();
                      },
                    ))
                  ],
                )
              : Container(
                  color: Colors.white,
                  child: InfinityPageView(
                      onPageChanged: onPageChange,
                      controller: controller,
                      itemCount: res.length,
                      itemBuilder: (context, index) {
                        return res[index].length != 0
                            ? ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, j) =>
                                    itemList(res[index][j]),
                                itemCount: res[index].length)
                            : Container(
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: SvgPicture.asset(
                                          "res/ghost_outline_56.svg"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        "Уроков нет. Можно спать спокойно)",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ));
                      })));
    });
  }
}
