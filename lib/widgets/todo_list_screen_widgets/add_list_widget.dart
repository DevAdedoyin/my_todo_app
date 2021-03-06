import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_app/model/app_database.dart';

class AddListWidget extends StatefulWidget {
  final int catId;

  AddListWidget(this.catId);

  @override
  _AddListWidgetState createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  final _listTitleController = TextEditingController();
  DateTime _selectedDate;
  TimeOfDay _selectedTime;
  // MaterialLocalizations localizations;
  bool isCheck;

  List<String> _daysOfTheWeek = [
    'Daily',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  List<String> _selectedDayOfTheWeek = [];

  Map<int, bool> _days = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false
  };

  // Map<Map<int, bool> mapDay, List<String>>

  List<String> _selectedDay = [];
  String days = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    final insertTask = Provider.of<TaskDao>(context);
    initializeDateFormatting();
    final localizations = MaterialLocalizations.of(context);

    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
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
                      maxLength: 30,
                      // maxLengthEnforced: true,
                      controller: _listTitleController,
                      onChanged: (String value) {
                        String result;
                        result = value;
                        if (result.length > 30) {
                          result = result.substring(0, 30);
                          _listTitleController.text = result;
                          _listTitleController.selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: result.length));
                        }
                      },
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
                    child: IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.save_rounded),
                      onPressed: () {
                        final formattedTimeOfDay =
                            localizations.formatTimeOfDay(_selectedTime);
                        // String time = _selectedTime.hourOfPeriod.toString() +
                        //     ':' +
                        //     _selectedTime.minute.toString();
                        String formattedDate = DateFormat.yMMMd(
                                Localizations.localeOf(context).languageCode)
                            .format(_selectedDate);
                        // _selectedDate.toString().split(" ").first;
                        String createdDate = DateFormat.yMMMd(
                                Localizations.localeOf(context).languageCode)
                            .format(DateTime.now());

                        insertTask.insertTask(TasksCompanion(
                            date: Value(formattedDate),
                            time: Value(formattedTimeOfDay),
                            title: Value(_listTitleController.text),
                            catid: Value(widget.catId),
                            frequency: Value(days),
                            dateCreated: Value(createdDate)));
                        print(formattedDate +
                            ' ' +
                            _selectedDate.toString() +
                            ' ' +
                            _listTitleController.text +
                            'God is Great');

                        Navigator.of(context).pop();

                        print(_selectedDate.toString() +
                            " " +
                            _listTitleController.text);
                      },
                    ))
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    // splashColor: Colors.blue,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 7),
                            child: Icon(Icons.calendar_today_rounded)),
                        _selectedDate == null
                            ? Text('Set due date')
                            : Text(
                                'Due Date: ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(_selectedDate)}'),
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
                  TextButton(
                    // splashColor: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 7),
                            child: Icon(Icons.notifications_outlined)),
                        _selectedTime == null
                            ? Text('Remind me')
                            : Text(
                                'Due Time: ${localizations.formatTimeOfDay(_selectedTime)}')
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
                  TextButton(
                    // splashColor: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 7),
                            child: Icon(Icons.repeat)),
                        _selectedDayOfTheWeek.isEmpty
                            ? Text('Repeat')
                            : Text('Repeat on: $days')
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
                                      // width: double.maxFinite, USEFUL if ListView is in an AlertDialog
                                      width: double.maxFinite,
                                      child: ListView.builder(
                                        itemBuilder: (_, i) {
                                          return Card(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: 30,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(_daysOfTheWeek[i]),
                                                  Spacer(),
                                                  Checkbox(
                                                    onChanged: (isSelected) {
                                                      stateSetter(() {
                                                        _days[i] = isSelected;
                                                        // If Daily is false and a particular day of the week is true, then the selected day will be added
                                                        if (_days[i] &
                                                            !_days[0]) {
                                                          _selectedDay.add(
                                                              _daysOfTheWeek[
                                                                  i]);
                                                        }
                                                        // As long Daily is true, then all days of the week will be set to true
                                                        else if (_days[i] &
                                                            _days[0]) {
                                                          _days.forEach((x, _) {
                                                            _days[x] = true;
                                                          });
                                                          _selectedDay.addAll(
                                                              _daysOfTheWeek);
                                                        }
                                                        // if a particular day is set to false, then Daily will also be set to false
                                                        else if (!_days[i] &
                                                            _days[0]) {
                                                          _days[0] = false;
                                                          _selectedDay
                                                              .removeWhere(
                                                                  (val) {
                                                            return days
                                                                .contains(val);
                                                          });
                                                        } else {
                                                          _selectedDay.remove(
                                                              _daysOfTheWeek[
                                                                  i]);
                                                        }
                                                        print("Selected day" +
                                                            _selectedDay
                                                                .toSet()
                                                                .toList()
                                                                .toString());
                                                      });
                                                    },
                                                    value: _days[i],
                                                    activeColor: Colors.black,
                                                    checkColor: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            elevation: 10,
                                          );
                                        },
                                        itemCount: _daysOfTheWeek.length,
                                      ),
                                    ),
                                    actions: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                          size: 27,
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
                                          size: 27,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _selectedDayOfTheWeek =
                                                _selectedDay.toSet().toList();
                                            _selectedDayOfTheWeek
                                                .remove('Daily');
                                            days = _selectedDayOfTheWeek
                                                .join(', ');
                                          });

                                          print("Selected::: " +
                                              _selectedDayOfTheWeek.toString());
                                          Navigator.of(context).pop();
                                        },
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
