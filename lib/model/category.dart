import 'package:flutter/material.dart';

List<Color> bgColors = [
  Colors.white10,
  Colors.greenAccent,
  Colors.yellowAccent,
  Colors.blueGrey,
  Colors.grey,
  Colors.redAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
  Colors.pinkAccent,
];

// Map<String, Color> bgColor = {
//   'greenAccent': Colors.greenAccent,
//   'yellowAccent': Colors.yellowAccent,
//   'blueGrey': Colors.blueGrey,
//   'grey': Colors.grey,
//   'redAccent': Colors.redAccent,
//   'deepOrangeAccent': Colors.deepOrangeAccent,
//   'deepPurpleAccent': Colors.deepPurpleAccent,
// };

// enum ColorList {
//   greenAccent,
//   yellowAccent,
//   blueGrey,
//   grey,
//   redAccent,
//   deepOrangeAccent,
//   deepPurpleAccent,
// }

class Category {
  final int id;gory_
  final String categoryTitle;
  final int numberOfList;
  final Color color;

  Category(
      {@required this.id,

      @required this.categoryTitle,
      @required this.numberOfList,
      this.color});
}
