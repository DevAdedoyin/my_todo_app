import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final catDao = Provider.of<CategorieDao>(context);
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
                  leading: Icon(
                    Icons.all_inclusive_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    'All Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  trailing: FutureBuilder<int>(
                    future: catDao.countCategories(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      } else {
                        return Text('0');
                      }
                    },
                  ),
                  // Text(_length.toString())
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.star_border_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Important',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  trailing: FutureBuilder(
                    future: catDao.countImportant(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        );
                      } else {
                        return Text('0');
                      }
                    },
                  ),
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
