import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
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
    // AppDatabase().insertCategory(CategoriesCompanion(categoryTitle: catName, color: bgColorNum, isFavorite: 0, numberOfList: 0);
    // print(bgColors[bgColorNum].toString);
    notifyListeners();
  }

  void insertCategories() {}
}
