import 'package:dairy_app/components/Icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Placeholder2 extends StatelessWidget {
  final String icon;
  final String description;

  const Placeholder2({Key key, this.icon, this.description}) : super(key: key);

  Widget getIcon() {
    return icon == null
        ? (Container(
            alignment: Alignment.center,
            child: Icon28(path: icon),
            margin: EdgeInsets.all(8)))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(),
          Container(
            child: Text(description,
                style: TextStyle(color: HexColor("#000000"), fontSize: 15)),
          )
        ],
      ),
    ));
  }
}
