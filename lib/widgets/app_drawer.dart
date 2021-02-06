import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:provider/provider.dart';
import '../providers/default_categories.dart';
import 'dart:io';

Future<int> getLength() async {
  BuildContext context;
  var catDaoLength = Provider.of<CategorieDao>(context);
  int length = await catDaoLength.watchAllCategories().length;
  return length;
}

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final catDao = Provider.of<CategorieDao>(context);
    print(catDao.watchAllCategories().length.toString() + 'check');
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
                    trailing: Text('')),
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
