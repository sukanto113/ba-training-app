import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'sqf_database_connection.dart';


class TodoDatabaseConnection extends SQFDatabaseConnection {
  TodoDatabaseConnection() : super(filename: "todo.db") {
    migrate([
      'CREATE TABLE Todo(id INTEGER PRIMARY KEY, todo TEXT)',
      'CREATE TABLE Todo1(id INTEGER PRIMARY KEY, todo TEXT)',
      'CREATE TABLE Todo3(id INTEGER PRIMARY KEY, todo TEXT)',
    ]);
    migrate([
      'CREATE TABLE Task(id INTEGER PRIMARY KEY, task TEXT)',
    ]);
  }
}

class TestDatabase {
  static void test() async {
    var todoDbConn = TodoDatabaseConnection();
    var todoDb = await todoDbConn.database;
  }
}
