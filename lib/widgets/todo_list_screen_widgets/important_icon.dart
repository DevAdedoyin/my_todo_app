import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:provider/provider.dart';

class ImportanceIcon extends StatefulWidget {
  final int taskId;
  final Color color;
  final Task task;
  final double size;

  ImportanceIcon({this.taskId, this.color, this.task, this.size});

  @override
  _ImportanceIconState createState() => _ImportanceIconState();
}

class _ImportanceIconState extends State<ImportanceIcon> {
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
                      size: widget.size,
                      color: widget.color,
                    ),
                    onPressed: () {
                      task.updateTaskImportance(
                          widget.task.copyWith(isImportant: false));
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.star_border_rounded,
                      size: widget.size,
                    ),
                    onPressed: () {
                      task.updateTaskImportance(
                          widget.task.copyWith(isImportant: true));
                    },
                  );
          } else {
            return Text('');
          }
        });
  }
}
