import 'package:sqflite/sqflite.dart';

class Todo {
  String text;
  Todo(this.text);
  @override
  String toString() {
    return text;
  }
}

class TodoDatabase {
  static Database? _db;
  TodoDatabase._();

  static Future<Database> get database async {
    _db ??= await _openDatabase();
    return _db!;
  }

  static Future<Database> _openDatabase() async {
    // print(object)
    final databasePath = await getDatabasesPath();
    const dbFileName = "todo_DB.db";
    final dbFilePath = '$databasePath/$dbFileName';

    return await openDatabase(
      dbFilePath,
      version: 1,
      onCreate: (db, version) {
        print("db create called");
        db.execute('CREATE TABLE Todo(id INTEGER PRIMARY KEY, todo TEXT)');
      },
    );
  }

  static Future<void> insertTodo(String todo) async {
    (await database).transaction(
      (txn) async {
        int id = await txn.rawInsert(
          'INSERT INTO Todo(todo) VALUES(?)',
          [todo],
        );
        print("todo insert into $id");
      },
    );
  }

  static Future<List<Todo>> readAll() async {
    List<Map> list = await (await database).rawQuery('SELECT * FROM Todo');
    return list.map((e) => Todo(e["todo"])).toList();
  }

  static Future<void> deleteAll() async {
    await (await database).rawDelete('DELETE FROM Todo');
  }
}
