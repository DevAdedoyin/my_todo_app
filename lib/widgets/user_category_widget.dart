import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moor_flutter/moor_flutter.dart';

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
  final textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catDao = Provider.of<CategorieDao>(context);
    final taskDao = Provider.of<TaskDao>(context);

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: widget.color,
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Spacer(),
            Text(
              'Delete',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.cancel_rounded,
                      color: Colors.red,
                    ),
                  ),
                  FutureBuilder<Categorie>(
                        future: catDao.getCategory(widget.catId),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                catDao.deleteCategories(snapshot.data);

                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(widget.title + " deleted"),
                                ));
                                Navigator.of(context).pop();
                              },
                            );
                          } else {
                            return Text('No Data');
                          }
                        },
                      ) ??
                      false
                ],
                elevation: 20,
                title: Text('Delete ${widget.title}?'),
                content:
                    Text('Are you sure you want to delete ${widget.title}?'),
              );
            });
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
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
                style: TextStyle(fontSize: 18),
              ),
              trailing: StreamBuilder(
                stream: taskDao.getSpecificTask(widget.catId),
                builder: (_, snapshot) {
                  // print('DATA: ' + snapshot.data.length.toString());

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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      title: Text('Edit category name'),
                                      content: FutureBuilder<Categorie>(
                                        future:
                                            catDao.getCategory(widget.catId),
                                        builder: (_, snapshot) {
                                          if (snapshot.hasData) {
                                            return TextField(
                                              maxLength: 25,
                                              controller: textController,
                                              onChanged: (String value) {
                                                String result;
                                                result = value;
                                                if (result.length > 25) {
                                                  result =
                                                      result.substring(0, 25);
                                                  textController.text = result;
                                                  textController.selection =
                                                      TextSelection
                                                          .fromPosition(
                                                              TextPosition(
                                                                  offset: result
                                                                      .length));
                                                }
                                              },
                                              maxLengthEnforced: true,
                                              keyboardType: TextInputType.text,
                                              onSubmitted: (value) {
                                                catDao.updateCategorie(
                                                    snapshot.data.copyWith(
                                                        categoryTitle:
                                                            textController
                                                                .text));
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          } else {
                                            return Text(
                                                'Nothing to display here');
                                          }
                                        },
                                      ),
                                      actions: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ));
                              },
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
