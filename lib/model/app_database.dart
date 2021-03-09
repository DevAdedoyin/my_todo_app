import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
// import 'package:moor/ffi.dart';
// import '../model/category.dart';

part 'app_database.g.dart';

// @DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryTitle =>
      text().withLength(min: 3, max: 30).nullable()();
  IntColumn get numberOfList =>
      integer().withDefault(const Constant(0)).nullable()();
  BoolColumn get isImportant => boolean().withDefault(const Constant(false))();
  IntColumn get color => integer().nullable().withDefault(const Constant(0))();

  // @override
  // Set<Column> get primaryKey => {categoryTitle};
}

class Tasks extends Table {
  IntColumn get taskid => integer().nullable().autoIncrement()();
  TextColumn get title => text()
      .nullable()
      .withLength(min: 3, max: 30)
      .customConstraint('UNIQUE')();
  TextColumn get time => text().nullable()();
  TextColumn get date => text().nullable()();
  TextColumn get frequency => text().nullable().withLength(min: 1, max: 100)();
  TextColumn get note => text().nullable().withLength(min: 0, max: 150)();
  BoolColumn get isCompleted =>
      boolean().nullable().withDefault(const Constant(false))();
  TextColumn get steps => text().nullable()();
  BoolColumn get isImportant =>
      boolean().nullable().withDefault(const Constant(false))();
  TextColumn get dateCreated => text().nullable()();
  IntColumn get catid =>
      integer().nullable().customConstraint('NULL REFERENCES categories(id)')();
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
          await migrator.addColumn(tasks, tasks._catid);
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
            leftOuterJoin(categories, categories.id.equalsExp(tasks.catid)),
          ],
        )
        .watch()
        .map((rows) => rows.map((row) {
              return TaskWithCategory(
                  categorie: row.readTable(categories),
                  task: row.readTable(tasks));
            }).toList());
  }

  //Gets tasks related to specific category
  Stream<List<Task>> getSpecificTaskASC(int index) {
    return (select(tasks)
          ..where((val) => val.catid.equals(index))
          ..orderBy([
            (t) => OrderingTerm(expression: t.taskid, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  //Gets tasks related to specific category
  Stream<List<Task>> getSpecificTaskDSC(int index) {
    return (select(tasks)
          ..where((val) => val.catid.equals(index))
          ..orderBy([
            (t) => OrderingTerm(expression: t.taskid, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Stream<Task> getTask(int index) {
    return (select(tasks)..where((val) => val.taskid.equals(index)))
        .watchSingle();
  }

  //Gets number of task in a specific category
  Future<int> numberOfTaskInACategory(int index) async {
    int length = await (getSpecificTaskASC(index)).length;
    return length;
  }

  //Updates Task Completeness
  Future updateCompleteness(Task task) {
    return (update(tasks)..where((t) => t.taskid.equals(task.taskid)))
        .write(TasksCompanion.insert(isCompleted: Value(task.isCompleted)));
  }

  Future updateSteps(Task task) {
    return (update(tasks)..where((t) => t.taskid.equals(task.taskid)))
        .write(TasksCompanion.insert(steps: Value(task.steps)));
  }

  //Updates Task Importance
  Future updateTaskImportance(Task task) {
    return (update(tasks)..where((t) => t.taskid.equals(task.taskid)))
        .write(TasksCompanion.insert(isImportant: Value(task.isImportant)));
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

  //returns all Categories Ordered by newest Categories id(Desc)
  Stream<List<Categorie>> watchAllCategories() {
    return (select(categories)
          ..orderBy(([
            (c) => OrderingTerm(expression: c.id, mode: OrderingMode.desc)
          ])))
        .watch();
  }

  Future<Categorie> getCategory(int catId) async {
    final cat = (select(categories)
          ..where((cat) {
            return cat.id.equals(catId);
          }))
        .getSingle();
    return cat;
  }

//returns the amount of categories in the database
  Future<int> countCategories() async {
    return (await select(categories).get()).length;
  }

//returns the amount of important categories in the database
  Future<int> countImportant() async {
    var len = await (select(categories)
          ..where((ci) => ci.isImportant.equals(true)))
        .get()
        .then((val) => val.length);

    return len;
  }

//adds categories to the database Categorie Table
  Future insertCategorie(Insertable<Categorie> categorie) =>
      into(categories).insert(categorie);

//updates the category table
  Future updateCategorie(Insertable<Categorie> categorie) =>
      update(categories).replace(categorie);

//Updates Category Title
  Future updateCategoryTitle(Categorie c) {
    return (update(categories)..where((uc) => uc.id.equals(c.id))).write(
        CategoriesCompanion.insert(categoryTitle: Value(c.categoryTitle)));
  }

// Update the category importance column of a particular row
  Future updateCategoryImportance(Categorie c) {
    return (update(categories)..where((uc) => uc.id.equals(c.id)))
        .write(CategoriesCompanion.insert(isImportant: Value(c.isImportant)));
  }

  Future deleteCategories(Insertable<Categorie> cat) =>
      delete(categories).delete(cat);
}
