import 'package:alarm/components/alarm_data.dart';
import 'package:flutter/material.dart';
import 'package:alarm/components/alarm.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:alarm/widgets/notification_widgets.dart';
import 'package:logger/logger.dart';

class AlarmTile extends StatefulWidget {
  final int index;
  AlarmTile({this.index});

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  bool _isChecked;
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    final currentAlarm = Provider.of<AlarmData>(context).alarms;
    if (Provider.of<AlarmData>(context).alarms.isEmpty) {
      return ListTile(
        title: Text('등록된 알람이 없습니다.'),
        subtitle: Text('알람을 등록해주세요'),
      );
    }
    _isChecked = currentAlarm[widget.index].isAlarmOn;
    final f = new DateFormat('yyyy-MM-dd H:mm');
    int counterForAlarmOn = 0;
    return ListTile(
      leading: Icon(
        Icons.alarm,
        size: 40,
      ),
      title: Text('${f.format(currentAlarm[widget.index].alarmDate)}'),
      subtitle: Text('알람'),
      trailing: Switch(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value;
          });
          Provider.of<AlarmData>(context, listen: false)
              .alarms[widget.index]
              .isAlarmOn = !currentAlarm[widget.index].isAlarmOn;
          var _alarmId = currentAlarm[widget.index].alarmId;
          var _alarmDate = currentAlarm[widget.index].alarmDate;
          if (Provider.of<AlarmData>(context, listen: false)
              .alarms[widget.index]
              .isAlarmOn) {
            //TODO : add alarm
            dailyAtTimeNotification(_alarmDate, _alarmId);
            logger.d('add alarmId : ${_alarmId}');
          } else {
            //TODO : alarm cancel
            cancelNotification(_alarmId);
            logger.d('canceled alarmId : ${_alarmId}');
          }
        },
      ),
      onLongPress: () async {},
    );
  }
}
