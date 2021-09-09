import 'package:diary_app/api/user/UserApi.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/homework.dart';
import 'package:diary_app/models/homeworks_get.dart';
import 'package:diary_app/views/root/SheduleWeek/Homework/HomeworkCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SheduleModalHomework extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleModalHomeworkState();
}

class SheduleModalHomeworkState extends State {

  List<Homework> my_homeworks = [];
  List<Homework> other_homeworks = [];


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
      "date": sheduleWeek.date.toString(),
      "lesson_id": sheduleWeek.lesson!.lessonId,
    });

    var response = await api.request();
    print(response);
    if(response != false) {
      if(response['success']) {
        HomeworksGet res =  HomeworksGet.fromJson(response['msg']);
        setState(() {
          my_homeworks = res.my;
          other_homeworks = res.other;
        });
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    // SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
    return SingleChildScrollView(
      physics: PageScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text("Домашние задание"),
            actions: [
              IconButton(icon: CustomIcon(type: IconType.svg, svgPath: "resource/icons/add_outline_28.svg",), onPressed: () {
                Navigator.pushNamed(context, "/create_homework");
              }) 
            ],
            textTheme: Theme.of(context).textTheme,
            automaticallyImplyLeading: false,

          ),
          Container(
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: Column(children: [
              ...my_homeworks.map((e) => HomeworkCard(name: e.task.text)).toList(),
              // HomeworkCard(name: "Семен Головин",)
            ],),
          ),  
        ],
      ),
    );
  }
}
