import 'package:flutter/material.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/screens/categories_screen.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';
import 'package:my_todo_app/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Categories(),
      child: MaterialApp(
        title: 'My ToDo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.yellow,
        ),
        home: CategoryScreen(),
      ),
    );
  }
}
