import 'package:flutter/material.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/widgets/todo_list_details.dart';
import 'package:provider/provider.dart';

class ToDoListDetailsScreen extends StatefulWidget {
  static const routeName = '/todo-list-details';
  @override
  _ToDoListDetailsScreenState createState() => _ToDoListDetailsScreenState();
}

class _ToDoListDetailsScreenState extends State<ToDoListDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //final todoDets = Provider.of<ToDoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        flexibleSpace: Text("Space Testing"),
      ),
      body: ToDoDetailsWidget(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 40,
          padding: EdgeInsets.only(left: 15, right: 7),
          child: Row(
            children: [
              Text('Created on Wed, Jan 7'),
              Spacer(),
              Icon(Icons.delete)
            ],
          ),
        ),
      ),
    );
  }
}
