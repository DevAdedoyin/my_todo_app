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
        onPressed: () {
          return showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10),
                                child: TextField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Add a task',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(Icons.save_alt_rounded),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FlatButton(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Icon(Icons.alarm),
                                    ),
                                    Text('Remind me')
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FlatButton(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Icon(Icons.repeat),
                                    ),
                                    Text('Repeat')
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FlatButton(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Icon(Icons.calendar_today_rounded),
                                    ),
                                    Text('Set due date')
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
        },
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
