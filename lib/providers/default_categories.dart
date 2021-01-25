import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/category.dart';

class Categories with ChangeNotifier {
  List<DefaultCategory> _cat = [
    DefaultCategory(
        defaultCategoryId: 0,
        categoryIcon: Icons.all_inclusive,
        defaultCategoryTitle: 'All',
        numberOfCategory: 0),
    DefaultCategory(
        defaultCategoryId: 1,
        categoryIcon: Icons.star_border_outlined,
        defaultCategoryTitle: 'Important',
        numberOfCategory: 0),
    DefaultCategory(
        defaultCategoryId: 2,
        categoryIcon: Icons.check_circle_outline_rounded,
        defaultCategoryTitle: 'Completed',
        numberOfCategory: 0),
  ];

  List<DefaultCategory> get cat {
    return [..._cat];
  }
}
