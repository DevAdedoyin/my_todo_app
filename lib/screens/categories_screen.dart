import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:my_todo_app/widgets/app_drawer.dart';
import 'package:my_todo_app/widgets/category_screen_widgets/alert_dialog_widget.dart';
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
    //final customCats = Provider.of<UserCategories>(context);

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
