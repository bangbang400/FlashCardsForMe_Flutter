import 'package:flash_cards_for_me/db/words.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// テーブルのカラム名
const String columnId = '_id';
const String columnWord = 'word';
const String columnCommentary = 'commentary';
const String columnCorrect = 'correct';
const String columnWrong = 'wrong';
const String columnCreatedAt = 'createdAt';
const String columnModifiedAt = 'modifiedAt';

// Columns setting
const List<String> columns = [
  columnId,
  columnWord,
  columnCommentary,
  columnCorrect,
  columnWrong,
  columnCreatedAt,
  columnModifiedAt,
];

class DbHelper {
  static final DbHelper instance = DbHelper._createInstance();
  static Database? _database;

  DbHelper._createInstance();

  // Create db instance
  Future<Database> get database async {
    return _database ??= await _initDB();
  }

  // Open database
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(),'words_database.db');
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // When the db does not exist
  Future _onCreate(Database db, int version) async{
        await db.execute(
  '''CREATE TABLE words(
                id INTEGER PRIMARY KEY,
                word TEXT,
                commentary TEXT,
                correct INTEGER,
                wrong INTEGER,
                createdAt INTEGER,
                modifiedAt INTEGER
                )'''
        );
  }

  // get All
  Future<List<Words>> getAllWords() async {
    final db = await instance.database;
    final wordsData = await db.query('words');
    // parse data to List
    return wordsData.map((json) => Words.fromJson(json)).toList();
  }

  // insert
  Future insert(Words words) async {
    final db = await database;
    return await db.insert(
        'word',
        words.toJson());
  }

  // update
 Future update(Words words) async {
    final db = await database;
    return await db.update(
        'words',
        words.toJson(),
    where: '_id = ?',
    whereArgs: [words.id],
    );
 }

 // delete
 Future delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'words',
      where: '_id = ?',
      whereArgs: [id],
    );
 }
}