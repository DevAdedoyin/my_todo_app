import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Row(children: <Widget>[
                        Icon(Icons.color_lens),
                        Text('Rename list')
                      ]),
                    ),
                    PopupMenuItem(
                      child: Row(children: <Widget>[
                        Icon(Icons.sort),
                        Text('Sort by')
                      ]),
                    ),
                    PopupMenuItem(
                      child: Row(children: <Widget>[
                        Icon(Icons.color_lens_outlined),
                        Text('Change Theme')
                      ]),
                    ),
                    PopupMenuItem(
                      child: Row(children: <Widget>[
                        Icon(Icons.delete),
                        Text('Delete list')
                      ]),
                    ),
                  ])
        ],
      ),
      body: ,
    );
  }
}
