import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';

class TodoLists extends StatelessWidget {
  final Task item;
  final TaskDao dao;
  final Color color;

  TodoLists({this.item, this.dao, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(7),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.black,
      child: ListTile(
          leading: item.isCompleted
              ? IconButton(
                  icon: Icon(
                    Icons.check_circle_outline_outlined,
                    size: 30,
                    color: color,
                  ),
                  splashRadius: 22,
                  onPressed: () {
                    dao.updateCompleteness(item.copyWith(isCompleted: false));
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.lens_outlined,
                    size: 30,
                  ),
                  splashRadius: 22,
                  onPressed: () {
                    dao.updateCompleteness(item.copyWith(isCompleted: true));
                  },
                ),
          title: Text(
            item.title,
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
              Text(item.date),
              SizedBox(
                width: 8,
              ),
              item.frequency == null
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
          trailing: item.isImportant
              ? IconButton(
                  icon: Icon(
                    Icons.star,
                    size: 25.5,
                    color: color,
                  ),
                  onPressed: () {
                    dao.updateTaskImportance(item.copyWith(isImportant: false));
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.star_border_rounded,
                    size: 25.5,
                  ),
                  onPressed: () {
                    dao.updateTaskImportance(item.copyWith(isImportant: true));
                  },
                )),
    );
  }
}

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

    return Text('');
  }
}
