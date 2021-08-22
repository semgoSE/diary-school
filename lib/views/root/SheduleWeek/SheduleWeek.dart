import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/card.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/cupertino.dart';
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
  
    return Observer(
      builder: (_) {
        SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context, listen: false);
        return Container(
          color: Color(0xFFEBEDF0),
          child: InfinityPageView(
            controller: infinityPageController,
            onPageChanged: (i) {
              print(i+1);
              // print((i-1).toString() + " " + sheduleWeek.date.weekday.toString());
              // int count = (sheduleWeek.date.weekday) - (i);
              // print(count.toString());
              sheduleWeek
                  .updateDate(sheduleWeek.date.add(Duration(days: 1)));
            },
            itemBuilder: ((BuildContext context, int i) {
              return Container(
                child: Card(header: sheduleWeek.date.weekday.toString()),
              );
            }),
            itemCount: 7,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
