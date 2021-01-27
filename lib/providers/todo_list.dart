import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Todo {
  final int listId;
  final String title;
  final String time;
  final String date;
  final String frequency;
  final String note;
  final bool isCompleted;
  final String steps;
  final bool isImportant;

  Todo({
    this.listId,
    @required this.title,
    @required this.time,
    @required this.date,
    this.frequency,
    this.note,
    this.isCompleted,
    this.steps,
    this.isImportant,
  });
}

class ToDoProvider with ChangeNotifier {
  List<Todo> _todo = [];

  List<Todo> get todo {
    return [..._todo];
  }

  void insertTodo(String title, String time, String date) {
    _todo.add(Todo(date: date, time: time, title: title));
    notifyListeners();
  }
}
