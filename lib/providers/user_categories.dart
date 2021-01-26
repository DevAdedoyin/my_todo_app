import 'package:flutter/material.dart';
import '../model/category.dart';

class UserCategories with ChangeNotifier {
  List<UserCategory> _userCat = [];

  List<UserCategory> get userCat {
    return [..._userCat];
  }

  void catDetail(int bgColorNum, String catName) {
    _userCat.add(
      UserCategory(
          categoryTitle: catName,
          numberOfList: 0,
          categoryId: 0,
          isFavorite: 0,
          color: bgColorNum),
    );
    // print(bgColors[bgColorNum].toString);
    notifyListeners();
  }
}
