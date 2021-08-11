import 'package:flutter/cupertino.dart';
import 'package:infinity_page_view/infinity_page_view.dart';

class SheduleWeek extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SheduleWeekState();
}

class SheduleWeekState extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InfinityPageView(
        itemBuilder: ((BuildContext context, int i) {
          return Container();
        }),
        itemCount: 7,
      ),
    );
  }
  
}
