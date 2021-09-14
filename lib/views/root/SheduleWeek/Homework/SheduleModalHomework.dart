import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/header.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/modal_panel_header.dart';
import 'package:diary_app/components/placeholder.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/homework.dart';
import 'package:diary_app/models/homeworks_get.dart';
import 'package:diary_app/views/root/SheduleWeek/Homework/HomeworkCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SheduleModalHomework extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleModalHomeworkState();
}

class SheduleModalHomeworkState extends State {
  @override
  void initState() {
    super.initState();
    getHomework();
  }

  void getHomework() async {
    Config config = Provider.of<Config>(context, listen: false);
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context, listen: false);
    UserApi api = UserApi(config.token, config.payloadToken);

    api.setPath("homeworks/get");
    api.setBody({
      "date": DateFormat("dd.MM.y", "ru_RU").format(sheduleWeek.date),
      "lesson_id": sheduleWeek.lesson!.lessonId,
    });

    var response = await api.request();
    print(response);
    if (response != false) {
      if (response['success']) {
        HomeworksGet res = HomeworksGet.fromJson(response['msg']);
        setState(() {
          sheduleWeek.updateHomeworkMy(res.myHomeworks);
          sheduleWeek.updateHomeworkOther(res.otherHomeworks);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
    return Observer(
      builder: (context) => WillPopScope(
        onWillPop: () {
          Future.delayed(const Duration(milliseconds: 600), () {
            sheduleWeek.updateHomeworkMy(null);
            sheduleWeek.updateHomeworkOther(null);
          });
          
          return Future.value(true);
        },
        child: CupertinoPageScaffold(
          navigationBar: ModalPanelHeader(
            appBar: AppBar(
              title: Text("Домашние задание"),
              automaticallyImplyLeading: false,
              textTheme: Theme.of(context).textTheme,
              elevation: 1,
              actions: [
                IconButton(
                    icon: CustomIcon(
                      type: IconType.svg,
                      svgPath: "resource/icons/add_outline_28.svg",
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/create_homework");
                    })
              ],
            ),
          ),
          // appBar:
          child: ListView(
            shrinkWrap: true,
            controller: ModalScrollController.of(context),
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                color: Theme.of(context).backgroundColor,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Header(header: "Личное"),
                      alignment: Alignment.centerLeft,
                    ),
                    sheduleWeek.myHomeworks == null
                        ? Container(
                            child: Spinner(
                              size: 30,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: sheduleWeek.myHomeworks!.length != 0
                                ? Column(
                                    children: sheduleWeek.myHomeworks!
                                        .map((e) =>
                                            HomeworkCard(name: e.task.text))
                                        .toList(),
                                  )
                                : CustomPlaceholder(
                                    child: "Пока домашки нет",
                                  ),
                          ),
                    Container(
                      child: Header(header: "Общее"),
                      alignment: Alignment.centerLeft,
                    ),
                    sheduleWeek.otherHomeworks == null
                        ? Container(
                            child: Spinner(
                              size: 30,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: sheduleWeek.otherHomeworks!.length != 0
                                ? Column(
                                    children: sheduleWeek.otherHomeworks!
                                        .map((e) =>
                                            HomeworkCard(name: e.task.text))
                                        .toList(),
                                  )
                                : CustomPlaceholder(
                                    child: "Пока домашки нет",
                                  ),
                          ),
                    // HomeworkCard(name: "Семен Головин",)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
