import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/providers/default_categories.dart';
import 'package:my_todo_app/providers/user_categories.dart';
import 'package:my_todo_app/widgets/app_drawer.dart';
import 'package:my_todo_app/widgets/category_screen_widgets/alert_dialog_widget.dart';
import 'package:my_todo_app/widgets/user_category_widget.dart';
import 'package:provider/provider.dart';
import '../model/category.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category-screen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'All Categories',
            // style: TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.search,
                  // color: Colors.white70,
                ),
                onPressed: () {
                  // TODO: OnPressed Feature Not Done
                }),
          ],
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColor,
          child: Row(children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.white,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          Container(height: 100, child: AlertDialogWidget()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 27,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 7),
                      child: Text(
                        'Add Category',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
        body: _buildCategoryList(context));
  }
}

StreamBuilder<List<Categorie>> _buildCategoryList(BuildContext context) {
  return StreamBuilder<List<Categorie>>(
    stream: Provider.of<CategorieDao>(context).watchAllCategories(),
    builder: (context, snapshot) {
      final categories = snapshot.data ?? List();

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else {
        return categories.isEmpty
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 230,
                        child: SizedBox(
                          child: Card(
                            elevation: 50,
                            child: Image.asset('assets/images/empty.png'),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You have no category yet",
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, i) => UserCategoriesWidget(
                      catId: categories[i].id,
                      title: categories[i].categoryTitle ?? "",
                      color: bgColors[categories[i].color],
                      numOfList: categories[i].numberOfList.toString(),
                      isImportant: categories[i].isImportant,
                    ),
                itemCount: categories.length);
      }
    },
  );
}
