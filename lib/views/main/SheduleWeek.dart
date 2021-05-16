import 'dart:developer';

import 'package:dairy_app/components/Button.dart';
import 'package:dairy_app/components/Cell.dart';
import 'package:dairy_app/components/Placeholder.dart';
import 'package:dairy_app/components/Title.dart';
import 'package:dairy_app/helpers/AuthModal.dart';
import 'package:dairy_app/helpers/api.dart';
import 'package:dairy_app/redux/gv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:slimy_card/slimy_card.dart';

class SheduleWeek extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleWeekState();
}

class SheduleWeekState extends State<SheduleWeek> {
  var store;
  Map<String, dynamic> res;
  var date = DateTime.now();
  String act_date = DateTime.now().toString().split(" ")[0];
  //new DateTime.now().toString().split(" ")[0];

  @override
  void initState() {
    getDiary();
    super.initState();
  }

  void getDiary() {
    API
        .get_shedule_week({'date': act_date})
        .then((data) => {
              setState(() {
                res = data;
              })
            })
        .catchError((e) => print(e.toString()));
  }

  void to() {
    date = date.add(Duration(days: 1));
    var act_date_new = date.toString().toString().split(" ")[0];
    if (res[act_date_new] == null) {
      API
          .get_shedule_week({'date': act_date_new})
          .then((data) => {
                setState(() {
                  res.addAll(data);
                  // store.dispatch(ActionSetDiary(res));
                  log(res[act_date_new].toString());
                })
              })
          .catchError((e) => print(e.toString()));
    }
    setState(() {
      act_date = date.toString().toString().split(" ")[0];
    });
  }

  void back() {
    date = date.add(Duration(days: -1));
    var act_date_new = date.toString().toString().split(" ")[0];
    if (res[act_date_new] == null) {
      API
          .get_shedule_week({'date': act_date_new})
          .then((data) => {
                setState(() {
                  res.addAll(data);
                  // store.dispatch(ActionSetDiary(res));
                  log(res[act_date_new].toString());
                })
              })
          .catchError((e) => print(e.toString()));
    }
    setState(() {
      act_date = date.toString().toString().split(" ")[0];
    });
  }

  Widget itemList(dynamic data) {
    return Container(
      child: SlimyCard(
        topCardHeight: 150,
        color: Colors.white,
        bottomCardWidget: Text("Подробная иформация"),
        topCardWidget: Column(
          children: [
            Container(
              child: Text(data['discipline'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              margin: EdgeInsets.all(12),
            ),
            Container(
                child: Text(
              "Начало - ${data["time_begin"]}, конец - ${data['time_end']}",
              style: TextStyle(color: HexColor("#99a2ad")),
            )),
            Container(
                child: Row(
              children: [],
            ))
          ],
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
    return (StoreConnector<StateAppStore, dynamic>(
      converter: (store) {
        return (appBar) => store.dispatch(ActionSetAppBar(appBar));
      },
      builder: (context, setAppBar) {
        setAppBar(AppBar(
          title: Column(children: [
            Text(getWeekday(date.weekday),
                style: TextStyle(color: HexColor("#000000"))),
            Text(act_date,
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
          elevation: 1,
        ));
        return (res == null || res[act_date] == null
            ? Container(child: Spinner(), alignment: Alignment.center)
            : res[act_date]['is_weekend'] == true
                ? Placeholder2(description: "Выходной")
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, i) =>
                        itemList(res[act_date]['lessons'][i]),
                    itemCount: res[act_date]['lessons'].length));
      },
    ));
  }
}
