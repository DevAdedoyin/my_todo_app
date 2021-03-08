import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/add_list_widget.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/todo_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';

class TodoListScreen extends StatefulWidget {
  static const routeName = '/todo-list';

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context).settings.arguments as List;
    final _tasks = Provider.of<TaskDao>(context);
    print('TodoList Rebuilt!!!');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<List<Task>>(
            stream: _tasks.getSpecificTask(_args[2]),
            builder: (_, snapshot) {
              if (snapshot.data.isNotEmpty) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: _args[1],
                      floating: true,
                      pinned: true,
                      expandedHeight: 120,
                      actions: [
                        PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert_outlined,
                              color: Colors.white,
                            ),
                            itemBuilder: (_) => [
                                  PopupMenuItem(
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.sort,
                                        color: Colors.black45,
                                      ),
                                      Text('Sort by')
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.color_lens_outlined,
                                        color: Colors.black45,
                                      ),
                                      Text('Change Theme')
                                    ]),
                                  ),
                                ])
                      ],
                      flexibleSpace: Row(
                        children: [
                          Container(
                            width: 200,
                            child: FlexibleSpaceBar(
                              title: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  _args[0],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              centerTitle: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((_, index) {
                      final item = snapshot.data[index];
                      return TodoLists(
                        item: item,
                        dao: _tasks,
                        color: _args[1],
                      );
                    }, childCount: snapshot.data.length))
                  ],
                );
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: [
                            Card(
                              elevation: 15,
                              child: Image.asset('assets/images/task.jpg'),
                            ),
                            Card(
                              elevation: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('${_args[0]} have no task yet.'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Card(
                                elevation: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                      'Click on the Floating Button below to add task(s) to ${_args[0]}'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showModalBottomSheet(
              isDismissible: true,
              context: context,
              elevation: 10,
              isScrollControlled: true,
              builder: (context) => GestureDetector(
                    child: AddListWidget(_args[2]),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    behavior: HitTestBehavior.opaque,
                  ));
        },
        backgroundColor: _args[1],
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
