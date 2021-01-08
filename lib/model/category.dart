import 'package:flutter/material.dart';

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
