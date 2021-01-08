import 'package:flutter/material.dart';

List<Color> color = [
  Colors.greenAccent,
  Colors.yellowAccent,
  Colors.blueGrey,
  Colors.grey,
  Colors.redAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent
];

class Category {
  final String id;
  final IconData icon;
  final String title;
  final int numberOfList;
  final List<Color> color;

  Category(
      {@required this.id,
      @required this.icon,
      @required this.title,
      @required this.numberOfList,
      this.color});
}
