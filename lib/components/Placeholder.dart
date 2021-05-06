import 'package:dairy_app/components/Icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Placeholder2 extends StatelessWidget {
  final String icon;
  final String description;

  const Placeholder2({Key key, this.icon, this.description}) : super(key: key);

  Widget getIcon() {
    return icon != null
        ? (Container(
            alignment: Alignment.center,
            child: Icon28(path: icon),
            margin: EdgeInsets.all(8)))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          // getIcon(),
          Container(
            alignment: Alignment.center,
            child: Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: HexColor("#818c99"),
                    fontSize: 14,
                    textBaseline: TextBaseline.ideographic)),
          )
        ],
      ),
    ));
  }
}
