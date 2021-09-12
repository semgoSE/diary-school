import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void checkDay(BuildContext context) async {
  SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context, listen: false);
  DateTime date = sheduleWeek.date;

  //проеряем день на выходной
  if (date.weekday >= 6) {
    sheduleWeek.setTypeDay(SheduleWeekTypeDay.weekends);
  } else {
    //проверка на каникулы
    sheduleWeek.setTypeDay(SheduleWeekTypeDay.load);

    var connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Config config =
          Provider.of<Config>(context, listen: false);
      UserApi api =
          new UserApi(config.token, config.payloadToken);

      api.setPath("shedule-holliday/check-day");
      api.setBody({"date": date.toString()});
      var response = await api.request();

      if (response != false) {
        if (response['success']) {
          CheckDay res = CheckDay.fromJson(response['msg']);
          if (sheduleWeek.date ==
              DateTime.parse(res.date)) {
            sheduleWeek.setTypeDay(SheduleWeekTypeDay.work);
          }
        } else {
          if (sheduleWeek.date ==
              DateTime.parse(response['msg']['date'])) {
            sheduleWeek
                .setTypeDay(SheduleWeekTypeDay.holliday);
          }
        }
      } else {
        sheduleWeek.setTypeDay(SheduleWeekTypeDay.offline);
      }
    } else {
      sheduleWeek.setTypeDay(SheduleWeekTypeDay.offline);
    }
  }
}
