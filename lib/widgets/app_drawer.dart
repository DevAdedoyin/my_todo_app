import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories.dart';

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
          Divider(),
          Container(
            height: 150,
            child: ListView.builder(
              itemBuilder: (_, i) => Column(
                children: [
                  ListTile(
                    leading: Icon(categories.cat[i].icon),
                    title: Text(categories.cat[i].title),
                    trailing: Text(categories.cat[i].numberOfList.toString()),
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
