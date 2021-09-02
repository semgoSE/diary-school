import 'package:diary_app/components/simple_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeworkCard extends StatelessWidget {

  String? photo;
  String name;
  String? desciption;

  // String task;

  HomeworkCard({ required this.name, this.photo, this.desciption });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0.0, 4.0),
            spreadRadius: 0.0,
            blurRadius: 4.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 12.0,
      ),
      child: Column(children: [
        SimpleCell(child: Text(name, style: TextStyle(),))
      ],),
    ));
  }
}
