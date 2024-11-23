import 'package:flutter_test/flutter_test.dart';
import 'package:wechat_clone/db/database_helper.dart';
import 'package:wechat_clone/models/models.dart';

void main() {
  late DatabaseHelper dbHelper;

  setUp(() async {
    dbHelper = DatabaseHelper();
    await dbHelper.database;
  });

  tearDown(() async {
    await dbHelper.deleteChatDatabase();
  });

  group('DatabaseHelper Tests', () {
    test('Insert and Get Contacts', () async {
      // 插入联系人
      int contactId1 = await dbHelper.insertContact(Contact('avatar1.jpg', 'Alice'));
      int contactId2 = await dbHelper.insertContact(Contact('avatar2.jpg', 'Bob'));

      // 获取所有联系人
      List<Contact> contacts = await dbHelper.getAllContacts();
      expect(contacts.length, 2);
      expect(contacts[0].name, 'Alice');
      expect(contacts[1].name, 'Bob');
    });

    test('Insert and Get Messages', () async {
      // 插入联系人
      int contactId1 = await dbHelper.insertContact(Contact('avatar1.jpg', 'Alice'));
      int contactId2 = await dbHelper.insertContact(Contact('avatar2.jpg', 'Bob'));

      // 插入消息
      int messageId1 = await dbHelper.insertMessage(MessageItem('Alice', 'Hello Alice', '2023-10-01 10:00:00'));
      int messageId2 = await dbHelper.insertMessage(MessageItem('Bob', 'Hello Bob', '2023-10-01 11:00:00'));

      // 获取最后的消息
      List<LastMessage> lastMessages = await dbHelper.getLastMessages();
      expect(lastMessages.length, 2);
      expect(lastMessages[0].name, 'Alice');
      expect(lastMessages[0].lastMessage, 'Hello Alice');
      expect(lastMessages[1].name, 'Bob');
      expect(lastMessages[1].lastMessage, 'Hello Bob');
    });

    test('Update Last Message', () async {
      // 插入联系人
      int contactId1 = await dbHelper.insertContact(Contact('avatar1.jpg', 'Alice'));

      // 插入消息
      int messageId1 = await dbHelper.insertMessage(MessageItem('Alice', 'Hello Alice', '2023-10-01 10:00:00'));
      int messageId2 = await dbHelper.insertMessage(MessageItem('Alice', 'Hi Alice', '2023-10-01 11:00:00'));

      // 获取最后的消息
      List<LastMessage> lastMessages = await dbHelper.getLastMessages();
      expect(lastMessages.length, 1);
      expect(lastMessages[0].name, 'Alice');
      expect(lastMessages[0].lastMessage, 'Hi Alice');
    });

    test('Get Contact ID by Name', () async {
      // 插入联系人
      int contactId1 = await dbHelper.insertContact(Contact('avatar1.jpg', 'Alice'));

      // 获取联系人ID
      int? contactId = await dbHelper.getContactIdByName('Alice');
      expect(contactId, contactId1);
    });
  });
}
