import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Input extends StatefulWidget {

  String hint;
  TextInputAction textInputAction;
  Function function;
  bool isPass;
  FocusNode focusNode;

  Input(this.hint, this.textInputAction, this.function, this.isPass, this.focusNode);

  @override
  _InputState createState() => _InputState(hint: hint, textInputAction: textInputAction, function: function, isPass: isPass, focusNode: focusNode);
}

class _InputState extends State<Input> {

  String ?hint;
  TextInputAction textInputAction;
  Function function;
  bool isPass;
  FocusNode focusNode;
  
  Map<String, Color> lightTheme = {
    "field_background": Color(0xFFf2f3f5),
    "field_border": Color(0x12000000),
    "field_error_background": Color(0xFFfaebeb),
    "field_error_border": Color(0xFFe64646),
    "field_text_placeholder": Color(0xFF818c99),
    "field_valid_border": Color(0xFF4bb34b),
  };

  Map<String, Color> nightTheme = {
    "field_background": Color(0xFF232324),
    "field_border": Color(0x12FFFFFF),
    "field_error_background": Color(0xFF522e2e),
    "field_error_border": Color(0xFFFF5c5c),
    "field_text_placeholder": Color(0xFF76787a),
    "field_valid_border": Color(0xFF4bb34b),
  };

  _InputState({this.hint, required this.textInputAction, required this.function, required this.isPass, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: 
      ),
    );
  }
}
