// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shedule_week.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SheduleWeek on _SheduleWeek, Store {
  final _$dateAtom = Atom(name: '_SheduleWeek.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$timetablesAtom = Atom(name: '_SheduleWeek.timetables');

  @override
  List<Timetable> get timetables {
    _$timetablesAtom.reportRead();
    return super.timetables;
  }

  @override
  set timetables(List<Timetable> value) {
    _$timetablesAtom.reportWrite(value, super.timetables, () {
      super.timetables = value;
    });
  }

  final _$lessonAtom = Atom(name: '_SheduleWeek.lesson');

  @override
  Lesson? get lesson {
    _$lessonAtom.reportRead();
    return super.lesson;
  }

  @override
  set lesson(Lesson? value) {
    _$lessonAtom.reportWrite(value, super.lesson, () {
      super.lesson = value;
    });
  }

  final _$typeDayAtom = Atom(name: '_SheduleWeek.typeDay');

  @override
  SheduleWeekTypeDay get typeDay {
    _$typeDayAtom.reportRead();
    return super.typeDay;
  }

  @override
  set typeDay(SheduleWeekTypeDay value) {
    _$typeDayAtom.reportWrite(value, super.typeDay, () {
      super.typeDay = value;
    });
  }

  final _$loginAtom = Atom(name: '_SheduleWeek.login');

  @override
  bool get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(bool value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$myHomeworksAtom = Atom(name: '_SheduleWeek.myHomeworks');

  @override
  List<Homework>? get myHomeworks {
    _$myHomeworksAtom.reportRead();
    return super.myHomeworks;
  }

  @override
  set myHomeworks(List<Homework>? value) {
    _$myHomeworksAtom.reportWrite(value, super.myHomeworks, () {
      super.myHomeworks = value;
    });
  }

  final _$otherHomeworksAtom = Atom(name: '_SheduleWeek.otherHomeworks');

  @override
  List<Homework>? get otherHomeworks {
    _$otherHomeworksAtom.reportRead();
    return super.otherHomeworks;
  }

  @override
  set otherHomeworks(List<Homework>? value) {
    _$otherHomeworksAtom.reportWrite(value, super.otherHomeworks, () {
      super.otherHomeworks = value;
    });
  }

  final _$_SheduleWeekActionController = ActionController(name: '_SheduleWeek');

  @override
  void updateHomeworkMy(List<Homework>? _myHomeworks) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.updateHomeworkMy');
    try {
      return super.updateHomeworkMy(_myHomeworks);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateHomeworkOther(List<Homework>? _otherHomeworks) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.updateHomeworkOther');
    try {
      return super.updateHomeworkOther(_otherHomeworks);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDate(DateTime _date) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.updateDate');
    try {
      return super.updateDate(_date);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLesson(Lesson _lesson) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.setLesson');
    try {
      return super.setLesson(_lesson);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTimetables(List<Timetable> _timetables) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.updateTimetables');
    try {
      return super.updateTimetables(_timetables);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTypeDay(SheduleWeekTypeDay _typeDay) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.setTypeDay');
    try {
      return super.setTypeDay(_typeDay);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
timetables: ${timetables},
lesson: ${lesson},
typeDay: ${typeDay},
login: ${login},
myHomeworks: ${myHomeworks},
otherHomeworks: ${otherHomeworks}
    ''';
  }
}
