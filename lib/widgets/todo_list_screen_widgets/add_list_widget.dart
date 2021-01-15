import 'package:flutter/material.dart';

class AddListWidget extends StatefulWidget {
  @override
  _AddListWidgetState createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        // width: 350,
        // padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    // margin: EdgeInsets.only(left: 15, right: 10),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add a task',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // flex: 1,
                  child: Icon(Icons.save_alt_rounded),
                )
              ],
            ),
            Container(
              // width: 350,
              child: Row(
                children: [
                  Expanded(
                    // flex: 1,
                    child: FlatButton(
                      // padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Icon(Icons.alarm), Text('Remind me')],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    // flex: 1,
                    child: FlatButton(
                      // padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Icon(Icons.repeat), Text('Repeat')],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: 30,
                      // width: 20,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: FlatButton(
                        // padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_rounded),
                            Text('Set due date')
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
