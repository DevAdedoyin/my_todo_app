import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/providers/user_categories.dart';
import 'package:my_todo_app/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';

class UserCategoriesWidget extends StatefulWidget {
  final String title;
  final String numOfList;
  final Color color;
  final int catId;
  final bool isImportant;

  UserCategoriesWidget(
      {this.catId, this.title, this.numOfList, this.color, this.isImportant});

  @override
  _UserCategoriesWidgetState createState() => _UserCategoriesWidgetState();
}

class _UserCategoriesWidgetState extends State<UserCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final catDao = Provider.of<CategorieDao>(context);
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(TodoListScreen.routeName,
            arguments: [widget.title, widget.color])
      },
      splashColor: widget.color,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 7,
        shadowColor: Colors.black87,
        child: Container(
          height: 70,
          alignment: Alignment.center,
          child: ListTile(
            leading: IconButton(
              icon: widget.isImportant == true
                  ? Icon(
                      Icons.star_border_outlined,
                      size: 20,
                      color: widget.color,
                    )
                  : Icon(
                      Icons.star_border_outlined,
                      size: 25,
                    ),
              onPressed: () {
                if (widget.isImportant) {
                  catDao.updateCategorie(Categorie(
                    isImportant: false,
                  ));
                } else {
                  catDao.updateCategorie(Categorie(
                    isImportant: true,
                  ));
                }
              },
              splashColor: widget.color,
            ),
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 22),
            ),
            trailing: Text(
              widget.numOfList,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
