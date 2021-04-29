import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class PanelHeader extends PreferredSizeWidget {
  String header = "";
  bool is_back = true;

  PanelHeader({@required this.header, this.is_back, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return (AppBar(
      backgroundColor: HexColor("#ffffff"),
      title: Text(
        header,
        style: TextStyle(color: HexColor("#000000")),
      ),
      automaticallyImplyLeading: false,
    ));
  }
}
