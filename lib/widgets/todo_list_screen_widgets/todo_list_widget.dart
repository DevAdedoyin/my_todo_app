import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';

class TodoLists extends StatefulWidget {
  final Task item;
  final TaskDao dao;
  final Color color;

  TodoLists({
    this.item,
    this.dao,
    this.color,
  });

  @override
  _TodoListsState createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {
  bool isComplete;
  bool isImportant;

  @override
  void initState() {
    super.initState();
    isComplete = widget.item.isCompleted;
    isImportant = widget.item.isImportant;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: widget.color,
      ),
      confirmDismiss: (direction) {
        if (direction == DismissDirection.startToEnd) {
          return;
        } else {
          return;
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ToDoListDetailsScreen.routeName,
              arguments: [
                widget.item,
                widget.dao,
                widget.color,
                isComplete,
                isImportant
              ]);
        },
        child: Card(
          margin: EdgeInsets.all(7),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.black,
          child: ListTile(
            leading: isComplete
                ? IconButton(
                    icon: Icon(
                      Icons.check_circle_outline_outlined,
                      size: 30,
                      color: widget.color,
                    ),
                    splashRadius: 22,
                    onPressed: () {
                      widget.dao.updateCompleteness(
                          widget.item.copyWith(isCompleted: false));

                      setState(() {
                        isComplete = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.lens_outlined,
                      size: 30,
                    ),
                    splashRadius: 22,
                    onPressed: () {
                      widget.dao.updateCompleteness(
                          widget.item.copyWith(isCompleted: false));

                      setState(() {
                        isComplete = true;
                      });
                    },
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
                        Icons.notifications_outlined,
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
                      setState(() {
                        isImportant = false;
                      });

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
                      setState(() {
                        isImportant = true;
                      });

                      widget.dao.updateTaskImportance(
                          widget.item.copyWith(isImportant: true));
                    },
                  ),
          ),
        ),
      ),
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
