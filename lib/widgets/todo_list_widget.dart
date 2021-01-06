import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<ToDoProvider>(context);
    return Container(
      child: ListView.builder(
        itemBuilder: (_, i) => Card(
          child: ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text(todo.todo[i].title),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.calendar_today_outlined),
                Text(DateFormat.MONTH_DAY),
                Icon(Icons.repeat),
              ],
            ),
            trailing: Icon(Icons.star_border_outlined),
          ),
        ),
        itemCount: todo.todo.length,
      ),
    );
  }
}
