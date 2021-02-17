import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
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

    print('Details Page Rebuilt');

    final _args = ModalRoute.of(context).settings.arguments as List;
    final catDao = Provider.of<CategorieDao>(context);
    final _taskDao = Provider.of<TaskDao>(context);

    final Task taskItem = _args[0];
    // final TaskDao taskDao = _args[1];
    int catId = taskItem.catid;

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
                      return Text(snapshot.data.categoryTitle);
                    },
                  ),
                  pinned: true,
                  floating: true,
                  expandedHeight: 100,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          StreamBuilder<Task>(
                            stream: _taskDao.getTask(taskItem.taskid),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data.isCompleted
                                    ? IconButton(
                                        icon: Icon(
                                          Icons.check_circle,
                                          size: 13,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          print('For True: ' +
                                              snapshot.data.isCompleted
                                                  .toString());

                                          _taskDao.updateCompleteness(Task(
                                                  taskid: snapshot.data.taskid)
                                              .copyWith(isCompleted: false));
                                        },
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.lens_outlined,
                                          size: 13,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          print('For False: ' +
                                              snapshot.data.isCompleted
                                                  .toString());

                                          _taskDao.updateCompleteness(
                                              Task(taskid: snapshot.data.taskid)
                                                  .copyWith(isCompleted: true));
                                        },
                                      );
                              } else {
                                return Text('No Data');
                              }
                            },
                          ),
                          Text(
                            taskItem.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.star_border_rounded,
                              size: 14,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  )),
              // SliverLayoutBuilder(
              //   builder: (context, constraint) {
              //     constraint.
              //     return ToDoDetailsWidget();
              //   },
              // )
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
