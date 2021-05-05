import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Icon28 extends StatelessWidget {
  final String path;
  Color color = HexColor("#000000");
  double size = 28;

  Icon28({Key key, @required this.path, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      child: SvgPicture.asset(path, width: size, height: size),
    ));
  }
}
