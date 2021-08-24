import 'package:flutter/material.dart';

class WeekDaySwitch extends StatelessWidget {
  final int activeEl;
  final Function onTap;

  WeekDaySwitch({
    required this.activeEl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Container()),
          _getWeekButton(0, "Пн"),
          Expanded(child: Container()),
          _getWeekButton(1, "Вт"),
          Expanded(child: Container()),
          _getWeekButton(2, "Ср"),
          Expanded(child: Container()),
          _getWeekButton(3, "Чт"),
          Expanded(child: Container()),
          _getWeekButton(4, "Пт"),
          Expanded(child: Container()),
          _getWeekButton(5, "Сб"),
          Expanded(child: Container()),
          _getWeekButton(6, "Вс"),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _getWeekButton(int id, String text) {
    return Container(
      decoration: BoxDecoration(
        color: id == activeEl ? Color(0xFFEBEDF0) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(id),
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: id == activeEl ? Color(0xFF3F8AE0) : Color(0xFF818C99),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
