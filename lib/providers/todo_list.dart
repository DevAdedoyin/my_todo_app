import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Todo {
  final String title;
  final String time;
  final String date;
  final String frequency;
  final String note;

  Todo(
      {@required this.title,
      @required this.time,
      @required this.date,
      @required this.frequency,
      @required this.note});
}

class ToDoProvider with ChangeNotifier {
  Map<String, Todo> _todo = {};

  Map<String, Todo> get todo {
    return {..._todo};
  }
}
