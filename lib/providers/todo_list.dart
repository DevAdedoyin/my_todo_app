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
  Map<String, Todo> _todo = {
    '1': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '2': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '3': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '4': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '5': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '6': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '7': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
    '8': Todo(
        date: DateTime.now().month.toString(),
        frequency: 'repeat',
        title: 'Flutter App',
        time: DateTime.now().hour.toString(),
        note:
            "This just a test note or you can call it a dummy note. Nothing special for now"),
  };

  Map<String, Todo> get todo {
    return {..._todo};
  }
}
