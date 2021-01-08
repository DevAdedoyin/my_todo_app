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
  @override
  Widget build(BuildContext context) {
    final userCats = Provider.of<Categories>(context);
    TextEditingController _textFieldController = TextEditingController();
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
                        content: Container(
                          height: 200,
                          child: Column(
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
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: _textFieldController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    'Enter your category'),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              ListView.builder(
                                itemBuilder: (_, i) => Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: bgColors[i]),
                                        child: Radio(
                                          onChanged: (List<Color> color) {
                                            setState(() {});
                                          },
                                          groupValue: bgColors,
                                          value: bgColors,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                itemCount: bgColors.length,
                              )
                            ],
                          ),
                        ),
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
