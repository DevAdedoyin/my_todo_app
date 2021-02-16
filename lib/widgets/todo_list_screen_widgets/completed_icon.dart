import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:provider/provider.dart';

class CompletenessIcon extends StatefulWidget {
  final int taskId;
  final Color color;
  final Task task;

  CompletenessIcon({this.taskId, this.color, this.task});

  @override
  _CompletenessIconState createState() => _CompletenessIconState();
}

class _CompletenessIconState extends State<CompletenessIcon> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskDao>(context);

    return StreamBuilder<Task>(
      stream: task.getTask(widget.taskId),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.isCompleted
              ? IconButton(
                  icon: Icon(
                    Icons.check_circle_rounded,
                    size: 25.5,
                    color: widget.color,
                  ),
                  onPressed: () {
                    task.updateCompleteness(
                        widget.task.copyWith(isCompleted: false));
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.lens_outlined,
                    size: 25.5,
                  ),
                  onPressed: () {
                    task.updateCompleteness(
                        widget.task.copyWith(isCompleted: true));
                  },
                );
        } else
          return Text('Ntn');
      },
    );
  }
}
