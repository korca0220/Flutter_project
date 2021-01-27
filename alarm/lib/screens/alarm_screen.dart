import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
        ),
      ),
    );
  }
}
