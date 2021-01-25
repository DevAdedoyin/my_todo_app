import 'package:flutter/material.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:provider/provider.dart';
import '../providers/default_categories.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hi Adedoyin'),
            automaticallyImplyLeading: false,
          ),
          Container(
            height: 500,
            child: ListView.builder(
              itemBuilder: (_, i) => Column(
                children: [
                  ListTile(
                    leading: Icon(categories.cat[i].categoryIcon),
                    title: Text(categories.cat[i].defaultCategoryTitle),
                    trailing:
                        Text(categories.cat[i].numberOfCategory.toString()),
                  ),
                  Divider(),
                ],
              ),
              itemCount: categories.cat.length,
            ),
          )
        ],
      ),
    );
  }
}
