import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wechat_clone/value/colors.dart';

class Dog {
  final int id;
  final String name;
  final int age;

  Dog(this.id, this.name, this.age);

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

class DBhelper {
  late Future<Database> database;
  final String tag = "sqldemo: ";

  final String dbName = "dooggie_database.db";

  void openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(join(await getDatabasesPath(), dbName));
    print('$tag数据库创建');
  }

  void createTable() async {
    database = openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER',
        );
      },
      version: 1,
    );
    print('$tag表创建');
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('$tag插入数据');
  }

  void test() async {
    openDB();

    createTable();

    var fido = Dog(0, 'Fido', 35);

    await insertDog(fido);

    print(await dogs());

    // 更新数据
    var fido2 = Dog(fido.id, fido.name, fido.age + 7);
    await updateDog(fido2);

    print(await dogs());
  }

  Future<List<Dog>> dogs() async {
    final db = await database;
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'age': age as int,
          } in dogMaps)
        Dog(id, name, age),
    ];
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;

    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: MaterialButton(
              color: AppColors.primaryColor,
                child: Text('数据库Demo'),
                onPressed: () {
                  DBhelper().test();
                }),
          ),
        ),
      ),
    );
  }
}
