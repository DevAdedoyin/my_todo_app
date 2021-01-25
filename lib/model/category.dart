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

class DefaultCategory {
  final int defaultCategoryId;
  final IconData categoryIcon;
  final String defaultCategoryTitle;
  final int numberOfCategory;

  DefaultCategory({
    @required this.defaultCategoryId,
    @required this.categoryIcon,
    @required this.defaultCategoryTitle,
    @required this.numberOfCategory,
  });
}

class UserCategory {
  final int categoryId;
  final String categoryTitle;
  final int numberOfList;
  final bool isFavorite;
  final Color color;

  UserCategory(
      {@required this.categoryId,
      @required this.categoryTitle,
      @required this.numberOfList,
      @required this.isFavorite,
      this.color});
}
