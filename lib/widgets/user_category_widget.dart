import 'package:flutter/material.dart';
import 'package:my_todo_app/screens/todo_list_screen.dart';

class UserCategoriesWidget extends StatefulWidget {
  final String title;
  final String numOfList;
  final Color color;

  UserCategoriesWidget({this.title, this.numOfList, this.color});

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
              icon: Icon(
                Icons.star_border_outlined,
                size: 25,
              ),
              onPressed: () {},
              splashColor: widget.color,
            ),
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 23),
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
