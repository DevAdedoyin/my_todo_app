import 'dart:convert';

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
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Details Page Rebuilt');

    final _args = ModalRoute.of(context).settings.arguments as List;
    final catDao = Provider.of<CategorieDao>(context);
    final _taskDao = Provider.of<TaskDao>(context);

    final Task taskItem = _args[0];

    bool _isComplete = _args[3];
    bool _isImportant = _args[4];

    print("VALUE " + _isComplete.toString());

    final TaskDao taskDao = _args[1];

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: 80,
                backgroundColor: _args[2],
                title: FutureBuilder<Categorie>(
                  future: catDao.getCategory(taskItem.catid),
                  builder: (_, snapshot) {
                    return Text(
                      'Checking',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    );
                  },
                ),
                pinned: true,
                floating: false,
                expandedHeight: 110,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    : Text(
                                        taskItem.title,
                                        style: TextStyle(
                                            fontSize: 14,
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
                delegate: SliverChildListDelegate([
                  StreamBuilder<Task>(
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            margin: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'Steps/Notes',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                StreamBuilder<Task>(
                                  stream:
                                      _taskDao.getTask(snapshot.data.taskid),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      List<String> step;

                                      if (snapshot.data.steps != null) {
                                        step = snapshot.data.steps.split(",");
                                        print(step);
                                        return ConstrainedBox(
                                          constraints: BoxConstraints(
                                              minHeight: 40, maxHeight: 400),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: step.length,
                                            itemBuilder: (_, index) {
                                              return Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 15,
                                                    child: Text(
                                                      (index + 1).toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    backgroundColor: _args[2],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      step[index],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  IconButton(
                                                      icon: Icon(Icons.delete),
                                                      onPressed: () {
                                                        step.removeAt(index);
                                                        String stepsSeperator =
                                                            step.join(",");
                                                        _taskDao.updateSteps(
                                                            snapshot.data.copyWith(
                                                                steps:
                                                                    stepsSeperator));
                                                      },
                                                      color: _args[2])
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              child: Text(
                                                '0',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              backgroundColor: _args[2],
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text('Steps 0'))
                                          ],
                                        );
                                      }
                                    } else {
                                      return Text('No Data Yet');
                                    }
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: TextField(
                                    textInputAction: TextInputAction.done,
                                    controller: textController,
                                    keyboardType: TextInputType.text,
                                    minLines: 1,
                                    maxLines: null,
                                    onSubmitted: (value) {
                                      setState(() {
                                        if (textController.text.isNotEmpty &&
                                            snapshot.data.steps.toString() !=
                                                null) {
                                          String stepsSeperator =
                                              snapshot.data.steps.toString() +
                                                  textController.text +
                                                  ',';
                                          print(stepsSeperator);
                                          _taskDao.updateSteps(snapshot.data
                                              .copyWith(steps: stepsSeperator));
                                        }
                                      });
                                      textController.clear();
                                    },
                                    onChanged: (changedVal) {
                                      //TODO Update value of step in the database
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          'Please Enter Your Steps/Notes Here!!!',
                                      hintStyle: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  child: RaisedButton(
                                    color: _args[2],
                                    child: SizedBox(
                                      width: 80,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Save',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.save,
                                                size: 20,
                                              ),
                                              onPressed: () {},
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (textController.text.isNotEmpty &&
                                            snapshot.data.steps.toString() !=
                                                null) {
                                          String stepsSeperator =
                                              snapshot.data.steps.toString() +
                                                  textController.text +
                                                  ',';
                                          print(stepsSeperator);
                                          _taskDao.updateSteps(snapshot.data
                                              .copyWith(steps: stepsSeperator));
                                        }
                                      });
                                      textController.clear();
                                    },
                                  ),
                                ),
                                Card(
                                  elevation: 20,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.notifications),
                                        title: Text('Due Date'),
                                        subtitle: Text(snapshot.data.date),
                                        trailing: Icon(Icons.lens_outlined),
                                      ),
                                      Divider(),
                                      ListTile(
                                        leading: Icon(Icons.notifications),
                                        title: Text('Due Time'),
                                        subtitle: Text(snapshot.data.time),
                                        trailing: Icon(Icons.lens_outlined),
                                      ),
                                      Divider(),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: ListTile(
                                          leading: Icon(Icons.notifications),
                                          title: Text('Remind Me On'),
                                          subtitle:
                                              Text(snapshot.data.frequency),
                                          trailing: Icon(Icons.lens_outlined),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      } else {
                        return Text("No Data");
                      }
                    },
                    stream: taskDao.getTask(taskItem.taskid),
                  ),
                ]),
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
              Text('Created on ' + taskItem.dateCreated),
              Spacer(),
              Icon(Icons.delete)
            ],
          ),
        ),
      ),
    );
  }
}
