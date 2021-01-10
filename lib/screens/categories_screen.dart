import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:my_todo_app/widgets/app_drawer.dart';
import 'package:my_todo_app/widgets/user_category_widget.dart';
import 'package:provider/provider.dart';
import '../model/category.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedColor;
  int index;

  @override
  void initState() {
    super.initState();
    selectedColor = 0;
    index = 0;
  }

  void _selectedColor(int val) {
    setState(() {
      selectedColor = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCats = Provider.of<Categories>(context);
    //final customCats = Provider.of<UserCategories>(context);
    TextEditingController _textFieldController = TextEditingController();
    // Color selectedColor = bgColor[0];

    return Scaffold(
      appBar: AppBar(
        title: Text('My To-do Categories'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // TODO: OnPressed Feature Not Done
              }),
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(children: <Widget>[
          Expanded(
            child: FlatButton(
              splashColor: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text(
                          'Category',
                        ),
                        content: StatefulBuilder(builder:
                            (BuildContext context, StateSetter stateSetter) {
                          return Container(
                            height: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.category,
                                          size: 20,
                                          color: bgColors[selectedColor],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: TextField(
                                              controller: _textFieldController,
                                              decoration: InputDecoration(
                                                hintText: 'Enter your category',
                                                // border: InputBorder.none,
                                                // focusedBorder: InputBorder.none,
                                                // enabledBorder: InputBorder.none,
                                                // errorBorder: InputBorder.none,
                                                // disabledBorder: InputBorder.none,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Chip(
                                    backgroundColor: bgColors[selectedColor],
                                    label: Text(
                                      'Color',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  // margin: EdgeInsets.only(top: 1),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, i) => Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: bgColors[i],
                                      ),
                                      //TODO: Convert List of Colors and name to a map
                                      child: Radio(
                                        activeColor: bgColors[i],
                                        value: i,
                                        groupValue: selectedColor,
                                        onChanged: (val) {
                                          stateSetter(() {
                                            _selectedColor(val);
                                            index = val;
                                          });
                                        },
                                      ),
                                    ),
                                    itemCount: bgColor.length,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        elevation: 7,
                        actions: [
                          IconButton(
                            icon: Icon(Icons.cancel_rounded),
                            onPressed: () {},
                            color: Colors.red,
                            iconSize: 30,
                            splashColor: Colors.redAccent,
                            splashRadius: 25,
                          ),
                          IconButton(
                            icon: Icon(Icons.check_circle),
                            onPressed: () {},
                            color: Colors.green,
                            iconSize: 30,
                            splashColor: Colors.greenAccent,
                            splashRadius: 25,
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white70,
                  ),
                  Text(
                    'Add Category',
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
          ),
          // Container(
          //   child: IconButton(
          //     color: Colors.white54,
          //     splashColor: Colors.black87,
          //     icon: Icon(Icons.add),
          //     onPressed: () {},
          //   ),
          // ),
        ]),
      ),
      body: ListView.builder(
          itemBuilder: (_, i) => UserCategories(
                icon: userCats.cat[i].icon,
                title: userCats.cat[i].title,
                numOfList: userCats.cat[i].numberOfList.toString(),
              ),
          itemCount: userCats.cat.length),
      // Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //   Center(
      //     child: Column(
      //       children: [
      //         Icon(Icons.hourglass_empty_rounded),
      //         Text("You have no ToDo List Category yet"),
      //       ],
      //     ),
      //   ),
      // ]),
    );
  }
}
