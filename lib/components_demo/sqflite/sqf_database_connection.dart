
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class SQFDatabaseConnection {
  SQFDatabaseConnection({required this.filename, String? directoryPath})
      : _directoryPath = directoryPath;

  final String filename;
  String? _directoryPath;

  Database? _database;
  final List<Iterable<String>> _migrations = [];

  Future<Database> get database async {
    _database ??= await openDatabase(
      await _dbFilepath,
      version: _migrations.length,
      onUpgrade: _onUpgrade,
    );
    return _database!;
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    for (var i = oldVersion; i < newVersion; ++i) {
      for (var sql in _migrations[i]) {
        await db.execute(sql);
      }
    }
  }

  Future<String> get _dbFilepath async {
    _directoryPath ??= await _documentDirectoryPath;
    var path = join(_directoryPath!, filename);
    return path;
  }

  Future<String> get _documentDirectoryPath async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    return documentDirectory.path;
  }

  void migrate(Iterable<String> sqls) {
    _migrations.add(sqls);
  }
}