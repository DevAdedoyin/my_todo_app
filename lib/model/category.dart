import 'package:flutter/material.dart';

List<Color> bgColors = [
  Colors.greenAccent,
  Colors.yellowAccent,
  Colors.blueGrey,
  Colors.grey,
  Colors.redAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
];

enum ColorList {
  greenAccent,
  yellowAccent,
  blueGrey,
  grey,
  redAccent,
  deepOrangeAccent,
  deepPurpleAccent,
}

class Category {
  final String id;
  final IconData icon;
  final String title;
  final int numberOfList;
  final Color color;

  Category(
      {@required this.id,
      @required this.icon,
      @required this.title,
      @required this.numberOfList,
      this.color});
}
