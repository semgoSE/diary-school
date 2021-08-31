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
  @override
  void initState() {
    super.initState();
    //TODO: получаем подробную информацию по уроку
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
      return Container(
        child: ListView(
          physics: PageScrollPhysics(),
          children: [AppBar(title: Text(sheduleWeek.lesson!.subject.discipline)), Container()],
        ),
      );
    });
  }
}
