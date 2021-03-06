import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/form_item.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/screen_spinner.dart';
import 'package:diary_app/components/select_mimicry.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/components/textarea.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CreateHomework extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateHomeworkState();
}

class DateChooseView {
  int lesson_id;
  String date;
  String header;

  DateChooseView(
      {required this.lesson_id, required this.date, required this.header});
}

class CreateHomeworkState extends State {
  TextEditingController _text = TextEditingController();
  TextEditingController _date = TextEditingController();
  int? lesson_id;

  List<DateChooseView> dates = [];

  void initState() {
    super.initState();
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context, listen: false);
    _date.text = DateFormat("dd.MM.y", "ru_RU").format(sheduleWeek.date);
    lesson_id = sheduleWeek.lesson!.lessonId;
  }

  void generateDate() {
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context, listen: false);
    List<DateChooseView> _dates = [];
    _dates.add(DateChooseView(
        lesson_id: sheduleWeek.lesson!.lessonId,
        header: "Этот урок",
        date: DateFormat("dd.MM.y", "ru_RU").format(sheduleWeek.date)));

    for (int i = 1; i < 30; i++) {
      DateTime date = sheduleWeek.date;
      date = date.add(Duration(days: i));
      if (date.weekday == 6 || date.weekday == 7) {
      } else {
        int index = sheduleWeek.timetables[date.weekday - 1].lessons.indexWhere(
            (element) =>
                element.subject.subjectId ==
                sheduleWeek.lesson!.subject.subjectId);
        if (index > -1) {
          _dates.add(DateChooseView(
              lesson_id: sheduleWeek
                  .timetables[date.weekday - 1].lessons[index].lessonId,
              header: _dates.length == 1
                  ? "Следующий урок"
                  : DateFormat("dd.MM.y", "ru_RU").format(date),
              date: DateFormat("dd.MM.y", "ru_RU").format(date)));
          if (_dates.length == 5) break;
        }
      }
    }

    setState(() {
      dates = _dates;
    });
  }

  void showChooseDate() {
    Config config = Provider.of<Config>(context, listen: false);
    generateDate();
    showBarModalBottomSheet(
        context: context,
        topControl: Container(),
        builder: (context) => SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      title: Text("Выберите дату"),
                      automaticallyImplyLeading: false,
                      textTheme: Theme.of(context).textTheme,
                    ),
                    ...dates
                        .map((e) => SimpleCell(
                              onClick: () {
                                Navigator.pop(context);
                                _date.text = e.date;
                                lesson_id = e.lesson_id;
                              },
                              child: Text(
                                e.header,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              description: Text(e.date,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          config.customTheme.text_secondary)),
                            ))
                        .toList()
                  ],
                ),
              ),
            ));
  }

  void addHomework() async {
    Config config = Provider.of<Config>(context, listen: false);
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context, listen: false);

    if(_text.text == "") {
        final snackBar = SnackBar(
          content: Text("Введите текст задания"),
          duration: const Duration(seconds: 7),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
    } 

    if(_date.text == "") {
        final snackBar = SnackBar(
          content: Text("Вы не указали дату"),
          duration: const Duration(seconds: 7),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
    }


    showDialog(
      context: context,
      builder: (context) => WillPopScope(
          child: ScreenSpinner(), onWillPop: () => Future.value(false)),
    );

    UserApi api = UserApi(config.token, config.payloadToken);
    api.setPath("homework/add");
    api.setBody({
      "date": _date.text,
      "text": _text.text,
      "lesson_id": lesson_id,
    });
    print(api.body);
    var response = await api.request();
    print(response);
    if(response != false) {
      if(response['success']) {
        Homework homework = Homework.fromJson(response['msg']);
        List<Homework>? myHomeworks = sheduleWeek.myHomeworks;
        if(myHomeworks == null) 
          myHomeworks = [homework];
        else
          myHomeworks.add(homework);
        sheduleWeek.updateHomeworkMy(myHomeworks);
        Navigator.pop(context);
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: Text("Задание успешно добавлено"),
          duration: const Duration(seconds: 7),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        _date.text = "";
        _text.text = "";
      } else {
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Config config = Provider.of<Config>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Добавить задание"),
        actions: [
          IconButton(
              icon: CustomIcon(
                svgPath: "resource/icons/done_outline_28.svg",
                type: IconType.svg,
              ),
              onPressed: addHomework)
        ],
      ),
      body: Container(
        child: ListView(
          physics: PageScrollPhysics(),
          children: [
            FormItem(
              top: "Текст задания",
              child: Textarea(
                controller: _text,
              ),
            ),
            FormItem(
              top: "Дата",
              child: SelectMimicry(
                controller: _date,
                click: showChooseDate,
              ),
            ),
            SimpleCell(
                child: Text(
                  "Опубликовать",
                  style: TextStyle(fontSize: 17),
                ),
                before: Container(
                    margin: EdgeInsets.only(left: 6),
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      activeColor: config.customTheme.accent,
                      value: true,
                      onChanged: (bool) {},
                    )))
          ],
        ),
      ),
    );
  }
}
