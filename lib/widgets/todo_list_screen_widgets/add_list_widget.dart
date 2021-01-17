import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddListWidget extends StatefulWidget {
  @override
  _AddListWidgetState createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  final _listTitleController = TextEditingController();
  DateTime _selectedDate;
  TimeOfDay _selectedTime;
  MaterialLocalizations localizations;
  bool isCheck;

  List<String> daysOfTheWeek = [
    'Daily',
    'Sunday(s)',
    'Monday(s)',
    'Tuesday(s)',
    'Wednesday(s)',
    'Thursday(s)',
    'Friday(s)',
    'Saturday(s)'
  ];

  Map<int, bool> days = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCheck = false;
  }

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
                    splashColor: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 7),
                            child: Icon(Icons.calendar_today_rounded)),
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
                  FlatButton(
                    splashColor: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 7),
                            child: Icon(Icons.alarm)),
                        _selectedTime == null
                            ? Text('Remind me')
                            : Text(
                                'Due Time: ${_selectedTime.hour}:${_selectedTime.minute}')
                      ],
                    ),
                    onPressed: () {
                      return showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((pickedTime) {
                        if (pickedTime == null) return;
                        setState(() {
                          _selectedTime = TimeOfDay(
                            hour: pickedTime.hour,
                            minute: pickedTime.minute,
                          );
                        });
                      });
                    },
                  ),
                  FlatButton(
                    splashColor: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 7),
                            child: Icon(Icons.repeat)),
                        Text('Repeat'),
                      ],
                    ),
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (_) => StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter stateSetter) {
                                  return AlertDialog(
                                    title: Text('Repeat'),
                                    content: Container(
                                      padding: EdgeInsets.all(10),
                                      height: 180,
                                      child: ListView.builder(
                                        itemBuilder: (_, i) {
                                          return Card(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: 30,
                                              child: Row(
                                                children: [
                                                  Text(daysOfTheWeek[i]),
                                                  Spacer(),
                                                  Checkbox(
                                                    onChanged: (isSelected) {
                                                      stateSetter(() {
                                                        days[i] = isSelected;
                                                      });
                                                    },
                                                    value: days[i],
                                                    activeColor: Colors.black,
                                                    checkColor: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            elevation: 10,
                                          );
                                        },
                                        itemCount: days.length,
                                      ),
                                    ),
                                    actions: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          return Navigator.of(context).pop();
                                        },
                                        splashColor: Colors.redAccent,
                                        splashRadius: 20,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {},
                                        splashColor: Colors.greenAccent,
                                        splashRadius: 20,
                                      )
                                    ],
                                  );
                                },
                              ));
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