import 'package:flutter/material.dart';

List<Color> bgColors = [
  Colors.white,
  Colors.teal,
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.orange,
  Colors.lime,
  Colors.indigo,
  Colors.black,
  Colors.amber,
  Colors.blue,
  Colors.brown,
  Colors.cyan,
  Colors.green,
  Colors.grey
];

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
