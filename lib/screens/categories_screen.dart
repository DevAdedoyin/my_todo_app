import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_app/providers/default_categories.dart';
import 'package:my_todo_app/providers/user_categories.dart';
import 'package:my_todo_app/widgets/app_drawer.dart';
import 'package:my_todo_app/widgets/category_screen_widgets/alert_dialog_widget.dart';
import 'package:my_todo_app/widgets/user_category_widget.dart';
import 'package:provider/provider.dart';
import '../model/category.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category-screen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    // final userCats = Provider.of<Categories>(context);
    final customCats = Provider.of<UserCategories>(context);

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
                    context: context, builder: (_) => AlertDialogWidget());
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
      body: customCats.userCat.isEmpty
          ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.timeline_rounded),
                    Text("You have no ToDo List Category yet"),
                  ],
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (_, i) => UserCategoriesWidget(
                    title: customCats.userCat[i].categoryTitle,
                    numOfList: customCats.userCat[i].numberOfList.toString(),
                    color: customCats.userCat[i].color,
                  ),
              itemCount: customCats.userCat.length),
    );
  }
}
