import 'dart:developer';

import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/screen_spinner.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleCard.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/components/weekday_switch.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
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
    
    Future.delayed(Duration.zero, () {
      getTimetables();
    });
    
  }

  int activeWeekDay = 0;

  void getTimetables() async {
    Box<Timetable>  boxTimetables = Hive.box<Timetable>("shedule_week");
    List<Timetable> hiveTimetables = [];

    for(int i = 0; i < 7; i++) {
      var timetable = boxTimetables.get(i);
      if(timetable != null) 
        // setState(() {
          hiveTimetables.add(timetable);
        // }); 
      // else hiveTimetables.add(Timetable(weekOfDay: i+1, lessons: []));
    }

    if(timetables.length == 0) {
      Config config = Provider.of<Config>(context, listen: false);
      UserApi api = new UserApi(config.token, config.payloadToken);
      
      api.setPath("lessons/get");
      
      // showDialog(context: context, builder: (context) => WillPopScope(child: ScreenSpinner(), onWillPop: () => Future.value(true)), barrierDismissible: false);
      var response = await api.request();
      // print(response);
      if(response['success']!) {
        // Navigator.pop(context); 
        setState(() {
          timetables = ResponseLessonsGet.fromJson(response).msg;
        });

        timetables.toList().asMap().forEach((i, t) async { 
          await boxTimetables.put(i, t);
        });
        
        if(timetables.length == 0) {
          api.setPath("lessons/search-lessons");
          api.setBody({"date": "2021-03-02"}); //TODO: обрати внимание
          var resp = await api.request();
          // Navigator.pop(context);
          if(resp['success']!) {
            timetables = ResponseLessonsGet.fromJson(resp).msg;
            timetables.toList().asMap().forEach((i, t) async { 
              await boxTimetables.put(i, t);
            });
          }
        }
      }
    } else {
      this.timetables = hiveTimetables;      
      // setState(() {
      //   this.timetables = hiveTimetables;        
      // });
    }
  }  

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
