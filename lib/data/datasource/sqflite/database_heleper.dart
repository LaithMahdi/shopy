import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'favorite.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE FavoriteShoes (
            id INTEGER PRIMARY KEY,
            shoeId INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertFavoriteShoe(int shoeId) async {
    final dbClient = await db;
    return await dbClient.insert('FavoriteShoes', {'shoeId': shoeId});
  }

  Future<int> deleteFavoriteShoe(int shoeId) async {
    final dbClient = await db;
    return await dbClient.delete(
      'FavoriteShoes',
      where: 'shoeId = ?',
      whereArgs: [shoeId],
    );
  }

  Future<List<int>> getFavoriteShoeIds() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps =
        await dbClient.query('FavoriteShoes');
    return List.generate(maps.length, (index) => maps[index]['shoeId']);
  }
}
