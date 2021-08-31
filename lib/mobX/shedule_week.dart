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
  Lesson? lesson;

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
}

