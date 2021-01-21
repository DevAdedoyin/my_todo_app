import 'package:flutter/material.dart';

class ToDoDetailsWidget extends StatefulWidget {
  @override
  _ToDoDetailsWidgetState createState() => _ToDoDetailsWidgetState();
}

// TODO REBUILD PAGE
class _ToDoDetailsWidgetState extends State<ToDoDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 7,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 50,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 40,
                      ),
                      Text('Add step')
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 7,
            shadowColor: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  height: 50,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.alarm),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Remind me'),
                      )
                    ],
                  ),
                ),
                Divider(),
                FlatButton(
                  height: 50,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.alarm),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Remind me'),
                      )
                    ],
                  ),
                ),
                Divider(),
                FlatButton(
                  height: 50,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.alarm),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Remind me'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 7,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 150,
                    child: Text(
                      'Add note',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
