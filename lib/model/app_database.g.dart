// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Categorie extends DataClass implements Insertable<Categorie> {
  final int id;
  final String categoryTitle;
  final int numberOfList;
  final bool isImportant;
  final int color;
  Categorie(
      {@required this.id,
      this.categoryTitle,
      this.numberOfList,
      @required this.isImportant,
      this.color});
  factory Categorie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Categorie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      categoryTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_title']),
      numberOfList: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}number_of_list']),
      isImportant: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_important']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || categoryTitle != null) {
      map['category_title'] = Variable<String>(categoryTitle);
    }
    if (!nullToAbsent || numberOfList != null) {
      map['number_of_list'] = Variable<int>(numberOfList);
    }
    if (!nullToAbsent || isImportant != null) {
      map['is_important'] = Variable<bool>(isImportant);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      categoryTitle: categoryTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryTitle),
      numberOfList: numberOfList == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfList),
      isImportant: isImportant == null && nullToAbsent
          ? const Value.absent()
          : Value(isImportant),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    );
  }

  factory Categorie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Categorie(
      id: serializer.fromJson<int>(json['id']),
      categoryTitle: serializer.fromJson<String>(json['categoryTitle']),
      numberOfList: serializer.fromJson<int>(json['numberOfList']),
      isImportant: serializer.fromJson<bool>(json['isImportant']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryTitle': serializer.toJson<String>(categoryTitle),
      'numberOfList': serializer.toJson<int>(numberOfList),
      'isImportant': serializer.toJson<bool>(isImportant),
      'color': serializer.toJson<int>(color),
    };
  }

  Categorie copyWith(
          {int id,
          String categoryTitle,
          int numberOfList,
          bool isImportant,
          int color}) =>
      Categorie(
        id: id ?? this.id,
        categoryTitle: categoryTitle ?? this.categoryTitle,
        numberOfList: numberOfList ?? this.numberOfList,
        isImportant: isImportant ?? this.isImportant,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Categorie(')
          ..write('id: $id, ')
          ..write('categoryTitle: $categoryTitle, ')
          ..write('numberOfList: $numberOfList, ')
          ..write('isImportant: $isImportant, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          categoryTitle.hashCode,
          $mrjc(numberOfList.hashCode,
              $mrjc(isImportant.hashCode, color.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Categorie &&
          other.id == this.id &&
          other.categoryTitle == this.categoryTitle &&
          other.numberOfList == this.numberOfList &&
          other.isImportant == this.isImportant &&
          other.color == this.color);
}

class CategoriesCompanion extends UpdateCompanion<Categorie> {
  final Value<int> id;
  final Value<String> categoryTitle;
  final Value<int> numberOfList;
  final Value<bool> isImportant;
  final Value<int> color;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryTitle = const Value.absent(),
    this.numberOfList = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.color = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.categoryTitle = const Value.absent(),
    this.numberOfList = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.color = const Value.absent(),
  });
  static Insertable<Categorie> custom({
    Expression<int> id,
    Expression<String> categoryTitle,
    Expression<int> numberOfList,
    Expression<bool> isImportant,
    Expression<int> color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryTitle != null) 'category_title': categoryTitle,
      if (numberOfList != null) 'number_of_list': numberOfList,
      if (isImportant != null) 'is_important': isImportant,
      if (color != null) 'color': color,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> categoryTitle,
      Value<int> numberOfList,
      Value<bool> isImportant,
      Value<int> color}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      numberOfList: numberOfList ?? this.numberOfList,
      isImportant: isImportant ?? this.isImportant,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryTitle.present) {
      map['category_title'] = Variable<String>(categoryTitle.value);
    }
    if (numberOfList.present) {
      map['number_of_list'] = Variable<int>(numberOfList.value);
    }
    if (isImportant.present) {
      map['is_important'] = Variable<bool>(isImportant.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryTitle: $categoryTitle, ')
          ..write('numberOfList: $numberOfList, ')
          ..write('isImportant: $isImportant, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Categorie> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _categoryTitleMeta =
      const VerificationMeta('categoryTitle');
  GeneratedTextColumn _categoryTitle;
  @override
  GeneratedTextColumn get categoryTitle =>
      _categoryTitle ??= _constructCategoryTitle();
  GeneratedTextColumn _constructCategoryTitle() {
    return GeneratedTextColumn('category_title', $tableName, true,
        minTextLength: 3, maxTextLength: 30);
  }

  final VerificationMeta _numberOfListMeta =
      const VerificationMeta('numberOfList');
  GeneratedIntColumn _numberOfList;
  @override
  GeneratedIntColumn get numberOfList =>
      _numberOfList ??= _constructNumberOfList();
  GeneratedIntColumn _constructNumberOfList() {
    return GeneratedIntColumn('number_of_list', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _isImportantMeta =
      const VerificationMeta('isImportant');
  GeneratedBoolColumn _isImportant;
  @override
  GeneratedBoolColumn get isImportant =>
      _isImportant ??= _constructIsImportant();
  GeneratedBoolColumn _constructIsImportant() {
    return GeneratedBoolColumn('is_important', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn('color', $tableName, true,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryTitle, numberOfList, isImportant, color];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Categorie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('category_title')) {
      context.handle(
          _categoryTitleMeta,
          categoryTitle.isAcceptableOrUnknown(
              data['category_title'], _categoryTitleMeta));
    }
    if (data.containsKey('number_of_list')) {
      context.handle(
          _numberOfListMeta,
          numberOfList.isAcceptableOrUnknown(
              data['number_of_list'], _numberOfListMeta));
    }
    if (data.containsKey('is_important')) {
      context.handle(
          _isImportantMeta,
          isImportant.isAcceptableOrUnknown(
              data['is_important'], _isImportantMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Categorie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Categorie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int taskid;
  final String title;
  final String time;
  final String date;
  final String frequency;
  final String note;
  final bool isCompleted;
  final String steps;
  final bool isImportant;
  final int catid;
  Task(
      {@required this.taskid,
      @required this.title,
      this.time,
      this.date,
      this.frequency,
      this.note,
      @required this.isCompleted,
      this.steps,
      @required this.isImportant,
      this.catid});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      taskid: intType.mapFromDatabaseResponse(data['${effectivePrefix}taskid']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      time: stringType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      frequency: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}frequency']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      isCompleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed']),
      steps:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}steps']),
      isImportant: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_important']),
      catid: intType.mapFromDatabaseResponse(data['${effectivePrefix}catid']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || taskid != null) {
      map['taskid'] = Variable<int>(taskid);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<String>(time);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<String>(frequency);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    if (!nullToAbsent || steps != null) {
      map['steps'] = Variable<String>(steps);
    }
    if (!nullToAbsent || isImportant != null) {
      map['is_important'] = Variable<bool>(isImportant);
    }
    if (!nullToAbsent || catid != null) {
      map['catid'] = Variable<int>(catid);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      taskid:
          taskid == null && nullToAbsent ? const Value.absent() : Value(taskid),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
      steps:
          steps == null && nullToAbsent ? const Value.absent() : Value(steps),
      isImportant: isImportant == null && nullToAbsent
          ? const Value.absent()
          : Value(isImportant),
      catid:
          catid == null && nullToAbsent ? const Value.absent() : Value(catid),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      taskid: serializer.fromJson<int>(json['taskid']),
      title: serializer.fromJson<String>(json['title']),
      time: serializer.fromJson<String>(json['time']),
      date: serializer.fromJson<String>(json['date']),
      frequency: serializer.fromJson<String>(json['frequency']),
      note: serializer.fromJson<String>(json['note']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      steps: serializer.fromJson<String>(json['steps']),
      isImportant: serializer.fromJson<bool>(json['isImportant']),
      catid: serializer.fromJson<int>(json['catid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskid': serializer.toJson<int>(taskid),
      'title': serializer.toJson<String>(title),
      'time': serializer.toJson<String>(time),
      'date': serializer.toJson<String>(date),
      'frequency': serializer.toJson<String>(frequency),
      'note': serializer.toJson<String>(note),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'steps': serializer.toJson<String>(steps),
      'isImportant': serializer.toJson<bool>(isImportant),
      'catid': serializer.toJson<int>(catid),
    };
  }

  Task copyWith(
          {int taskid,
          String title,
          String time,
          String date,
          String frequency,
          String note,
          bool isCompleted,
          String steps,
          bool isImportant,
          int catid}) =>
      Task(
        taskid: taskid ?? this.taskid,
        title: title ?? this.title,
        time: time ?? this.time,
        date: date ?? this.date,
        frequency: frequency ?? this.frequency,
        note: note ?? this.note,
        isCompleted: isCompleted ?? this.isCompleted,
        steps: steps ?? this.steps,
        isImportant: isImportant ?? this.isImportant,
        catid: catid ?? this.catid,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('taskid: $taskid, ')
          ..write('title: $title, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('frequency: $frequency, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('steps: $steps, ')
          ..write('isImportant: $isImportant, ')
          ..write('catid: $catid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      taskid.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              time.hashCode,
              $mrjc(
                  date.hashCode,
                  $mrjc(
                      frequency.hashCode,
                      $mrjc(
                          note.hashCode,
                          $mrjc(
                              isCompleted.hashCode,
                              $mrjc(
                                  steps.hashCode,
                                  $mrjc(isImportant.hashCode,
                                      catid.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.taskid == this.taskid &&
          other.title == this.title &&
          other.time == this.time &&
          other.date == this.date &&
          other.frequency == this.frequency &&
          other.note == this.note &&
          other.isCompleted == this.isCompleted &&
          other.steps == this.steps &&
          other.isImportant == this.isImportant &&
          other.catid == this.catid);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> taskid;
  final Value<String> title;
  final Value<String> time;
  final Value<String> date;
  final Value<String> frequency;
  final Value<String> note;
  final Value<bool> isCompleted;
  final Value<String> steps;
  final Value<bool> isImportant;
  final Value<int> catid;
  const TasksCompanion({
    this.taskid = const Value.absent(),
    this.title = const Value.absent(),
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.frequency = const Value.absent(),
    this.note = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.steps = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.catid = const Value.absent(),
  });
  TasksCompanion.insert({
    this.taskid = const Value.absent(),
    @required String title,
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.frequency = const Value.absent(),
    this.note = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.steps = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.catid = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Task> custom({
    Expression<int> taskid,
    Expression<String> title,
    Expression<String> time,
    Expression<String> date,
    Expression<String> frequency,
    Expression<String> note,
    Expression<bool> isCompleted,
    Expression<String> steps,
    Expression<bool> isImportant,
    Expression<int> catid,
  }) {
    return RawValuesInsertable({
      if (taskid != null) 'taskid': taskid,
      if (title != null) 'title': title,
      if (time != null) 'time': time,
      if (date != null) 'date': date,
      if (frequency != null) 'frequency': frequency,
      if (note != null) 'note': note,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (steps != null) 'steps': steps,
      if (isImportant != null) 'is_important': isImportant,
      if (catid != null) 'catid': catid,
    });
  }

  TasksCompanion copyWith(
      {Value<int> taskid,
      Value<String> title,
      Value<String> time,
      Value<String> date,
      Value<String> frequency,
      Value<String> note,
      Value<bool> isCompleted,
      Value<String> steps,
      Value<bool> isImportant,
      Value<int> catid}) {
    return TasksCompanion(
      taskid: taskid ?? this.taskid,
      title: title ?? this.title,
      time: time ?? this.time,
      date: date ?? this.date,
      frequency: frequency ?? this.frequency,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      steps: steps ?? this.steps,
      isImportant: isImportant ?? this.isImportant,
      catid: catid ?? this.catid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskid.present) {
      map['taskid'] = Variable<int>(taskid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (steps.present) {
      map['steps'] = Variable<String>(steps.value);
    }
    if (isImportant.present) {
      map['is_important'] = Variable<bool>(isImportant.value);
    }
    if (catid.present) {
      map['catid'] = Variable<int>(catid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('taskid: $taskid, ')
          ..write('title: $title, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('frequency: $frequency, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('steps: $steps, ')
          ..write('isImportant: $isImportant, ')
          ..write('catid: $catid')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _taskidMeta = const VerificationMeta('taskid');
  GeneratedIntColumn _taskid;
  @override
  GeneratedIntColumn get taskid => _taskid ??= _constructTaskid();
  GeneratedIntColumn _constructTaskid() {
    return GeneratedIntColumn('taskid', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 3, maxTextLength: 30, $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedTextColumn _time;
  @override
  GeneratedTextColumn get time => _time ??= _constructTime();
  GeneratedTextColumn _constructTime() {
    return GeneratedTextColumn(
      'time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _frequencyMeta = const VerificationMeta('frequency');
  GeneratedTextColumn _frequency;
  @override
  GeneratedTextColumn get frequency => _frequency ??= _constructFrequency();
  GeneratedTextColumn _constructFrequency() {
    return GeneratedTextColumn('frequency', $tableName, true,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, true,
        minTextLength: 0, maxTextLength: 150);
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn('is_completed', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _stepsMeta = const VerificationMeta('steps');
  GeneratedTextColumn _steps;
  @override
  GeneratedTextColumn get steps => _steps ??= _constructSteps();
  GeneratedTextColumn _constructSteps() {
    return GeneratedTextColumn('steps', $tableName, true,
        minTextLength: 0, maxTextLength: 150);
  }

  final VerificationMeta _isImportantMeta =
      const VerificationMeta('isImportant');
  GeneratedBoolColumn _isImportant;
  @override
  GeneratedBoolColumn get isImportant =>
      _isImportant ??= _constructIsImportant();
  GeneratedBoolColumn _constructIsImportant() {
    return GeneratedBoolColumn('is_important', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _catidMeta = const VerificationMeta('catid');
  GeneratedIntColumn _catid;
  @override
  GeneratedIntColumn get catid => _catid ??= _constructCatid();
  GeneratedIntColumn _constructCatid() {
    return GeneratedIntColumn('catid', $tableName, true,
        $customConstraints: 'NULL REFERENCES categories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [
        taskid,
        title,
        time,
        date,
        frequency,
        note,
        isCompleted,
        steps,
        isImportant,
        catid
      ];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('taskid')) {
      context.handle(_taskidMeta,
          taskid.isAcceptableOrUnknown(data['taskid'], _taskidMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time'], _timeMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency'], _frequencyMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    }
    if (data.containsKey('steps')) {
      context.handle(
          _stepsMeta, steps.isAcceptableOrUnknown(data['steps'], _stepsMeta));
    }
    if (data.containsKey('is_important')) {
      context.handle(
          _isImportantMeta,
          isImportant.isAcceptableOrUnknown(
              data['is_important'], _isImportantMeta));
    }
    if (data.containsKey('catid')) {
      context.handle(
          _catidMeta, catid.isAcceptableOrUnknown(data['catid'], _catidMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskid};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as AppDatabase);
  CategorieDao _categorieDao;
  CategorieDao get categorieDao =>
      _categorieDao ??= CategorieDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, tasks];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TaskDaoMixin on DatabaseAccessor<AppDatabase> {
  $TasksTable get tasks => attachedDatabase.tasks;
  $CategoriesTable get categories => attachedDatabase.categories;
}
mixin _$CategorieDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
}
