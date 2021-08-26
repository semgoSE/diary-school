import 'dart:developer';

import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleCard.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/components/weekday_switch.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:infinity_page_view/infinity_page_view.dart';
import 'package:provider/provider.dart';
//import 'package:infinite_view_pager/infinite_view_pager.dart';

class SheduleWeekView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleWeekState();
}

class SheduleWeekState extends State {
  List<Timetable> timetables = [];

  bool isController = false;

  void initState() {
    super.initState();
  }

  int activeWeekDay = 0;

  void getTimetables() async {
    //TODO: сейвить раписание в hive
    Config config = Provider.of<Config>(context);
    UserApi api = new UserApi(config.token, config.payloadToken);
    api.setPath("lessons/get");
    var response = await api.request();
    // print(response);
    if(response['success']!) {
      setState(() {
        timetables = ResponseLessonsGet.fromJson(response).msg;
      });
      
      if(timetables.length == 0) {
        api.setPath("lessons/search-lessons");
        api.setBody({"date": "2021-03-02"}); //TODO: обрати внимание
        var resp = await api.request();
        if(resp['success']!) {
          timetables = ResponseLessonsGet.fromJson(resp).msg;
        }
      }
    }
  }  

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    getTimetables();


    return Observer(
      builder: (_) {
        SheduleWeek sheduleWeek =
            Provider.of<SheduleWeek>(context, listen: false);

        InfinityPageController infinityPageController = InfinityPageController(initialPage: sheduleWeek.date.weekday-1);

        changeDay(int day) {
          DateTime date = sheduleWeek.date;
          date = date.add(Duration(days: day+1 - date.weekday));
          // sheduleWeek.updateDate(date);
          isController = true;
          infinityPageController.jumpToPage(date.weekday-1);
        }

        return Container(
          color: Color(0xFFEBEDF0),
          child: timetables.length == 0 ? Spinner() : Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                color: Colors.white,
                width: width,
                height: height * 0.08,
                child: Center(
                  child: WeekDaySwitch(
                    activeEl: sheduleWeek.date.weekday - 1,
                    onTap: changeDay,
                  ),
                ),
              ),
              Expanded(
                child: InfinityPageView(
                  controller: infinityPageController,
                  onPageChanged: (i) {

                    DateTime date = sheduleWeek.date;
                    if(sheduleWeek.date.weekday+i != 7) {
                      date = date.add(Duration(days: i - (sheduleWeek.date.weekday-1)));
                    } else {
                      if(!isController) {
                        if(sheduleWeek.date.weekday-1 > i) date = date.add(Duration(days: 1));
                        else date = date.add(Duration(days: -1));
                      } else {
                        isController = false;
                        date = date.add(Duration(days: i - (sheduleWeek.date.weekday-1)));
                      }
                    }
                
                    sheduleWeek
                        .updateDate(date);
                  },
                  itemBuilder: ((BuildContext context, int i) {
                    return Container(
                      child: SheduleCard(
                        timetable: timetables[i],
                        header: (i+1).toString()),
                    );
                  }),
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
