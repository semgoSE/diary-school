import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Button extends StatelessWidget {
  Button({this.button, Key key}) : super(key: key);

  final Widget button;

  Widget build(BuildContext context) {
    return (Container(
      child: button,
      margin: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
    ));
  }
}

class PrimaryButton extends StatelessWidget {
  var click;
  final String text;

  PrimaryButton({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Button(
        button: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 44)),
          backgroundColor:
              MaterialStateProperty.all<Color>(HexColor("#4986cc"))),
      onPressed: click,
      child: Text(text),
    ));
  }
}

class CommerceButton extends StatelessWidget {
  var click;
  String text;

  CommerceButton({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Button(
        button: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 44)),
          backgroundColor:
              MaterialStateProperty.all<Color>(HexColor("#4bb34b"))),
      onPressed: click,
      child: Text(text),
    ));
  }
}

class OutlnButton extends StatelessWidget {
  var click;
  String text;

  OutlnButton({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Button(
        button: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            side: BorderSide(color: HexColor("#3f8ae0"), width: 1),
            borderRadius: BorderRadius.circular(8),
          )),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 44))),
      onPressed: click,
      child: Text(
        text,
        style: TextStyle(color: HexColor("#3f8ae0")),
      ),
    ));
  }
}
