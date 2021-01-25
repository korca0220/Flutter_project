import 'package:alarm/widgets/alarm_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:alarm/components/alarm_info.dart';

class AlarmListWidget extends StatefulWidget {
  final List<AlarmInfo> alarmList;
  AlarmListWidget({this.alarmList});

  @override
  _AlarmListWidgetState createState() => _AlarmListWidgetState();
}

class _AlarmListWidgetState extends State<AlarmListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: widget.alarmList.length,
      itemBuilder: (context, index) {
        if (widget.alarmList.isEmpty) {
          return Text('Alarm is empty!');
        }
        return AlarmTile(
          alarmInfo: widget.alarmList,
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
  }
}
