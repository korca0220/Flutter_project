import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return InkWell(
              onLongPress: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("삭제 경고"),
                      content: Text("정말 삭제하시겠습니까?"),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              taskData.deleteTask(task);
                              Navigator.pop(context, "삭제");
                            },
                            child: Text("삭제")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context, "취소");
                            },
                            child: Text("취소")),
                      ],
                    );
                  },
                );
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                toggleCheckboxState: (checkboxState) {
                  taskData.toggleCheckbox(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
