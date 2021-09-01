import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SheduleModalLessonInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleModalLessonInfoState();
}

class SheduleModalLessonInfoState extends State {
  bool assessmentLoading = true; //загрузка оценок
  bool seeTeacher = false; //учитель / заглушка

  @override
  void initState() {
    super.initState();
    //TODO: получаем подробную информацию по уроку
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: Text(sheduleWeek.lesson!.subject.discipline),
              textTheme: Theme.of(context).textTheme,
              automaticallyImplyLeading: false,
            ),
            getGroup(
              width,
              height,
              "Оценки",
              Container(
                margin: EdgeInsets.only(
                  bottom: height * 0.03,
                ),
                child: assessmentLoading
                    ? Spinner(
                        size: height * 0.03,
                      )
                    : Center(
                        child: Text(
                          "Здесь пока пусто",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
              true,
            ),
            getGroup(
              width,
              height,
              "Учитель",
              Container(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: height * 0.05,
                  ),
                  child: seeTeacher
                      ? Container()
                      : Center(
                          child: Text(
                            "Здесь пока пусто",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
              ),
              true,
            ),
            getGroup(
              width,
              height,
              "Подробнее",
              Container(),
              false,
            ),
            Container(
              height: 20,
            ),
          ],
        ),
      );
    });
  }

  Widget getGroup(
    double width,
    double height,
    String groupName,
    Widget child,
    bool seporator,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          margin: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.04,
            bottom: height * 0.034,
          ),
          child: Text(
            groupName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        child,
        seporator
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                height: 2.0,
                decoration: BoxDecoration(
                    color: Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.circular(5.0)),
              )
            : Container(),
      ],
    );
  }
}
