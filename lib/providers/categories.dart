import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/category.dart';

class Categories with ChangeNotifier {
  List<Category> _cat = [
    Category(
        id: 'cat1',
        icon: Icons.wb_sunny_outlined,
        title: 'My Day',
        numberOfList: 0),
    Category(
        id: 'cat2',
        icon: Icons.star_border_outlined,
        title: 'Important',
        numberOfList: 1),
    Category(
        id: 'cat3', icon: Icons.all_inclusive, title: 'All', numberOfList: 4),
    Category(
        id: 'cat4',
        icon: Icons.check_circle_outline_rounded,
        title: 'Completed',
        numberOfList: 3),
    Category(
        id: 'cat5',
        icon: Icons.person_outline,
        title: 'My Day',
        numberOfList: 5),
  ];

  List<Category> get cat {
    return [..._cat];
  }
}
