import 'package:flutter/material.dart';
import 'package:alarm/components/picker.dart';
import 'package:alarm/components/alarm_info.dart';

class AddAlarmButton extends StatefulWidget {
  final List<AlarmInfo> alarmList;
  BuildContext context;
  AddAlarmButton({this.alarmList, this.context});

  @override
  _AddAlarmButtonState createState() => _AddAlarmButtonState();
}

class _AddAlarmButtonState extends State<AddAlarmButton> {
  bool _isAlarmOn = false;
  int _alarmId = 0;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  int _listIndex = 0;

  void addItemToList() {
    setState(() {
      _isAlarmOn = true;
      widget.alarmList.insert(_listIndex, AlarmInfo(_date, _time, _isAlarmOn));
      _listIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Add alarm',
        child: Icon(Icons.alarm_add),
        onPressed: () {
          selectDate(context).then((value) {
            _date = value;
            if (_date != null) {
              selectTime(context).then((value) {
                _time = value;
                if (_time != null) {
                  _date = DateTime(_date.year, _date.month, _date.day,
                      _time.hour, _time.minute);
                  addItemToList();
                } else {
                  _time = TimeOfDay.now();
                }
              });
            }
          });
        });
  }
}
