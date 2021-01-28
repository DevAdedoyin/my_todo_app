import 'package:moor/moor.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:moor/ffi.dart';
// import '../model/category.dart';

part 'app_database.g.dart';

// @DataClassName('Category')
class Categories extends Table {
  IntColumn get categoryId => integer().autoIncrement()();
  TextColumn get categoryTitle =>
      text().withLength(min: 3, max: 15).customConstraint('UNIQUE')();
  IntColumn get numberOfList => integer().nullable()();
  IntColumn get isFavorite => integer()();
  IntColumn get color => integer().nullable()();

  // @override
  // Set<Column> get primaryKey => {categoryId};
}

class ToDoLists extends Table {
  IntColumn get listId => integer().autoIncrement()();
  TextColumn get title =>
      text().withLength(min: 3, max: 15).customConstraint('UNIQUE')();
  TextColumn get time => text().withLength(min: 4, max: 5)();
  TextColumn get date => text().withLength(min: 7, max: 9)();
  TextColumn get frequency => text().withLength(min: 1, max: 100)();
  TextColumn get note => text().withLength(min: 0, max: 150)();
  BoolColumn get isCompleted => boolean()();
  TextColumn get steps => text().withLength(min: 0, max: 150)();
  BoolColumn get isImportant => boolean()();

  // @override
  // Set<Column> get primaryKey => {listId};
}

@UseMoor(tables: [Categories, ToDoLists])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
