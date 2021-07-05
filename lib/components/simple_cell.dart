import 'package:flutter/material.dart';

class SimpleCell extends StatelessWidget {

  Widget? before;
  Widget? after;
  String child;
  Widget? description;
  double? textSize;

  Function? onClick;

  SimpleCell({
    this.before,
    this.after,
    required this.child,
    this.description,
    this.onClick,
    this.textSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    bool _isDescription = false;
    if (description != null) {
      _isDescription = true;
    }
    return InkWell(
      onTap: () => onClick!(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Row(children: [
          Container(child: before),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: _isDescription
                  ? ColumnCenter()
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        child,
                        style: TextStyle(
                          color: null,
                          fontSize: textSize,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0), child: after),
        ]),
      ),
    );
  }

  Widget ColumnCenter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                child,
                style: TextStyle(
                  color: null,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 5.0),
              alignment: Alignment.centerLeft,
              child: description),
        ],
      ),
    );
  }
}
