import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/add_list_widget.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/todo_list_widget.dart';
import 'package:provider/provider.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<List<Task>>(
            stream: _tasks.getSpecificTask(_args[2]),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      // automaticallyImplyLeading: true,
                      backgroundColor: _args[1],
                      floating: true,
                      pinned: true,
                      expandedHeight: 120,
                      flexibleSpace: Row(
                        children: [
                          Container(
                            width: 200,
                            child: FlexibleSpaceBar(
                              title: Text(
                                _args[0],
                                style: TextStyle(color: Colors.white),
                              ),
                              centerTitle: true,
                              // collapseMode: CollapseMode.pin,
                            ),
                          ),
                          Spacer(),
                          PopupMenuButton(
                              icon: Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                              ),
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
                        delegate: SliverChildBuilderDelegate((_, index) {
                      // final newitem = snapshot.data.where((id) {
                      //   return id.categorie.id == _args[2];
                      // }).toList();
                      // final item = newitem[index];
                      // print('Check: ' + );
                      final item = snapshot.data[index];
                      return TodoList(
                        item: item,
                        dao: _tasks,
                      );
                    }, childCount: snapshot.data.length))
                  ],
                );
              } else {
                return Center(
                  child: Text('You have no task yet'),
                );
              }
            },
          ),
        ),
      ),
      //  TodoList(),
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
