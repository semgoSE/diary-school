import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Widget? child;
  String? mode;
  Function? click;

  Button({this.mode, this.click, this.child});

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    ));
  }
}
