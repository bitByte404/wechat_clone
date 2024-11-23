import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/models.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper._internal();

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), "messages.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        avatar TEXT NOT NULL,
        name TEXT NOT NULL UNIQUE
      )
    ''');
    await db.execute('''
      CREATE TABLE Messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        contact_id INTEGER NOT NULL,
        content TEXT NOT NULL,
        time TEXT NOT NULL,
        FOREIGN KEY (contact_id) REFERENCES Contacts(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE LastMessages (
        contact_id INTEGER PRIMARY KEY,
        last_message_id INTEGER NOT NULL,
        FOREIGN KEY (contact_id) REFERENCES Contacts(id),
        FOREIGN KEY (last_message_id) REFERENCES Messages(id)
      )
    ''');
    print("Tables created");
  }

  Future<int> insertContact(Contact contact) async {
    final db = await database;
    return await db.insert('Contacts', contact.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertMessage(MessageItem message) async {
    final db = await database;
    int? contactId = await getContactIdByName(message.from);
    if (contactId == null) {
      throw Exception('Contact not found');
    }
    Map<String, dynamic> messageMap = {
      'contact_id': contactId,
      'content': message.content,
      'time': message.time,
    };
    int messageId = await db.insert('Messages', messageMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
    await updateLastMessage(contactId, messageId);
    return messageId;
  }

  Future<void> updateLastMessage(int contactId, int messageId) async {
    final db = await database;
    await db.insert('LastMessages', {
      'contact_id': contactId,
      'last_message_id': messageId,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Contact>> getAllContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Contacts');
    return List.generate(maps.length, (i) {
      return Contact.fromMap(maps[i]);
    });
  }

  Future<List<LastMessage>> getLastMessages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT c.avatar, c.name, m.content AS lastMessage
      FROM LastMessages lm
      JOIN Contacts c ON lm.contact_id = c.id
      JOIN Messages m ON lm.last_message_id = m.id
    ''');
    return List.generate(maps.length, (i) {
      return LastMessage.fromMap(maps[i]);
    });
  }

  Future<int?> getContactIdByName(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Contacts',
      columns: ['id'],
      where: 'name = ?',
      whereArgs: [name],
    );
    if (maps.isNotEmpty) {
      return maps.first['id'] as int;
    }
    return null;
  }
}
