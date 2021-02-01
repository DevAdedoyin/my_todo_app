import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:my_todo_app/model/app_database.dart';
import '../model/category.dart';

class UserCategories with ChangeNotifier {
  List<dynamic> _userCat = [];

  List<dynamic> get userCat {
    return [..._userCat];
  }

  void catDetail(int bgColorNum, String catName) async {
    // //_userCat.add(
    // //   UserCategory(
    // //       categoryTitle: catName,
    // //       numberOfList: 0,
    // //       categoryId: 0,
    // //       isFavorite: 0,
    // //       color: bgColorNum),
    // // );
    // AppDatabase().insertCategory(CategoriesCompanion(
    //     categoryTitle: Value(catName), color: Value(bgColorNum)));
    // //// print(bgColors[bgColorNum].toString);
    // Future<List<Categorie>> getCats = AppDatabase().getAllCategory;

    // List<Categorie> list = await getCats;

    // _userCat.add(list);

    notifyListeners();
  }
  //  List<Categorie> cats = AppDatabase().getAllCategory;

}
