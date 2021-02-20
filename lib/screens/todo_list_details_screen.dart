import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/widgets/todo_list_details.dart';
import 'package:provider/provider.dart';

class ToDoListDetailsScreen extends StatefulWidget {
  static const routeName = '/todo-list-details';
  final bool isComplete;
  ToDoListDetailsScreen({this.isComplete});

  @override
  _ToDoListDetailsScreenState createState() => _ToDoListDetailsScreenState();
}

class _ToDoListDetailsScreenState extends State<ToDoListDetailsScreen> {
  bool _isComplete;

  // @override
  // void initState() {
  //   super.initState();
  //   _isComplete = _isComplete;
  // }

  @override
  Widget build(BuildContext context) {
    //final todoDets = Provider.of<ToDoProvider>(context);

    print('Details Page Rebuilt');

    final _args = ModalRoute.of(context).settings.arguments as List;
    final catDao = Provider.of<CategorieDao>(context);
    final _taskDao = Provider.of<TaskDao>(context);

    final Task taskItem = _args[0];

    bool _isComplete = _args[3];
    bool _isImportant = _args[4];

    print("VALUE " + _isComplete.toString());

    // final TaskDao taskDao = _args[1];
    // int catId = taskItem.catid;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: _args[2],
                title: FutureBuilder<Categorie>(
                  future: catDao.getCategory(taskItem.catid),
                  builder: (_, snapshot) {
                    return Text(
                      'Checking',
                      // snapshot.data.categoryTitle,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    );
                  },
                ),
                pinned: true,
                floating: true,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    height: 20,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(left: 10),
                    child: StreamBuilder<Task>(
                        stream: _taskDao.getTask(taskItem.taskid),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: _isComplete
                                      ? Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.lens_outlined,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                ),
                                _isComplete
                                    ? Text(
                                        taskItem.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    : Text(
                                        taskItem.title,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: _isImportant
                                      ? Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.star_border_rounded,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                ),
                              ],
                            );
                          } else {
                            return Text('No Category');
                          }
                        }),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([]),
              )
            ],
          ),
        ),
      ),
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
