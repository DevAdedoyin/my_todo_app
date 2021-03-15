import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/add_list_widget.dart';
import 'package:my_todo_app/widgets/todo_list_screen_widgets/todo_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListScreen extends StatefulWidget {
  static const routeName = '/todo-list';

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool _isOld;
  int selectedColor;
  int index;

  // bool _value;

  // final prefs = await SharedPreferences.getInstance();

  saveSortState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', value);
  }

  Future<bool> readSortState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool('boolValue');
    int init = 0;
    if (init == 0) {
      init++;
      return true;
    }
    if (init == 1) {
      init = 1;
      return boolValue;
    }
    // _isOld = boolValue;
    // print('readSort ${_isOld.toString()}');
    return boolValue;
  }

  // bgColors;

  @override
  void initState() {
    super.initState();
    _isOld = true;
    selectedColor = 0;
    index = 0;
    // print('initState ${_isOld.toString()}');
  }

  void _selectedColor(int val) {
    setState(() {
      selectedColor = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context).settings.arguments as List;
    final _tasks = Provider.of<TaskDao>(context);
    final _cats = Provider.of<CategorieDao>(context);
    // readSortState();
    // print('build ${_isOld.toString()}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<bool>(
          builder: (_, snap) {
            return Container(
              child: StreamBuilder<List<Task>>(
                stream: snap.data
                    ? _tasks.getSpecificTaskASC(_args[2])
                    : _tasks.getSpecificTaskDSC(_args[2]),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data.isNotEmpty) {
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
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: Text('Sort by'),
                                                  actions: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          saveSortState(_isOld);
                                                        });

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )
                                                  ],
                                                  content: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            6,
                                                    child: StatefulBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            StateSetter
                                                                stateSetter) {
                                                      return Column(
                                                        children: [
                                                          for (int i = 0;
                                                              i < 2;
                                                              i++)
                                                            Expanded(
                                                              child: Card(
                                                                elevation: 30,
                                                                child: ListTile(
                                                                  title: i == 0
                                                                      ? Text(
                                                                          'New tasks')
                                                                      : Text(
                                                                          'Old tasks'),
                                                                  leading:
                                                                      Radio<
                                                                          bool>(
                                                                    value: i ==
                                                                            0
                                                                        ? false
                                                                        : true,
                                                                    groupValue:
                                                                        _isOld,
                                                                    activeColor:
                                                                        _args[
                                                                            1],
                                                                    onChanged:
                                                                        (value) {
                                                                      stateSetter(
                                                                          () {
                                                                        _isOld =
                                                                            value;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                        ],
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                              context: context,
                                            );
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.sort,
                                                color: Colors.black45,
                                              ),
                                              Text('Sort by')
                                            ],
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem(
                                          child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter
                                                            stateSetter) {
                                                  return AlertDialog(
                                                    title: Text('Change theme'),
                                                    content: Container(
                                                      height: 100,
                                                      width: double.maxFinite,
                                                      child: ListView.builder(
                                                        itemBuilder: (_, i) {
                                                          return Container(
                                                            height: 30,
                                                            width: 30,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  bgColors[i],
                                                            ),
                                                            child: Radio(
                                                              onChanged: (val) {
                                                                stateSetter(() {
                                                                  _selectedColor(
                                                                      val);
                                                                  index = val;
                                                                });
                                                              },
                                                              value: i,
                                                              groupValue:
                                                                  selectedColor,
                                                              activeColor:
                                                                  bgColors[i],
                                                            ),
                                                          );
                                                        },
                                                        itemCount:
                                                            bgColors.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .redAccent),
                                                          )),
                                                      FutureBuilder<Categorie>(
                                                          future:
                                                              _cats.getCategory(
                                                                  _args[2]),
                                                          builder:
                                                              (_, catSnap) {
                                                            return TextButton(
                                                                onPressed: () {
                                                                  _cats.updateCategorie(catSnap
                                                                      .data
                                                                      .copyWith(
                                                                          color:
                                                                              selectedColor));
                                                                  setState(() {
                                                                    _args[1] =
                                                                        bgColors[
                                                                            selectedColor];
                                                                  });

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'Okay'));
                                                          }),
                                                    ],
                                                  );
                                                });
                                              });
                                        },
                                        child: Container(
                                          child: Row(children: <Widget>[
                                            Icon(
                                              Icons.color_lens_outlined,
                                              color: Colors.black45,
                                            ),
                                            Text('Change Theme')
                                          ]),
                                        ),
                                      )),
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
                          }, childCount: snapshot.data.length ?? 0),
                        )
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
                                Expanded(
                                  flex: 10,
                                  child: Card(
                                    elevation: 15,
                                    child:
                                        Image.asset('assets/images/task.jpg'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                    elevation: 15,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child:
                                          Text('${_args[0]} have no task yet.'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
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
            );
          },
          future: readSortState(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showModalBottomSheet(
              isDismissible: true,
              context: context,
              // elevation: 10,
              isScrollControlled: true,
              builder: (context) => AddListWidget(_args[2]));
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
