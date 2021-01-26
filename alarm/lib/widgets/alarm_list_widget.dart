import 'package:alarm/widgets/alarm_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:alarm/components/alarm_data.dart';
import 'package:provider/provider.dart';

class AlarmListWidget extends StatefulWidget {
  @override
  _AlarmListWidgetState createState() => _AlarmListWidgetState();
}

class _AlarmListWidgetState extends State<AlarmListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmData>(
      builder: (context, alarmData, child) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: alarmData.alarmCount,
          itemBuilder: (context, index) {
            if (alarmData.alarms.isEmpty) {
              return Text('Alarm is empty!');
            }
            return AlarmTile(
              alarmInfo: alarmData.alarms,
              index: index,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.blue,
              height: 2.0,
            );
          },
        );
      },
    );
  }
}
