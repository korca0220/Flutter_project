import 'package:flutter/material.dart';

class AddAlarmButton extends StatefulWidget {
  @override
  _AddAlarmButtonState createState() => _AddAlarmButtonState();
}

class _AddAlarmButtonState extends State<AddAlarmButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add alarm',
      child: Icon(Icons.alarm_add),
      onPressed: () {},
    );
  }
}
