import 'package:diary_app/components/button.dart';
import 'package:diary_app/components/icon.dart';
import 'package:diary_app/components/simple_cell.dart';
import 'package:diary_app/components/spinner.dart';
import 'package:diary_app/mobX/config_app.dart';
import 'package:diary_app/mobX/shedule_week.dart';
import 'package:diary_app/models/index.dart';
import 'package:diary_app/views/root/SheduleWeek/Homework/SheduleModalHomework.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleModalLessonInfo.dart';
import 'package:diary_app/views/root/SheduleWeek/SheduleSimpleCell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SheduleCard extends StatelessWidget {
  final Timetable timetable;

  SheduleCard({required this.timetable});

  String upperfirst(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  Widget? getStatusDay(SheduleWeekTypeDay typeDay) {
    switch (typeDay) {
      case SheduleWeekTypeDay.load:
        return Spinner(
          colorMode: ColorMode.placeholder,
          size: 16,
        );
      case SheduleWeekTypeDay.work:
        // TODO: Handle this case.
        break;
      case SheduleWeekTypeDay.weekends:
        // TODO: Handle this case.
        break;
      case SheduleWeekTypeDay.holliday:
        // TODO: Handle this case.
        break;
      case SheduleWeekTypeDay.offline:
        return CustomIcon(
            svgPath: "resource/icons/download_cancel_outline_28.svg",
            type: IconType.svg,
            colorMode: ColorMode.placeholder,
            size: 28);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SheduleWeek sheduleWeek = Provider.of<SheduleWeek>(context);
    Config config = Provider.of<Config>(context);
    return Observer(
        builder: (_) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: config.customTheme.background,
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
                vertical: 4.0,
                horizontal: 12.0,
              ),
              margin: EdgeInsets.all(16.0),
              child: sheduleWeek.typeDay == SheduleWeekTypeDay.work ||
                      sheduleWeek.typeDay == SheduleWeekTypeDay.load ||
                      sheduleWeek.typeDay == SheduleWeekTypeDay.offline
                  ? buildCardLesson(sheduleWeek)
                  : getCardPlaceholder(sheduleWeek.typeDay, context),
            ));
  }

  Widget? getCardPlaceholder(SheduleWeekTypeDay typeDay, BuildContext context) {
    Config config = Provider.of<Config>(context, listen: false);
    switch (typeDay) {
      case SheduleWeekTypeDay.weekends:
        return Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: CustomIcon(
                  colorMode: ColorMode.placeholder,
                  type: IconType.svg,
                  svgPath: "resource/icons/calendar_outline_28.svg",
                  size: 56,
                ),
              ),
              Container(
                child: Text(
                  "Сегодня выходной",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Text(
                  "Отдохни в этот день",
                  style: TextStyle(
                    color: config.customTheme.text_placeholder,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        );
      case SheduleWeekTypeDay.holliday:
        return Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("Каникулы"),
        );

      case SheduleWeekTypeDay.work:
        // TODO: Handle this case.
        break;
      case SheduleWeekTypeDay.load:
        // TODO: Handle this case.
        break;
      case SheduleWeekTypeDay.offline:
        // TODO: Handle this case.
        break;
    }
  }

  Column buildCardLesson(SheduleWeek sheduleWeek) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SimpleCell(
            child: Text(
                upperfirst(
                    DateFormat("EEEE", "ru_RU").format(sheduleWeek.date)),
                style: GoogleFonts.manrope(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            after: getStatusDay(sheduleWeek.typeDay)),
        Container(height: 1, color: Color(0xFFDEDEDE)),
        Expanded(
          child: ListView.builder(
            physics: PageScrollPhysics(),
            itemBuilder: buildLesson,
            itemCount: timetable.lessons.length,
          ),
        )
      ],
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: Color(0xFF3f8ae0)),
                    margin: EdgeInsets.only(left: 8),
                  ),
                ],
              ),
            ),
            after: Container(
              child: CustomButton(
                size: SizeCustomButton.s,
                child: "Д/з",
                mode: ModeCustomButton.secondary,
                click: () {
                  sheduleWeek.setLesson(timetable.lessons[i]);
                  showBarModalBottomSheet(
                    context: context,
                    topControl: Container(),
                    builder: (context) {
                      return SheduleModalHomework();
                    },
                  );
                },
              ),
              width: 56,
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
          i ==
                  sheduleWeek.timetables[sheduleWeek.date.weekday - 1].lessons
                          .length -
                      1
              ? Container()
              : Container(height: 1, color: Color(0xFFDEDEDE))
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
            time_end,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
