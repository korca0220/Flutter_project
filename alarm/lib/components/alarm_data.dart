import 'dart:collection';

import 'package:alarm/components/alarm.dart';
import 'package:flutter/cupertino.dart';

class AlarmData extends ChangeNotifier {
  List<AlarmInfo> _alarms = [];

  int get alarmCount {
    return _alarms.length;
  }

  UnmodifiableListView<AlarmInfo> get alarms {
    return UnmodifiableListView(_alarms);
  }

  void addAlarmList(AlarmInfo alarm) {
    _alarms.add(alarm);
    notifyListeners();
  }

  void insertAlarmList(int index, AlarmInfo alarm) {
    _alarms.insert(index, alarm);
    notifyListeners();
  }

  void deleteAlarm(AlarmInfo alarm) {
    _alarms.remove(alarm);
    notifyListeners();
  }
}
