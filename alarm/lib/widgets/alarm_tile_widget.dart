import 'package:alarm/components/alarm_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alarm/widgets/alarm_alert_dialog.dart';
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
    var _alarmId = currentAlarm[widget.index].alarmId;
    var _alarmDate = currentAlarm[widget.index].alarmDate;
    var _alarm = currentAlarm[widget.index];
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
              .isAlarmOn = _isChecked;
          if (Provider.of<AlarmData>(context, listen: false)
              .alarms[widget.index]
              .isAlarmOn) {
            if (_alarmDate.isBefore(DateTime.now())) {
              logger.d('date time is before');
              Provider.of<AlarmData>(context, listen: false)
                  .alarms[widget.index]
                  .isAlarmOn = false;
              AlarmAlertDialog(
                title: '알람 삭제',
                content: '이미 지난 알람입니다\n알람을 삭제합니다',
                actions: [
                  CupertinoDialogAction(
                    child: Text('OK'),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Provider.of<AlarmData>(context, listen: false)
                          .deleteAlarm(_alarm);
                      cancelNotification(_alarmId);
                    },
                  ),
                ],
              );
            } else {
              dailyAtTimeNotification(_alarmDate, _alarmId);
              logger.d('add alarmId : ${_alarmId}');
            }
          } else {
            cancelNotification(_alarmId);
            logger.d('canceled alarmId : ${_alarmId}');
          }
        },
      ),
      onLongPress: () async {
        showDialog(
          context: context,
          builder: (context) => AlarmAlertDialog(
            title: '알람 삭제',
            content: '알람을 삭제하시겠습니까?',
            actions: [
              TextButton(
                onPressed: () {
                  cancelNotification(_alarmId);
                  Provider.of<AlarmData>(context, listen: false)
                      .deleteAlarm(_alarm);
                  Navigator.pop(context);
                },
                child: Text('YES'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("NO"),
              )
            ],
          ),
        );
      },
    );
  }
}
