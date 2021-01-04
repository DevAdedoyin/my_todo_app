import 'package:flutter/material.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:my_todo_app/widgets/app_drawer.dart';
import 'package:my_todo_app/widgets/user_category_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final userCats = Provider.of<Categories>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // TODO: OnPressed Feature Not Done
              }),
        ],
      ),
      drawer: AppDrawer(),
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
