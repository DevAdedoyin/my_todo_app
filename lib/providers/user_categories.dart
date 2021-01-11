import 'package:flutter/material.dart';
import '../model/category.dart';

class UserCategories with ChangeNotifier {
  List<Category> _userCat = [];

  List<Category> get userCat {
    return [..._userCat];
  }

  void catDetail(int catId, String catName) {}
}
