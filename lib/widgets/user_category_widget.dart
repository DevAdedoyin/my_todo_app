import 'package:flutter/material.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:provider/provider.dart';

class UserCategoriesWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String numOfList;

  UserCategoriesWidget({this.icon, this.title, this.numOfList});

  @override
  _UserCategoriesWidgetState createState() => _UserCategoriesWidgetState();
}

class _UserCategoriesWidgetState extends State<UserCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final userCats = Provider.of<Categories>(context);
    return InkWell(
      onTap: () => {},
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        shadowColor: Colors.black87,
        child: Container(
          child: ListTile(
            leading: Icon(widget.icon),
            title: Text(widget.title),
            trailing: Text(widget.numOfList),
          ),
        ),
      ),
    );
  }
}
