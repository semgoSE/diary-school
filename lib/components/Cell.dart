import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class CellClickable extends StatelessWidget {
  var click;
  final Widget child;

  CellClickable({Key key, this.child, this.click}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HexColor("#ffffff"),
      child: InkWell(child: child, onTap: click),
    );
  }
}

class Cell extends StatelessWidget {
  final Widget before;
  final Widget after;
  final String header;
  final String description;
  var click;

  Cell(
      {Key key,
      this.before,
      this.after,
      this.header,
      this.click,
      this.description})
      : super(key: key);

  Widget getBefore() {
    return (before == null
        ? Container()
        : Container(
            child: before,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          ));
  }

  Widget getAfter() {
    return (after == null
        ? Container()
        : Container(
            child: after,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          ));
  }

  @override
  Widget build(Object context) {
    return (CellClickable(
        click: click,
        child: Row(
          children: [
            Expanded(
                child: Row(children: [
              getBefore(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    child: Text(
                  header,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )),
                Container(
                  child: Text(
                    description,
                    style: TextStyle(color: HexColor("#818c99"), fontSize: 13),
                  ),
                )
              ])
            ])),
            getAfter()
          ],
        )));
  }
}
