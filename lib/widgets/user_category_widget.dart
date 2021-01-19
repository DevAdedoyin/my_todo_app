import 'package:flutter/material.dart';
import 'package:my_todo_app/model/category.dart';
import 'package:my_todo_app/providers/categories.dart';
import 'package:my_todo_app/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';

class UserCategoriesWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String numOfList;
  final Color color;

  UserCategoriesWidget({this.icon, this.title, this.numOfList, this.color});

  @override
  _UserCategoriesWidgetState createState() => _UserCategoriesWidgetState();
}

class _UserCategoriesWidgetState extends State<UserCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    // final userCats = Provider.of<Categories>(context);
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(TodoListScreen.routeName,
            arguments: [widget.title, widget.color])
      },
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        color: widget.color,
        margin: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        shadowColor: Colors.black87,
        child: Container(
          child: ListTile(
            leading: Icon(
              widget.icon,
              color: Colors.black,
            ),
            title: Text(widget.title),
            trailing: Text(widget.numOfList),
          ),
        ),
      ),
    );
  }
}
