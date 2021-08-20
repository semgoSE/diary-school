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

  final _$_SheduleWeekActionController = ActionController(name: '_SheduleWeek');

  @override
  void updateDate(DateTime date) {
    final _$actionInfo = _$_SheduleWeekActionController.startAction(
        name: '_SheduleWeek.updateDate');
    try {
      return super.updateDate(date);
    } finally {
      _$_SheduleWeekActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
date: ${date},
login: ${login}
    ''';
  }
}
