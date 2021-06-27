import 'package:flutter/material.dart';

class SimpleCell extends StatelessWidget {
  Widget? before;
  Widget? after;
  Widget child;
  Widget? description;

  Function? onClick;

  SimpleCell(
      {this.before, this.after, required this.child, this.description, this.onClick});

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
                      child: child),
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
          Container(alignment: Alignment.centerLeft, child: child),
          Container(
              padding: EdgeInsets.only(top: 5.0),
              alignment: Alignment.centerLeft,
              child: description),
        ],
      ),
    );
  }
}
