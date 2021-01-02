import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final Icon icon;
  final String title;
  final int numberOfList;

  Category(
      {@required this.id,
      @required this.icon,
      @required this.title,
      @required this.numberOfList});
}

class Categories with ChangeNotifier {
  List<Category> _cat = [
    Category(
        id: 'cat1',
        icon: Icon(Icons.wb_sunny_outlined),
        title: 'My Day',
        numberOfList: 0),
    Category(
        id: 'cat2',
        icon: Icon(Icons.star_border_outlined),
        title: 'Important',
        numberOfList: 1),
    Category(
        id: 'cat3',
        icon: Icon(Icons.all_inclusive),
        title: 'All',
        numberOfList: 4),
    Category(
        id: 'cat4',
        icon: Icon(Icons.check_circle_outline_rounded),
        title: 'Completed',
        numberOfList: 0),
    Category(
        id: 'cat5',
        icon: Icon(Icons.person_outline),
        title: 'My Day',
        numberOfList: 0),
  ];

  List<Category> get cat {
    return [..._cat];
  }
}
