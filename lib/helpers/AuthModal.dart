import 'package:dairy_app/components/Title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AuthModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 128,
      child: Column(
        children: [
          Container(height: 48, child: TitleLevel_1("Авторизация")),
          Container(child: Spinner())
        ],
      ),
    ));
  }
}

class Spinner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SpinnerState();
}

class SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    super.initState();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (RotationTransition(
        child: Container(child: Icon(AntDesign.loading1, size: 60), height: 66),
        turns: Tween(begin: 0.0, end: 1.0).animate(controller)));
  }
}
