import 'package:flutter/material.dart';
import 'package:my_todo_app/screens/categories_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.yellow,
      ),
      home: CategoryScreen(),
    );
  }
}
