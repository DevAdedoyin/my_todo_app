import 'package:flutter/material.dart';

import 'package:my_todo_app/model/app_database.dart';

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
    final taskDao = Provider.of<TaskDao>(context);
    print(widget.catId);
    return Dismissible(
      key: Key(widget.catId.toString()),
      onDismissed: (direction) {
        setState(() {
          catDao.deleteCategory(widget.catId);
        });
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(widget.title + " deleted"),
        ));
      },
      child: InkWell(
        onTap: () => {
          Navigator.of(context).pushNamed(TodoListScreen.routeName,
              arguments: [widget.title, widget.color, widget.catId])
        },
        splashColor: widget.color,
        borderRadius: BorderRadius.circular(10),
        child: Card(
          margin: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          shadowColor: Colors.black87,
          child: Container(
            height: 70,
            alignment: Alignment.center,
            child: ListTile(
              leading: IconButton(
                icon: widget.isImportant
                    ? Icon(
                        Icons.star,
                        size: 20,
                        color: widget.color,
                      )
                    : Icon(
                        Icons.star_border,
                        size: 25,
                        color: Colors.black,
                      ),
                onPressed: () {
                  if (widget.isImportant == true) {
                    catDao.updateCategoryImportance(
                        Categorie(id: widget.catId, isImportant: false)
                            .copyWith(id: widget.catId));
                  } else {
                    catDao.updateCategoryImportance(
                        Categorie(id: widget.catId, isImportant: true)
                            .copyWith(id: widget.catId));
                  }
                },
                splashColor: widget.color,
              ),
              title: Text(
                widget.title,
                style: TextStyle(fontSize: 20),
              ),
              trailing: StreamBuilder(
                stream: taskDao.getSpecificTask(widget.catId),
                builder: (_, snapshot) {
                  print('DATA: ' + snapshot.data.length.toString());

                  if (snapshot.hasData) {
                    return Container(
                      width: 50,
                      // color: Colors.amberAccent,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: Text(
                              snapshot.data.length.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text('0');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
