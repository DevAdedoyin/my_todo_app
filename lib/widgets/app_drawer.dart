import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:provider/provider.dart';
import '../providers/default_categories.dart';
import 'dart:io';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catDao = Provider.of<CategorieDao>(context);
    int length = 0;

    // void catLength() {
    //  int catLength = catDao.getNoOfCategories.then((catL) {
    //     return length = catL;
    //   });
    // }

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hi Adedoyin'),
            automaticallyImplyLeading: false,
          ),
          Container(
            height: 500,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.all_inclusive_rounded),
                  title: Text('All Categories'),
                  trailing: Text(catDao
                      .getNoOfCategories()
                      .then((val) => val)
                      .catchError((error) => print(error))
                      .toString()),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.star_border_rounded),
                  title: Text('Important'),
                  trailing: Text('0'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.check_circle_outline_rounded),
                  title: Text('Completed'),
                  trailing: Text('0'),
                ),
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
