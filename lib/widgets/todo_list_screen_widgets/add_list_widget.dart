import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddListWidget extends StatefulWidget {
  @override
  _AddListWidgetState createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  final _listTitleController = TextEditingController();
  DateTime _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        // width: 350,
        // padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _listTitleController,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add a task',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.save_alt_rounded,
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    splashColor: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.alarm), Text('Remind me')],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    splashColor: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.repeat), Text('Repeat')],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    splashColor: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.calendar_today_rounded),
                        _selectedDate == null
                            ? Text('Set due date')
                            : Text(
                                'Due Date: ${DateFormat.yMd().format(_selectedDate)}')
                      ],
                    ),
                    onPressed: () {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((pickedDate) {
                        if (pickedDate == null) return;
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
