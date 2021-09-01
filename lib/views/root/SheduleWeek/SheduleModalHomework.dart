import 'package:diary_app/components/icon.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SheduleModalHomework extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleModalHomeworkState();
}

class SheduleModalHomeworkState extends State {
  @override
  void initState() {
    super.initState();
    //TODO: получаем подробную информацию по уроку
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
              IconButton(icon: CustomIcon(type: IconType.svg, svgPath: "resource/icons/add_outline_28.svg",), onPressed: () {}) 
            ],
            textTheme: Theme.of(context).textTheme,
            automaticallyImplyLeading: false,
          ),
          
        ],
      ),
    );
  }
}
