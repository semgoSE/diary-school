import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Widget? child;
  bool disable;
  String? mode;
  Function? click;

  Button({this.mode, this.click, this.child, this.disable = false});

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: !disable
                  ? getBachgroundColorByMode()
                  : getBachgroundColorByMode().withOpacity(0.7)),
          child: child,
        ),
      ),
    ));
  }

  Color getBachgroundColorByMode() {
    switch (mode) {
      case "primary":
        return Colors.black;

      default:
        return Colors.white;
    }
  }
}
