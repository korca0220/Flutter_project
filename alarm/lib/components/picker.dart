import 'package:flutter/material.dart';

Future<DateTime> selectDate(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2099),
  );
}

Future<TimeOfDay> selectTime(BuildContext context) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}
