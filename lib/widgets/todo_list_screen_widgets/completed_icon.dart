import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:provider/provider.dart';

class CompletenessIcon extends StatefulWidget {
  final int taskId;
  final Color color;

  CompletenessIcon({this.taskId, this.color});

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
          return snapshot.data.isImportant
              ? IconButton(
                  icon: Icon(
                    Icons.star,
                    size: 25.5,
                    color: widget.color,
                  ),
                  onPressed: () {
                    task.updateTaskImportance(
                        snapshot.data.copyWith(isImportant: false));
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.star_border_rounded,
                    size: 25.5,
                  ),
                  onPressed: () {
                    task.updateTaskImportance(
                        snapshot.data.copyWith(isImportant: true));
                  },
                );
        } else
          return Text('Ntn');
      },
    );
  }
}
