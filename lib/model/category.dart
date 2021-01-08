import 'package:flutter/material.dart';

List<Color> color = [
  Colors.yellowAccent,
  Colors.blueGrey,
  Colors.greenAccent,
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

  Category(
      {@required this.id,
      @required this.icon,
      @required this.title,
      @required this.numberOfList});
}
