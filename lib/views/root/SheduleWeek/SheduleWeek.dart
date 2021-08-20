
import 'package:diary_app/components/card.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:infinity_page_view/infinity_page_view.dart';
import 'package:provider/provider.dart';
//import 'package:infinite_view_pager/infinite_view_pager.dart';

class SheduleWeekView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleWeekState();
}

class SheduleWeekState extends State {

  InfinityPageController infinityPageController = InfinityPageController();



  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Color(0xFFEBEDF0),
      child: InfinityPageView(
        controller: infinityPageController,
        onPageChanged: (i) {
          SheduleWeek date = Provider.of<SheduleWeek>(context, listen: false);
          int count = date.date.weekday - i;
          Provider.of<SheduleWeek>(context, listen: false).updateDate(new DateTime.now().add(Duration(days: count)));
        },
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
