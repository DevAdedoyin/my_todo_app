import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';

class TodoList extends StatefulWidget {
  final TaskWithCategory item;
  final TaskDao dao;

  TodoList({this.item, this.dao});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    // final todo = Provider.of<ToDoProvider>(context);

    return GestureDetector(
      onTap: () {
        return Navigator.of(context).pushNamed(ToDoListDetailsScreen.routeName);
      },
      child: Card(
        margin: EdgeInsets.all(7),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black,
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black, width: 2)),
          ),
          title: Text(widget.item.task.title),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today_outlined,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(widget.item.task.date),
              Icon(
                Icons.repeat,
                size: 15,
              ),
            ],
          ),
          trailing: Icon(
            Icons.star_border_outlined,
            size: 20,
          ),
        ),
      ),
    );
  }
}
