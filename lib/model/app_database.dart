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
  IntColumn get numberOfList => integer().withDefault(const Constant(0))();
  IntColumn get isFavorite => integer().withDefault(const Constant(0))();
  IntColumn get color => integer().nullable().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {categoryTitle};
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
  IntColumn get category =>
      integer().nullable().customConstraint('NULL REFERENCES categories(id)')();

  // @override
  // Set<Column> get primaryKey => {listId};
}

@UseMoor(tables: [Categories, ToDoLists])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertCategory(CategoriesCompanion cats) =>
      into(categories).insert(cats);

  Future<List<Categorie>> get getAllCategory {
    return select(categories).get();
  }

  // Stream<List<ToDoList>> watchToDoEntriesInCategory(Categorie cat) {
  //   return (select(toDoLists)
  //         ..where((td) => td.categories.equals(cat.categoryId)))
  //       .watch();
  // }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
