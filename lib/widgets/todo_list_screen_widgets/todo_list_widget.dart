import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/completed_icon.dart';

class TodoList extends StatefulWidget {
  final Task item;
  final TaskDao dao;
  final Color color;

  TodoList({this.item, this.dao, this.color});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    // final todo = Provider.of<ToDoProvider>(context);
    // final String taskTitle = widget.item.title;
    // final String catTitle = widget.item.catid;

    return GestureDetector(
      onTap: () {
        return Navigator.of(context).pushNamed(ToDoListDetailsScreen.routeName,
            arguments: [widget.item, widget.dao, widget.color]);
      },
      child: Card(
        margin: EdgeInsets.all(7),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black,
        child: ListTile(
            leading: CompletenessIcon(
              taskId: widget.item.catid,
              color: widget.color,
            ),
            title: Text(
              widget.item.title,
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(
                  Icons.calendar_today_outlined,
                  size: 15,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(widget.item.date),
                SizedBox(
                  width: 8,
                ),
                widget.item.frequency == null
                    ? Icon(
                        Icons.repeat,
                        size: 15,
                      )
                    : Icon(
                        Icons.alarm_on,
                        size: 15,
                      ),
              ],
            ),
            trailing: widget.item.isImportant
                ? IconButton(
                    icon: Icon(
                      Icons.star,
                      size: 25.5,
                      color: widget.color,
                    ),
                    onPressed: () {
                      widget.dao.updateTaskImportance(
                          widget.item.copyWith(isImportant: false));
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.star_border_rounded,
                      size: 25.5,
                    ),
                    onPressed: () {
                      widget.dao.updateTaskImportance(
                          widget.item.copyWith(isImportant: true));
                    },
                  )),
      ),
    );
  }
}
