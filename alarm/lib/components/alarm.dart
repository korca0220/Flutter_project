import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime _alarmDate;
  TimeOfDay _alarmTime;
  bool _isAlarmOn;
  int _alarmId;

  AlarmInfo(DateTime date, TimeOfDay time, bool on, int id) {
    this._alarmDate = date;
    this._alarmTime = time;
    this._isAlarmOn = on;
    this._alarmId = id;
  }

  set alarmDate(DateTime date) {
    _alarmDate = date;
  }

  set alarmTime(TimeOfDay time) {
    _alarmTime = time;
  }

  set isAlarmOn(bool on) {
    _isAlarmOn = on;
  }

  DateTime get alarmDate {
    return _alarmDate;
  }

  TimeOfDay get alarmTime {
    return _alarmTime;
  }

  bool get isAlarmOn {
    return _isAlarmOn;
  }

  int get alarmId {
    return _alarmId;
  }
}
