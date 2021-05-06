import 'package:dairy_app/components/Icons.dart';
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

class ButtonPrimary extends StatelessWidget {
  var click;
  final String text;

  ButtonPrimary({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    // return Button(
    //     button: ElevatedButton(
    //   style: ButtonStyle(
    //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //           RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8),
    //       )),
    //       minimumSize:
    //           MaterialStateProperty.all<Size>(Size(double.infinity, 44)),
    //       backgroundColor:
    //           MaterialStateProperty.all<Color>(HexColor("#4986cc"))),
    //   onPressed: click,
    //   child: Text(text),
    // ));
    //
    return (Button(
        button: ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 44),
          primary: HexColor("#4986cc"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(text),
    )));
  }
}

// ignore: must_be_immutable
class ButtonCommerce extends StatelessWidget {
  var click;
  String text;

  ButtonCommerce({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return (Button(
        button: ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 44),
          primary: HexColor("#4bb34b"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(text),
    )));
  }
}

class ButtonOutline extends StatelessWidget {
  var click;
  String text;

  ButtonOutline({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return (Button(
        button: OutlinedButton(
      onPressed: click,
      style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, 44),
          side: BorderSide(color: HexColor("#4986cc")),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(
        text,
        style: TextStyle(color: HexColor("#4986cc")),
      ),
    )));
  }
}

class ButtonCell extends StatelessWidget {
  var click;
  IconData icon;
  String text;

  Widget getIcon() {
    return icon != null
        ? (Container(
            alignment: Alignment.center,
            child: Icon(icon),
            padding: EdgeInsets.all(12)))
        : Container();
  }

  ButtonCell({this.click, this.text, this.icon, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Button(
      button: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: HexColor("#4986cc"),
              elevation: 0,
              minimumSize: Size(double.infinity, 44),
              primary: HexColor("#ffffff"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: click,
          child: Row(children: [
            getIcon(),
            Text(
              text,
              style: TextStyle(color: HexColor("#4986cc"), fontSize: 16),
            )
          ])),
    ));
  }
}

class ButtonDestructive extends StatelessWidget {
  var click;
  String text;

  ButtonDestructive({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return (Button(
        button: ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 44),
          primary: HexColor("#e64646"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(text),
    )));
  }
}

class ButtonSecondary extends StatelessWidget {
  var click;
  String text;

  ButtonSecondary({this.text, this.click, Key key}) : super(key: key);

  @override
  Widget build(Object context) {
    return (Button(
        button: ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 44),
          primary: Color.fromARGB(5, 0, 28, 61),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Text(text),
    )));
  }
}
