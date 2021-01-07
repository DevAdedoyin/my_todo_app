import 'package:flutter/material.dart';

class ToDoDetailsWidget extends StatefulWidget {
  @override
  _ToDoDetailsWidgetState createState() => _ToDoDetailsWidgetState();
}

class _ToDoDetailsWidgetState extends State<ToDoDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            children: [
              Row(
                children: [Icon(Icons.add), Text('Add step')],
              ),
            ],
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.alarm_on,
                  ),
                  Column(
                    children: [Text('Remind me'), Divider()],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  Column(
                    children: [Text('Add due date'), Divider()],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.repeat),
                  Column(
                    children: [
                      Text('Repeat'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: Container(
            child: Text('Add note'),
          ),
        ),
      ],
    );
  }
}
