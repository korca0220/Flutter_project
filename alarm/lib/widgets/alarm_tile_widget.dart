import 'package:flutter/material.dart';
import 'package:alarm/components/alarm.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AlarmTile extends StatefulWidget {
  final List<AlarmInfo> alarmInfo;
  final int index;

  AlarmTile({this.alarmInfo, this.index});

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  bool _isChecked;

  @override
  Widget build(BuildContext context) {
    if (widget.alarmInfo.isEmpty) {
      return ListTile(
        title: Text('등록된 알람이 없습니다.'),
        subtitle: Text('알람을 등록해주세요'),
      );
    }
    _isChecked = widget.alarmInfo[widget.index].isAlarmOn;
    final f = new DateFormat('yyyy-MM-dd H:mm');
    int counterForAlarmOn = 0;
    return ListTile(
      leading: Icon(
        Icons.alarm,
        size: 40,
      ),
      title: Text('${f.format(widget.alarmInfo[widget.index].alarmDate)}'),
      subtitle: Text('알람'),
      trailing: Switch(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value;
          });
          widget.alarmInfo[widget.index].isAlarmOn =
              !widget.alarmInfo[widget.index].isAlarmOn;
          var alarmId = widget.index;
          if (widget.alarmInfo[widget.index].isAlarmOn) {
            //TODO : add alarm
            print("TODO IF");
          } else {
            //TODO : alarm cancel
            print("TODO ELSE");
          }

          for (int i = 0; i < widget.alarmInfo.length; i++) {
            if (widget.alarmInfo[i].isAlarmOn) {
              counterForAlarmOn++;
            }
          }
          if (counterForAlarmOn == 0) {
            //TODO : stop foreground service
            print("TODO IF");
          } else {
            //TODO : start alaram
            print("TODO ELSE");
          }
        },
      ),
      onLongPress: () async {},
    );
  }
}
