import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/models/homework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeworkCard extends StatelessWidget {
  Homework homework;
  bool isAuthor;

  // String task;

  HomeworkCard({required this.homework, required this.isAuthor});

  @override
  Widget build(BuildContext context) {
    Config config = Provider.of<Config>(context);

    return Observer(
        builder: (context) => Container(
              margin: EdgeInsets.symmetric(vertical: 8),
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
              child: Column(
                children: [
                  isAuthor
                      ? homework.source == "BOT"
                          ? SimpleCell(
                              onClick: () {},
                              description: Text("Бот", style: TextStyle(color: config.customTheme.text_placeholder),),
                              child: Text(
                                "Тоби",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              before: CircleAvatar(
                                radius: 20,
                                child: Image.asset("resource/images/bot.png"),
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                              ),
                            )
                          : SimpleCell(
                              onClick: () {},
                              child: Text(
                              homework.author!.firstName! +
                                  " " +
                                  homework.author!.lastName!,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ))
                      : Container(),
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      homework.task.text,
                      style: TextStyle(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ));
  }
}
