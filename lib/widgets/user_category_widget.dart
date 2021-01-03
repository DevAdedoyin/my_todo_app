import 'package:flutter/material.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:provider/provider.dart';

class UserCategories extends StatefulWidget {
  final Icon icon;
  final Text title;
  final Text numOfList;

  UserCategories({this.icon, this.title, this.numOfList});

  @override
  _UserCategoriesState createState() => _UserCategoriesState();
}

class _UserCategoriesState extends State<UserCategories> {
  @override
  Widget build(BuildContext context) {
    final userCats = Provider.of<Categories>(context);
    return InkWell(
      onTap: () => {},
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        shadowColor: Colors.black54,
        child: Container(
          child: ListTile(
            leading: widget.icon,
            title: widget.title,
            trailing: widget.numOfList,
          ),
        ),
      ),
    );
  }
}
