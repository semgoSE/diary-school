import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/models/index.dart';
import 'package:flutter/material.dart';

class SheduleCard extends StatelessWidget {
  final String header;

  final Timetable timetable;

  SheduleCard({required this.header, required this.timetable});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0.0, 4.0),
            spreadRadius: 0.0,
            blurRadius: 4.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 12.0,
      ),
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            header,
            style: TextStyle(
              color: Color(0xFF383838),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: PageScrollPhysics(),
              itemBuilder: buildLesson,
              itemCount: timetable.lessons.length,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLesson(context, i) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleCell(
            before: Container(
              child: Row(
                children: [
                  TimeSheduleCard(
                    time_begin: timetable.lessons[i].timeBegin,
                    time_end: timetable.lessons[i].timeEnd,
                  ),
                  Container(
                    width: 3,
                    height: 42,
                    color: Color(0xFF3f8ae0),
                    margin: EdgeInsets.only(left: 8),
                  ),
                ],
              ),
            ),
            child: Text(
              timetable.lessons[i].subject.discipline,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(height: 1, color: Color(0xFFDEDEDE))
        ],
      ),
    );
  }
}

class TimeSheduleCard extends StatelessWidget {
  final String time_begin;
  final String time_end;

  TimeSheduleCard({required this.time_begin, required this.time_end});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time_begin,
            style: TextStyle(fontSize: 13),
          ),
          Text(
            time_begin,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
