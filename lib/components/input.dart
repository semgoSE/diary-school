import 'package:diary_app/redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Input extends StatefulWidget {
  String hint;
  TextInputAction textInputAction;
  Function function;
  bool isPass;
  FocusNode focusNode;

  Input(
    this.hint,
    this.textInputAction,
    this.function,
    this.isPass,
    this.focusNode,
  );

  @override
  _InputState createState() => _InputState(
        hint: hint,
        textInputAction: textInputAction,
        function: function,
        isPass: isPass,
        focusNode: focusNode,
      );
}

class _InputState extends State<Input> {
  String? hint;
  TextInputAction textInputAction;
  Function function;
  bool isPass;
  FocusNode focusNode;

  _InputState({
    this.hint,
    required this.textInputAction,
    required this.function,
    required this.isPass,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<StateStore, String>(
      converter: (store) => store.state.theme,
      builder: (context, theme) {
        return TextFormField(
          decoration: InputDecoration(
            filled: true,
            //fillColor: state.theme == "light" ? "" : "",
          ),
        );
      },
    );
  }
}

