import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hi Adedoyin'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
        ],
      ),
    );
  }
}