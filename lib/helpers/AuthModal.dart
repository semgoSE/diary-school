import 'package:dairy_app/components/Title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class AuthModal extends StatelessWidget {
  final Widget child;
  final String header;
  final double height;

  const AuthModal({Key key, this.child, this.header, this.height = 128})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      height: height,
      child: Column(
        children: [
          Container(height: 48, child: TitleLevel_1(header)),
          Container(child: child)
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
        child: Container(
            child: Icon(
              AntDesign.loading1,
              size: 60,
              color: HexColor("#3f8ae0"),
            ),
            height: 66),
        turns: Tween(begin: 0.0, end: 1.0).animate(controller)));
  }
}
