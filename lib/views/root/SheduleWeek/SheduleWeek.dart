import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/card.dart';
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

  void initState() {
    super.initState();
  }

  int activeWeekDay = 0;
  void getTimetables() {
    Config config = Provider.of<Config>(context);
    UserApi api = new UserApi(config.token, config.payloadToken);
    api.setPath("lessons/get");
    var response = api.request();

    api.setPath("lessons/search-lessons");
    api.setBody({"date": "2021-03-02"});
    var resp = api.request();
  }

  @override
  Widget build(BuildContext context) {
    InfinityPageController infinityPageController = InfinityPageController(
        initialPage:
            Provider.of<SheduleWeek>(context, listen: false).date.weekday - 1);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) {
        SheduleWeek sheduleWeek =
            Provider.of<SheduleWeek>(context, listen: false);

        changeDay(int day) {
          DateTime temp = sheduleWeek.date;
          print(temp.weekday);
          print(day);
          if ((day + 1) > temp.weekday) {
            temp.add(Duration(days: day+1-temp.weekday));
          } else {
            temp.add(Duration(days: temp.weekday-day-1));
          }
          print(temp.weekday);
          sheduleWeek.updateDate(temp);
        }

        return Container(
          color: Color(0xFFEBEDF0),
          child: Column(
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
                    print("sdfgds");
                    // print((i-1).toString() + " " + sheduleWeek.date.weekday.toString());
                    // int count = (sheduleWeek.date.weekday) - (i);
                    // print(count.toString());
                    sheduleWeek
                        .updateDate(sheduleWeek.date.add(Duration(days: 1)));
                  },
                  itemBuilder: ((BuildContext context, int i) {
                    return Container(
                      child: SheduleCard(
                          header: sheduleWeek.date.weekday.toString()),
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
