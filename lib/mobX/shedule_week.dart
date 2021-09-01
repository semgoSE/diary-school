import 'package:diary_app/models/index.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'shedule_week.g.dart';

// This is the class used by rest of your codebase
class SheduleWeek = _SheduleWeek with _$SheduleWeek;

// The store-class
abstract class _SheduleWeek with Store {

  @observable
  DateTime date = new DateTime.now();

  @observable
  List<Timetable> timetables = []; 

  @observable
  Lesson? lesson;

  @observable
  SheduleWeekTypeDay typeDay = SheduleWeekTypeDay.work;

  @observable
  bool login = false;

  @action
  void updateDate(DateTime _date) {
    this.date = _date;
  }

  @action
  void setLesson(Lesson _lesson) {
    this.lesson = _lesson;
  }

  @action
  void updateTimetables(List<Timetable> _timetables) {
    this.timetables = _timetables;
  }

  @action
  void setTypeDay(SheduleWeekTypeDay _typeDay) {
    this.typeDay = _typeDay;
  }


}


enum SheduleWeekTypeDay {
  work, weekends, holliday, load, offline
}
