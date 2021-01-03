import 'package:flutter/material.dart';
import 'package:my_todo_app/widgets/app_drawer.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Column(
            children: [
              Icon(Icons.hourglass_empty_rounded),
              Text("You have no ToDo List Category yet"),
            ],
          ),
        ),
      ]),
    );
  }
}
