import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:my_todo_app/model/app_database.dart';
import '../model/category.dart';

class UserCategories with ChangeNotifier {
  List<dynamic> _userCat = [];

  List<dynamic> get userCat {
    return [..._userCat];
  }

  void catDetail(int bgColorNum, String catName) {
    // //_userCat.add(
    // //   UserCategory(
    // //       categoryTitle: catName,
    // //       numberOfList: 0,
    // //       categoryId: 0,
    // //       isFavorite: 0,
    // //       color: bgColorNum),
    // // );
    AppDatabase().insertCategory(CategoriesCompanion(
        categoryTitle: Value(catName), color: Value(bgColorNum)));
    //// print(bgColors[bgColorNum].toString);

    notifyListeners();
  }

  void getCategories() {
    //  List<Categorie> cats = AppDatabase().getAllCategory;
    _userCat.add(AppDatabase().getAllCategory);
  }
}
