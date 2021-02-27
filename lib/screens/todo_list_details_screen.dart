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
  // bool _isComplete;

  // @override
  // void initState() {
  //   super.initState();
  //   _isComplete = _isComplete;
  // }

  @override
  Widget build(BuildContext context) {
    //final todoDets = Provider.of<ToDoProvider>(context);

    print('Details Page Rebuilt');
    final textController = TextEditingController();
    final _args = ModalRoute.of(context).settings.arguments as List;
    final catDao = Provider.of<CategorieDao>(context);
    final _taskDao = Provider.of<TaskDao>(context);

    final Task taskItem = _args[0];

    bool _isComplete = _args[3];
    bool _isImportant = _args[4];

    print("VALUE " + _isComplete.toString());

    final TaskDao taskDao = _args[1];
    // int catId = taskItem.catid;

    @override
    void dispose() {
      textController.dispose();
      super.dispose();
    }

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
                delegate: SliverChildListDelegate([
                  StreamBuilder<Task>(
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        String steps = snapshot.data.steps;
                        if (steps == null) {
                          return Container(
                              margin: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Steps/Notes',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 1,
                                      maxLines: null,
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
                                    margin:
                                        EdgeInsets.only(bottom: 10, top: 10),
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
                                        if (textController.text.isNotEmpty)
                                          _taskDao.updateSteps(
                                              taskItem.copyWith(
                                                  steps: textController.text));
                                      },
                                    ),
                                  )
                                ],
                              ));
                        } else {
                          return Text("No Steps Yet");
                        }
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
