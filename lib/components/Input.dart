import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Input extends StatefulWidget {
  String hints = "";
  var controller;
  TextInputAction textInputAction;
  var onFieldSubmitted;
  bool is_hide = false;

  Input({
    this.hints,
    this.is_hide = false,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<StatefulWidget> createState() => InputState();
}

class InputState extends State<Input> {
  String hints = "";
  var controller;
  TextInputAction textInputAction;
  var onFieldSubmitted;
  bool is_hide;

  @override
  void initState() {
    hints = widget.hints;
    controller = widget.controller;
    textInputAction = widget.textInputAction;
    onFieldSubmitted = widget.onFieldSubmitted;
    is_hide = widget.is_hide;
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: TextFormField(
          textInputAction: this.textInputAction,
          controller: controller,
          obscureText: is_hide,
          enableSuggestions: !is_hide,
          autocorrect: !is_hide,
          onFieldSubmitted: onFieldSubmitted,
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
