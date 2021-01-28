import 'package:flutter/material.dart';
import 'package:alarm/components/const.dart';

class AlarmAlertDialog extends StatefulWidget {
  List<Widget> actions;
  String title;
  String content;
  AlarmAlertDialog({this.actions, this.title, this.content});

  @override
  _AlarmAlertDialogState createState() => _AlarmAlertDialogState();
}

class _AlarmAlertDialogState extends State<AlarmAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        style: kAlertActionTitleTextStyle,
      ),
      content: Text(
        widget.content,
        style: kAlertActionContentTextStyle,
      ),
      actions: widget.actions,
    );
  }
}
