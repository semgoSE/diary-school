import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SheduleModalLessonInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => SheduleModalLessonInfoState();
  
}

class SheduleModalLessonInfoState extends State {

  @override
  void initState() {
    super.initState();
    //TODO: получаем подробную информацию по уроку
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: PageScrollPhysics(),
        children: [
          AppBar(),
          Container()
        ],
      ),
    );
  }
    
}