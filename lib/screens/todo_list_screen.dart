import 'package:flutter/material.dart';
import 'package:my_todo_app/widgets/todo_list_widget.dart';

class TodoListScreen extends StatefulWidget {
  static const routeName = '/todo-list';
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
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
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        splashColor: Colors.white54,
        elevation: 5,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
