import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:moor/ffi.dart';
// import '../model/category.dart';

part 'app_database.g.dart';

// @DataClassName('Category')
class Categories extends Table {
  IntColumn get categoryId => integer().autoIncrement()();
  TextColumn get categoryTitle => text()
      .withLength(min: 3, max: 15)
      .nullable()
      .customConstraint('UNIQUE')();
  IntColumn get numberOfList =>
      integer().withDefault(const Constant(0)).nullable()();
  BoolColumn get isImportant => boolean().withDefault(const Constant(false))();
  IntColumn get color => integer().nullable().withDefault(const Constant(0))();

  // @override
  // Set<Column> get primaryKey => {categoryTitle};
}

class Tasks extends Table {
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
  IntColumn get categoryId => integer()
      .nullable()
      .customConstraint('NULL REFERENCES categories(categoryId)')();
}

class TaskWithCategory {
  final Task task;
  final Categorie categorie;

  TaskWithCategory({@required this.categorie, @required this.task});
}

@UseMoor(tables: [Categories, Tasks], daos: [TaskDao, CategorieDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  @override
  // TODO: implement migration
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (migrator, from, to) async {
        if (from == 1) {
          await migrator.addColumn(tasks, tasks.categoryId);
          await migrator.createTable(categories);
        }
      }, beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      });
}

@UseDao(
  tables: [Tasks, Categories],
)
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

  Stream<List<TaskWithCategory>> watchAllTasks() {
    return (select(tasks)
          ..orderBy(
            [
              (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
              (t) => OrderingTerm(expression: t.title),
            ],
          ))
        .join(
          [
            leftOuterJoin(
                categories, categories.categoryId.equalsExp(tasks.categoryId)),
          ],
        )
        .watch()
        .map((rows) => rows.map((row) {
              return TaskWithCategory(
                  categorie: row.readTable(categories),
                  task: row.readTable(tasks));
            }).toList());
  }

  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}

@UseDao(tables: [Categories])
class CategorieDao extends DatabaseAccessor<AppDatabase>
    with _$CategorieDaoMixin {
  final AppDatabase db;

  CategorieDao(this.db) : super(db);

//TODO: Convert the order be int based
  Stream<List<Categorie>> watchAllCategories() {
    return (select(categories)
          ..orderBy(([
            (c) =>
                OrderingTerm(expression: c.categoryId, mode: OrderingMode.desc)
          ])))
        .watch();
  }

  Future insertCategorie(Insertable<Categorie> categorie) =>
      into(categories).insert(categorie);

  Future updateCategorie(Insertable<Categorie> categorie) =>
      update(categories).replace(categorie);

  // Future<Categorie> updateCategoriee(Insertable<Categorie> categorie) async {
  // return await update(categories)..where((uc) => uc.categoryId.equals().);}
}
