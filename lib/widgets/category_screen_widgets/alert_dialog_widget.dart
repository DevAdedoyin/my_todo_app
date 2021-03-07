import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:my_todo_app/model/app_database.dart';
import 'package:my_todo_app/model/category.dart';
// import 'package:my_todo_app/providers/user_categories.dart';
import 'package:provider/provider.dart';

class AlertDialogWidget extends StatefulWidget {
  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  int selectedColor;
  int index;

  final _textFieldController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedColor = 0;
    index = 0;
  }

  void _selectedColor(int val) {
    setState(() {
      selectedColor = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final insertCategory = Provider.of<CategorieDao>(context);
    return AlertDialog(
      backgroundColor: Colors.white70.withOpacity(0.9),
      title: Text(
        'Category',
      ),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
        return Container(
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.category,
                        size: 20,
                        color: bgColors[selectedColor],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: TextField(
                            maxLength: 25,
                            maxLengthEnforced: true,
                            onChanged: (String value) {
                              String result;
                              result = value;
                              if (result.length > 25) {
                                result = result.substring(0, 25);
                                _textFieldController.text = result;
                                _textFieldController.selection =
                                    TextSelection.fromPosition(
                                        TextPosition(offset: result.length));
                              }
                            },
                            controller: _textFieldController,
                            decoration: InputDecoration(
                              hintText: 'Enter your category',
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Chip(
                  backgroundColor: bgColors[selectedColor],
                  label: Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 50,
                // margin: EdgeInsets.only(top: 1),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColors[i],
                    ),
                    //TODO: Convert List of Colors and name to a map
                    child: Radio(
                      activeColor: bgColors[i],
                      value: i,
                      groupValue: selectedColor,
                      onChanged: (val) {
                        stateSetter(() {
                          _selectedColor(val);
                          index = val;
                        });
                      },
                    ),
                  ),
                  itemCount: bgColors.length,
                ),
              ),
            ],
          ),
        );
      }),
      elevation: 7,
      actions: [
        IconButton(
          icon: Icon(Icons.cancel_rounded),
          onPressed: () {
            return Navigator.of(context).pop();
          },
          color: Colors.red,
          iconSize: 30,
          splashColor: Colors.redAccent,
          splashRadius: 25,
        ),
        IconButton(
          icon: Icon(Icons.check_circle),
          onPressed: () {
            return {
              print(_textFieldController.text),
              print(selectedColor),
              // userCatProv.catDetail(selectedColor, _textFieldController.text),
              insertCategory.insertCategorie(CategoriesCompanion(
                  categoryTitle: Value(_textFieldController.text),
                  color: Value(selectedColor))),
              Navigator.of(context).pop()
            };
          },
          color: Colors.green,
          iconSize: 30,
          splashColor: Colors.greenAccent,
          splashRadius: 25,
        ),
      ],
    );
  }
}
