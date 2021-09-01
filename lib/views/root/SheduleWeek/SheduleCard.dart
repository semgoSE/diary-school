import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleModalLessonInfo.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleSimpleCell.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SheduleCard extends StatelessWidget {

  final Timetable timetable;

  SheduleCard({ required this.timetable});

  String upperfirst(String text) {
   if (text.isEmpty) return text; 
   return '${text[0].toUpperCase()}${text.substring(1)}'; 
  }

  @override
  Widget build(BuildContext context) {
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
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
          SimpleCell(
            child: Text(
              upperfirst(DateFormat("EEEE", "ru_RU").format(sheduleWeek.date)),
              style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.bold)
            ),
          ),
          Container(height: 1, color: Color(0xFFDEDEDE)),
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
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SheduleSimpleCell(
            onClick: () {
              sheduleWeek.setLesson(timetable.lessons[i]);
              showBarModalBottomSheet(
                context: context,
                topControl: Container(),
                builder: (context) {
                  return SheduleModalLessonInfo();
                },
              );
            },
            before: Container(
              child: Row(
                children: [
                  TimeSheduleCard(
                    time_begin: timetable.lessons[i].timeBegin,
                    time_end: timetable.lessons[i].timeEnd,
                  ),
                  Container(
                    width: 2,
                    height: 42,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), color: Color(0xFF3f8ae0)),
                    margin: EdgeInsets.only(left: 8),
                  ),
                ],
              ),
            ),
            child: Text(
              timetable.lessons[i].subject.discipline,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          i == sheduleWeek.timetables[sheduleWeek.date.weekday-1].lessons.length-1 ? Container() : Container(height: 1, color: Color(0xFFDEDEDE))
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
      width: 40,
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
