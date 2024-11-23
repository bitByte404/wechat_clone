// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();
//
//   factory DatabaseHelper() => _instance;
//   static Database? _db;
//
//   Future<Database> get db async {
//     if (_db != null) return _db!;
//     _db = await initDb();
//     return _db!;
//   }
//
//   DatabaseHelper.internal();
//
//   Future<Database> initDb() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "test.db");
//     var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return theDb;
//   }
//
//   void _onCreate(Database db, int version) async {
//     await db.execute(
//         "CREATE TABLE Chat (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
//     print("Table created");
//   }
// }
//
//    class Item {
//      int? id;
//      String name;
//      int age;
//
//      Item({this.id, required this.name, required this.age});
//
//      Map<String, dynamic> toMap() {
//        var map = <String, dynamic>{'name': name, 'age': age};
//        if (id != null) {
//          map['id'] = id;
//        }
//        return map;
//      }
//
//      Item.fromMap(Map<String, dynamic> map)
//          : id = map['id'],
//            name = map['name'] ?? '',
//            age = map['age'] ?? 0;
//    }
//
