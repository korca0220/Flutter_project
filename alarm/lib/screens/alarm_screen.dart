import 'package:flutter/material.dart';
import 'package:alarm/widgets/notification_widgets.dart';
import 'package:provider/provider.dart';
import 'package:alarm/components/alarm_data.dart';
import 'package:alarm/components/alarm.dart';

class AlarmScreen extends StatefulWidget {
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmData>(builder: (context, alarmData, index) {
      List<AlarmInfo> dateList = [];
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Alarm Off'),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(150.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 60.0,
            icon: Icon(
              Icons.alarm_off,
            ),
            onPressed: () {
              for (int i = 0; i < alarmData.alarmCount; i++) {
                if (alarmData.alarms[i].isAlarmOn) {
                  dateList.add(alarmData.alarms[i]);
                }
              }
              dateList.sort((a, b) => a.alarmDate.compareTo(b.alarmDate));
              print(alarmData.alarmCount);
              var _latestTimeData = dateList[0];
              print(_latestTimeData.alarmDate);
              cancelNotification(_latestTimeData.alarmId);
              alarmData.deleteAlarm(_latestTimeData);
              print(alarmData.alarmCount);
              Navigator.pop(context);
            },
          ),
        ),
      );
    });
  }
}
