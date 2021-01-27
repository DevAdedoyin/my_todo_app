import 'package:moor/moor.dart';

part 'app_database.g.dart';

@DataClassName('Category')
class Category extends Table {
  IntColumn get categoryId => integer().autoIncrement()();
  TextColumn get categoryTitle => text().withLength(min: 3, max: 15)();
  IntColumn get numberOfList => integer().nullable()();
  BoolColumn get isFavorite => boolean()();
  IntColumn get color => integer().nullable()();
}

class ToDoList extends Table {
  IntColumn get listId => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 3, max: 15)();
  TextColumn get time => text().withLength(min: 4, max: 5)();
  TextColumn get date => text().withLength(min: 7, max: 9)();
  TextColumn get frequency => text().withLength(min: 1, max: 100)();
  TextColumn get note => text().withLength(min: 0, max: 150)();
  BoolColumn get isCompleted => boolean()();
  TextColumn get steps => text().withLength(min: 0, max: 150)();
  BoolColumn get isImportant => boolean()();
}

@UseMoor(tables: [Category, ToDoList])
class AppDatabase {}
