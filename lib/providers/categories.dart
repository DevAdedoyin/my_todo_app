import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final Icon icon;
  final String title;
  final int numberOfList;

  Category({this.id = 0, this.icon, this.title, this.numberOfList = 0});
}

class Categories with ChangeNotifier {
  List<Category> _cat = [];

  List<Category> get cat {
    return [..._cat];
  }
}
