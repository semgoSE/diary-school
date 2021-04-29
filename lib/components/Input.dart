import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Input extends StatelessWidget {
  String hints = "";

  Input({this.hints, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Container(
      child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: HexColor("#f2f3f5"),

              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green),
              //   borderRadius: BorderRadius.circular(25.7),
              // ),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              hintText: hints)),
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ));
  }
}
