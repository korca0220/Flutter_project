import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime _alarmDate;
  TimeOfDay _alarmTime;
  bool _isAlarmOn;

  AlarmInfo(DateTime date, TimeOfDay time, bool on){
   this._alarmDate = date;
   this._alarmTime = time;
   this._isAlarmOn = on;
  }

  set AlarmDate(DateTime date){
    _alarmDate = date;
  }
  set AlarmTime(TimeOfDay time){
    _alarmTime = time;
  }

  set AlarmOn(bool on){
    _isAlarmOn = on;
  }

  get AlarmDate(){
    return _alarmDate;
  }

  get AlarmTime(){
    return _alarmTime;
  }

  get isAlarmOn(){
    return _isAlarmOn;
  }

}
