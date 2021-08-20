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
  bool login = false;

  @action
  void updateDate(DateTime date) {
    this.date = date;
  }

}

