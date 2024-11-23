import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/chat_item_data_entity.dart';
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
        from_contact_id INTEGER NOT NULL,
        group_contact_id INTEGER NOT NULL,
        content TEXT NOT NULL,
        time TEXT NOT NULL,
        FOREIGN KEY (from_contact_id) REFERENCES Contacts(id),
        FOREIGN KEY (group_contact_id) REFERENCES Contacts(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE LastMessages (
        group_contact_id INTEGER PRIMARY KEY,
        last_message_id INTEGER NOT NULL,
        FOREIGN KEY (group_contact_id) REFERENCES Contacts(id),
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
    int? fromContactId = await getContactIdByName(message.from);
    int? groupContactId = await getContactIdByName(message.group);
    if (fromContactId == null || groupContactId == null) {
      throw Exception('Contact not found');
    }
    Map<String, dynamic> messageMap = {
      'from_contact_id': fromContactId,
      'group_contact_id': groupContactId,
      'content': message.content,
      'time': message.time,
    };
    int messageId = await db.insert('Messages', messageMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
    await updateLastMessage(groupContactId, messageId, message.content);
    return messageId;
  }

  Future<void> updateLastMessage(int groupContactId, int messageId, String content) async {
    final db = await database;
    await db.insert('LastMessages', {
      'group_contact_id': groupContactId,
      'last_message_id': messageId,
    }, conflictAlgorithm: ConflictAlgorithm.replace);

    // Update the LastMessage table with the latest message content
    await db.update('LastMessages', {
      'last_message_id': messageId,
    }, where: 'group_contact_id = ?', whereArgs: [groupContactId]);
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

  Future<void> deleteChatDatabase() async {
    String path = join(await getDatabasesPath(), "messages.db");
    await deleteDatabase(path);
    _db = null; // Reset database instance
  }


  Future<List<ChatItemDataEntity>> getLastMessages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT Contacts.avatar, Contacts.name, Messages.content AS lastMessage, Messages.time AS timestamp
      FROM LastMessages
      JOIN Contacts ON LastMessages.group_contact_id = Contacts.id
      JOIN Messages ON LastMessages.last_message_id = Messages.id
    ''');

    return List.generate(maps.length, (i) {
      return ChatItemDataEntity(
        avatarPath: maps[i]['avatar'],
        name: maps[i]['name'],
        lastMessage: maps[i]['lastMessage'],
        timestamp: maps[i]['timestamp'],
      );
    });
  }

  Future<List<Contact>> getAllContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Contacts');

    return List.generate(maps.length, (i) {
      return Contact.fromMap(maps[i]);
    });
  }

  Future<List<MessageItem>> getMessagesByGroupName(String groupName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT Messages.from_contact_id, Messages.content, Messages.time, GroupContact.name AS group_name, Sender.name AS sender_name
      FROM Messages
      JOIN Contacts AS GroupContact ON Messages.group_contact_id = GroupContact.id
      JOIN Contacts AS Sender ON Messages.from_contact_id = Sender.id
      WHERE GroupContact.name = ?
    ''', [groupName]);

    return List.generate(maps.length, (i) {
      return MessageItem(
        maps[i]['sender_name'] as String,
        maps[i]['content'] as String,
        maps[i]['time'] as String,
        maps[i]['group_name'] as String,
      );
    });
  }
}