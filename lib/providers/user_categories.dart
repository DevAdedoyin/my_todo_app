import 'package:flutter/material.dart';
import '../model/category.dart';

class UserCategories with ChangeNotifier {
  List<Category> _userCat = [];

  List<Category> get userCat {
    return [..._userCat];
  }

  void catDetail(int bgColorNum, String catName) {
    _userCat.add(Category(
        title: catName,
        icon: Icons.category_rounded,
        numberOfList: bgColorNum,
        id: 'DummyId',
        color: bgColors[bgColorNum]));
  }
}
