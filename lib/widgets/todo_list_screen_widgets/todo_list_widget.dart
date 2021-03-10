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
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

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
        child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Expanded(
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) {
        if (direction == DismissDirection.startToEnd) {
          return showDialog(
            builder: (_) {
              return AlertDialog(
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      textController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      widget.dao.updateTask(
                          widget.item.copyWith(title: textController.text));
                      textController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                title: Text('Rename ${widget.item.title}?'),
                content: TextField(
                  decoration: InputDecoration(
                      hintText: 'Please enter your title update here!!!',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  maxLength: 30,
                  controller: textController,
                  onChanged: (String value) {
                    String result;
                    result = value;
                    if (result.length > 30) {
                      result = result.substring(0, 30);
                      textController.text = result;
                      textController.selection = TextSelection.fromPosition(
                          TextPosition(offset: result.length));
                    }
                  },
                  onSubmitted: (newTitle) {
                    widget.dao.updateTask(
                        widget.item.copyWith(title: textController.text));
                    textController.clear();
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            context: context,
          );
        } else {
          return showDialog(
            builder: (_) {
              return AlertDialog(
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      widget.dao.deleteTask(widget.item);

                      Navigator.of(context).pop();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('${widget.item.title} deleted.'),
                      ));
                    },
                  ),
                ],
                content: Text(
                    'Are you sure you want to delete ${widget.item.title}?'),
                title: Text('Delete ${widget.item.title}'),
              );
            },
            context: context,
          );
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
                      setState(() {
                        isComplete = false;
                      });

                      widget.dao.updateCompleteness(
                          widget.item.copyWith(isCompleted: false));
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.lens_outlined,
                      size: 30,
                    ),
                    splashRadius: 22,
                    onPressed: () {
                      setState(() {
                        isComplete = true;
                      });

                      widget.dao.updateCompleteness(
                          widget.item.copyWith(isCompleted: true));
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
            trailing: isImportant
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
