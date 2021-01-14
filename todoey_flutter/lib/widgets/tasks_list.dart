import 'package:flutter/material.dart';
import 'task_tail.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(
          text: 'test1',
        ),
        TaskTile(
          text: 'test2',
        ),
        TaskTile(
          text: 'test3',
        ),
      ],
    );
  }
}
