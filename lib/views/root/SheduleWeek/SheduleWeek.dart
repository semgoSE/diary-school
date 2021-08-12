import 'package:diary_app/components/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:infinity_page_view/infinity_page_view.dart';
//import 'package:infinite_view_pager/infinite_view_pager.dart';

class SheduleWeek extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleWeekState();
}

class SheduleWeekState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEBEDF0),
      child: InfinityPageView(
        itemBuilder: ((BuildContext context, int i) {
          return Container(
            child: Card(),
          );
        }),
        itemCount: 7,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
