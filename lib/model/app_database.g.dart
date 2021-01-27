// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int categoryId;
  final String categoryTitle;
  final int numberOfList;
  final bool isFavorite;
  final int color;
  CategoryData(
      {@required this.categoryId,
      @required this.categoryTitle,
      this.numberOfList,
      @required this.isFavorite,
      this.color});
  factory CategoryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return CategoryData(
      categoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
      categoryTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_title']),
      numberOfList: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}number_of_list']),
      isFavorite: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || categoryTitle != null) {
      map['category_title'] = Variable<String>(categoryTitle);
    }
    if (!nullToAbsent || numberOfList != null) {
      map['number_of_list'] = Variable<int>(numberOfList);
    }
    if (!nullToAbsent || isFavorite != null) {
      map['is_favorite'] = Variable<bool>(isFavorite);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      categoryTitle: categoryTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryTitle),
      numberOfList: numberOfList == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfList),
      isFavorite: isFavorite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavorite),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryData(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryTitle: serializer.fromJson<String>(json['categoryTitle']),
      numberOfList: serializer.fromJson<int>(json['numberOfList']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryTitle': serializer.toJson<String>(categoryTitle),
      'numberOfList': serializer.toJson<int>(numberOfList),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'color': serializer.toJson<int>(color),
    };
  }

  CategoryData copyWith(
          {int categoryId,
          String categoryTitle,
          int numberOfList,
          bool isFavorite,
          int color}) =>
      CategoryData(
        categoryId: categoryId ?? this.categoryId,
        categoryTitle: categoryTitle ?? this.categoryTitle,
        numberOfList: numberOfList ?? this.numberOfList,
        isFavorite: isFavorite ?? this.isFavorite,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryTitle: $categoryTitle, ')
          ..write('numberOfList: $numberOfList, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      categoryId.hashCode,
      $mrjc(
          categoryTitle.hashCode,
          $mrjc(numberOfList.hashCode,
              $mrjc(isFavorite.hashCode, color.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.categoryId == this.categoryId &&
          other.categoryTitle == this.categoryTitle &&
          other.numberOfList == this.numberOfList &&
          other.isFavorite == this.isFavorite &&
          other.color == this.color);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> categoryId;
  final Value<String> categoryTitle;
  final Value<int> numberOfList;
  final Value<bool> isFavorite;
  final Value<int> color;
  const CategoryCompanion({
    this.categoryId = const Value.absent(),
    this.categoryTitle = const Value.absent(),
    this.numberOfList = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.color = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.categoryId = const Value.absent(),
    @required String categoryTitle,
    this.numberOfList = const Value.absent(),
    @required bool isFavorite,
    this.color = const Value.absent(),
  })  : categoryTitle = Value(categoryTitle),
        isFavorite = Value(isFavorite);
  static Insertable<CategoryData> custom({
    Expression<int> categoryId,
    Expression<String> categoryTitle,
    Expression<int> numberOfList,
    Expression<bool> isFavorite,
    Expression<int> color,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (categoryTitle != null) 'category_title': categoryTitle,
      if (numberOfList != null) 'number_of_list': numberOfList,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (color != null) 'color': color,
    });
  }

  CategoryCompanion copyWith(
      {Value<int> categoryId,
      Value<String> categoryTitle,
      Value<int> numberOfList,
      Value<bool> isFavorite,
      Value<int> color}) {
    return CategoryCompanion(
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      numberOfList: numberOfList ?? this.numberOfList,
      isFavorite: isFavorite ?? this.isFavorite,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryTitle.present) {
      map['category_title'] = Variable<String>(categoryTitle.value);
    }
    if (numberOfList.present) {
      map['number_of_list'] = Variable<int>(numberOfList.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryTitle: $categoryTitle, ')
          ..write('numberOfList: $numberOfList, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoryTable(this._db, [this._alias]);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('category_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _categoryTitleMeta =
      const VerificationMeta('categoryTitle');
  GeneratedTextColumn _categoryTitle;
  @override
  GeneratedTextColumn get categoryTitle =>
      _categoryTitle ??= _constructCategoryTitle();
  GeneratedTextColumn _constructCategoryTitle() {
    return GeneratedTextColumn('category_title', $tableName, false,
        minTextLength: 3, maxTextLength: 15, $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _numberOfListMeta =
      const VerificationMeta('numberOfList');
  GeneratedIntColumn _numberOfList;
  @override
  GeneratedIntColumn get numberOfList =>
      _numberOfList ??= _constructNumberOfList();
  GeneratedIntColumn _constructNumberOfList() {
    return GeneratedIntColumn(
      'number_of_list',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  GeneratedBoolColumn _isFavorite;
  @override
  GeneratedBoolColumn get isFavorite => _isFavorite ??= _constructIsFavorite();
  GeneratedBoolColumn _constructIsFavorite() {
    return GeneratedBoolColumn(
      'is_favorite',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [categoryId, categoryTitle, numberOfList, isFavorite, color];
  @override
  $CategoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'category';
  @override
  final String actualTableName = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id'], _categoryIdMeta));
    }
    if (data.containsKey('category_title')) {
      context.handle(
          _categoryTitleMeta,
          categoryTitle.isAcceptableOrUnknown(
              data['category_title'], _categoryTitleMeta));
    } else if (isInserting) {
      context.missing(_categoryTitleMeta);
    }
    if (data.containsKey('number_of_list')) {
      context.handle(
          _numberOfListMeta,
          numberOfList.isAcceptableOrUnknown(
              data['number_of_list'], _numberOfListMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite'], _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId};
  @override
  CategoryData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CategoryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(_db, alias);
  }
}

class ToDoListData extends DataClass implements Insertable<ToDoListData> {
  final int listId;
  final String title;
  final String time;
  final String date;
  final String frequency;
  final String note;
  final bool isCompleted;
  final String steps;
  final bool isImportant;
  ToDoListData(
      {@required this.listId,
      @required this.title,
      @required this.time,
      @required this.date,
      @required this.frequency,
      @required this.note,
      @required this.isCompleted,
      @required this.steps,
      @required this.isImportant});
  factory ToDoListData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ToDoListData(
      listId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}list_id']),
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
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || listId != null) {
      map['list_id'] = Variable<int>(listId);
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
    return map;
  }

  ToDoListCompanion toCompanion(bool nullToAbsent) {
    return ToDoListCompanion(
      listId:
          listId == null && nullToAbsent ? const Value.absent() : Value(listId),
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
    );
  }

  factory ToDoListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ToDoListData(
      listId: serializer.fromJson<int>(json['listId']),
      title: serializer.fromJson<String>(json['title']),
      time: serializer.fromJson<String>(json['time']),
      date: serializer.fromJson<String>(json['date']),
      frequency: serializer.fromJson<String>(json['frequency']),
      note: serializer.fromJson<String>(json['note']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      steps: serializer.fromJson<String>(json['steps']),
      isImportant: serializer.fromJson<bool>(json['isImportant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'listId': serializer.toJson<int>(listId),
      'title': serializer.toJson<String>(title),
      'time': serializer.toJson<String>(time),
      'date': serializer.toJson<String>(date),
      'frequency': serializer.toJson<String>(frequency),
      'note': serializer.toJson<String>(note),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'steps': serializer.toJson<String>(steps),
      'isImportant': serializer.toJson<bool>(isImportant),
    };
  }

  ToDoListData copyWith(
          {int listId,
          String title,
          String time,
          String date,
          String frequency,
          String note,
          bool isCompleted,
          String steps,
          bool isImportant}) =>
      ToDoListData(
        listId: listId ?? this.listId,
        title: title ?? this.title,
        time: time ?? this.time,
        date: date ?? this.date,
        frequency: frequency ?? this.frequency,
        note: note ?? this.note,
        isCompleted: isCompleted ?? this.isCompleted,
        steps: steps ?? this.steps,
        isImportant: isImportant ?? this.isImportant,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoListData(')
          ..write('listId: $listId, ')
          ..write('title: $title, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('frequency: $frequency, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('steps: $steps, ')
          ..write('isImportant: $isImportant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      listId.hashCode,
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
                                  steps.hashCode, isImportant.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ToDoListData &&
          other.listId == this.listId &&
          other.title == this.title &&
          other.time == this.time &&
          other.date == this.date &&
          other.frequency == this.frequency &&
          other.note == this.note &&
          other.isCompleted == this.isCompleted &&
          other.steps == this.steps &&
          other.isImportant == this.isImportant);
}

class ToDoListCompanion extends UpdateCompanion<ToDoListData> {
  final Value<int> listId;
  final Value<String> title;
  final Value<String> time;
  final Value<String> date;
  final Value<String> frequency;
  final Value<String> note;
  final Value<bool> isCompleted;
  final Value<String> steps;
  final Value<bool> isImportant;
  const ToDoListCompanion({
    this.listId = const Value.absent(),
    this.title = const Value.absent(),
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.frequency = const Value.absent(),
    this.note = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.steps = const Value.absent(),
    this.isImportant = const Value.absent(),
  });
  ToDoListCompanion.insert({
    this.listId = const Value.absent(),
    @required String title,
    @required String time,
    @required String date,
    @required String frequency,
    @required String note,
    @required bool isCompleted,
    @required String steps,
    @required bool isImportant,
  })  : title = Value(title),
        time = Value(time),
        date = Value(date),
        frequency = Value(frequency),
        note = Value(note),
        isCompleted = Value(isCompleted),
        steps = Value(steps),
        isImportant = Value(isImportant);
  static Insertable<ToDoListData> custom({
    Expression<int> listId,
    Expression<String> title,
    Expression<String> time,
    Expression<String> date,
    Expression<String> frequency,
    Expression<String> note,
    Expression<bool> isCompleted,
    Expression<String> steps,
    Expression<bool> isImportant,
  }) {
    return RawValuesInsertable({
      if (listId != null) 'list_id': listId,
      if (title != null) 'title': title,
      if (time != null) 'time': time,
      if (date != null) 'date': date,
      if (frequency != null) 'frequency': frequency,
      if (note != null) 'note': note,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (steps != null) 'steps': steps,
      if (isImportant != null) 'is_important': isImportant,
    });
  }

  ToDoListCompanion copyWith(
      {Value<int> listId,
      Value<String> title,
      Value<String> time,
      Value<String> date,
      Value<String> frequency,
      Value<String> note,
      Value<bool> isCompleted,
      Value<String> steps,
      Value<bool> isImportant}) {
    return ToDoListCompanion(
      listId: listId ?? this.listId,
      title: title ?? this.title,
      time: time ?? this.time,
      date: date ?? this.date,
      frequency: frequency ?? this.frequency,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      steps: steps ?? this.steps,
      isImportant: isImportant ?? this.isImportant,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoListCompanion(')
          ..write('listId: $listId, ')
          ..write('title: $title, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('frequency: $frequency, ')
          ..write('note: $note, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('steps: $steps, ')
          ..write('isImportant: $isImportant')
          ..write(')'))
        .toString();
  }
}

class $ToDoListTable extends ToDoList
    with TableInfo<$ToDoListTable, ToDoListData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ToDoListTable(this._db, [this._alias]);
  final VerificationMeta _listIdMeta = const VerificationMeta('listId');
  GeneratedIntColumn _listId;
  @override
  GeneratedIntColumn get listId => _listId ??= _constructListId();
  GeneratedIntColumn _constructListId() {
    return GeneratedIntColumn('list_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 3, maxTextLength: 15, $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedTextColumn _time;
  @override
  GeneratedTextColumn get time => _time ??= _constructTime();
  GeneratedTextColumn _constructTime() {
    return GeneratedTextColumn('time', $tableName, false,
        minTextLength: 4, maxTextLength: 5);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn('date', $tableName, false,
        minTextLength: 7, maxTextLength: 9);
  }

  final VerificationMeta _frequencyMeta = const VerificationMeta('frequency');
  GeneratedTextColumn _frequency;
  @override
  GeneratedTextColumn get frequency => _frequency ??= _constructFrequency();
  GeneratedTextColumn _constructFrequency() {
    return GeneratedTextColumn('frequency', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn('note', $tableName, false,
        minTextLength: 0, maxTextLength: 150);
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn(
      'is_completed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stepsMeta = const VerificationMeta('steps');
  GeneratedTextColumn _steps;
  @override
  GeneratedTextColumn get steps => _steps ??= _constructSteps();
  GeneratedTextColumn _constructSteps() {
    return GeneratedTextColumn('steps', $tableName, false,
        minTextLength: 0, maxTextLength: 150);
  }

  final VerificationMeta _isImportantMeta =
      const VerificationMeta('isImportant');
  GeneratedBoolColumn _isImportant;
  @override
  GeneratedBoolColumn get isImportant =>
      _isImportant ??= _constructIsImportant();
  GeneratedBoolColumn _constructIsImportant() {
    return GeneratedBoolColumn(
      'is_important',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        listId,
        title,
        time,
        date,
        frequency,
        note,
        isCompleted,
        steps,
        isImportant
      ];
  @override
  $ToDoListTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'to_do_list';
  @override
  final String actualTableName = 'to_do_list';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id'], _listIdMeta));
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
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency'], _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
          _stepsMeta, steps.isAcceptableOrUnknown(data['steps'], _stepsMeta));
    } else if (isInserting) {
      context.missing(_stepsMeta);
    }
    if (data.containsKey('is_important')) {
      context.handle(
          _isImportantMeta,
          isImportant.isAcceptableOrUnknown(
              data['is_important'], _isImportantMeta));
    } else if (isInserting) {
      context.missing(_isImportantMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {listId};
  @override
  ToDoListData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ToDoListData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ToDoListTable createAlias(String alias) {
    return $ToDoListTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoryTable _category;
  $CategoryTable get category => _category ??= $CategoryTable(this);
  $ToDoListTable _toDoList;
  $ToDoListTable get toDoList => _toDoList ??= $ToDoListTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [category, toDoList];
}
