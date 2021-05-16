import 'package:dairy_app/components/Title.dart';
import 'package:dairy_app/redux/gv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NewsFeed extends StatefulWidget {
  var store;
  NewsFeed(this.store);
  @override
  State<StatefulWidget> createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  var store;
  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(Object context) {
    store.dispatch(ActionSetAppBar(AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Новости",
        style: TextStyle(color: Colors.black),
      ),
    )));
    return (ListView(children: [
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            TitleLevel_1("Обновления 1.1 уже скоро"),
            Container(
              child: Text(
                  "Оно появится в конце июня. Мы поправим баги и сделвем еще несколько фич",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: HexColor("#99a2ad"),
                    fontSize: 14,
                  )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(12, 12, 0, 12),
                child: Row(children: [
                  Text("Автор: admin",
                      style:
                          TextStyle(color: HexColor("#99a2ad"), fontSize: 12))
                ]))
          ],
        ),
      )
    ]));
  }
}
