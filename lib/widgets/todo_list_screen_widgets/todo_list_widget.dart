import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  final int index;
  TodoList(this.index);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<ToDoProvider>(context);
    return Container(
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
          title: Text(todo.todo.values.toList()[widget.index].title),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today_outlined,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(DateFormat.MONTH_DAY),
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