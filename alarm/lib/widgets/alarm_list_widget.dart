import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlarmListWidget extends StatefulWidget {
  @override
  _AlarmListWidgetState createState() => _AlarmListWidgetState();
}

class _AlarmListWidgetState extends State<AlarmListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          height: 70,
          child: Row(
            children: [
              Icon(
                Icons.alarm,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text('오후 7:30')
            ],
          ),
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
