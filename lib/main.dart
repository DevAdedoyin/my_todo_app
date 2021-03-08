import 'package:flutter/material.dart';
import 'package:my_todo_app/model/app_database.dart' hide Categories;
import 'package:my_todo_app/model/category.dart';
import 'package:my_todo_app/providers/default_categories.dart';
import 'package:my_todo_app/providers/todo_list.dart';
import 'package:my_todo_app/providers/user_categories.dart';
import 'package:my_todo_app/screens/categories_screen.dart';
import 'package:my_todo_app/screens/todo_list_details_screen.dart';
import 'package:my_todo_app/screens/todo_list_screen.dart';
import 'package:my_todo_app/widgets/todo_list_details.dart';
import 'package:my_todo_app/widgets/user_category_widget.dart';
import 'package:provider/provider.dart';

void main() =>
    runApp(RestorationScope(restorationId: 'root', child: MainApp()));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    return MultiProvider(
      providers: [
        Provider.value(value: db.taskDao),
        Provider.value(
          value: db.categorieDao,
        ),
        ChangeNotifierProvider.value(value: Categories()),
        ChangeNotifierProvider.value(
          value: UserCategories(),
        ),
        ChangeNotifierProvider.value(
          value: ToDoProvider(),
        )
      ],
      child: MaterialApp(
          title: 'My ToDo',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.cyan,
          ),
          home: CategoryScreen(),
          // CategoryScreen(),
          routes: {
            CategoryScreen.routeName: (ctx) => CategoryScreen(),
            TodoListScreen.routeName: (ctx) => TodoListScreen(),
            ToDoListDetailsScreen.routeName: (ctx) => ToDoListDetailsScreen()
          }),
    );
  }
}
