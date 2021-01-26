import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final Future<Database> database = getDatabasesPath().then((String path) {
  return openDatabase(join(path, 'app_database.db'), onCreate: (db, version) {
    db.execute(
        'CREATE TABLE category(categoryId, categoryTitle, numberOfList, isFavorite)');
  });
});
