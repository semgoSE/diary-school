import 'package:diary_app/components/icon.dart';
import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  double size;

  Spinner({ this.size = 60 });


  @override
  State<StatefulWidget> createState() => SpinnerState(size);
}

class SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? controller;
  double? size;

  SpinnerState(this.size);  

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    super.initState();
    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (RotationTransition(
        child: Container(
            height: size,
            width: size,
            child: MyIcon(type: IconType.svg, svgPath: "resource/icons/spinner.svg", size: size),
      ),
        turns: Tween(begin: 0.0, end: 1.0).animate(controller!)));
  }
}