import 'package:flutter/material.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/widgets/todo_list_widget.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatefulWidget {
  static const routeName = '/todo-list';
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final _todo = Provider.of<ToDoProvider>(context);
    final _title = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // automaticallyImplyLeading: true,
            backgroundColor: Colors.blue,
            floating: true,
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: Row(
              children: [
                Container(
                  width: 200,
                  child: FlexibleSpaceBar(
                    title: Text(_title.toString()),
                    centerTitle: true,
                    // collapseMode: CollapseMode.pin,
                  ),
                ),
                Spacer(),
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, i) {
              return TodoList(i);
            }, childCount: _todo.todo.length),
          )
        ],
      ),
      //  TodoList(),
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
