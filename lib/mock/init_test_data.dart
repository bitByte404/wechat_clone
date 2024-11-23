import 'package:wechat_clone/db/database_helper.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/models/models.dart';

void main() async {
  var helper = DatabaseHelper();
  var db = await helper.database;

  // 插入联系人数据
  await helper.insertContact(Contact(Assets.images.avatar.path, 'Alice'));
  await helper.insertContact(Contact(Assets.images.avatar1.path, 'Bob'));
  await helper.insertContact(Contact(Assets.images.avatar2.path, 'Charlie'));
  await helper.insertContact(Contact(Assets.images.avatar3.path, 'David'));
  await helper.insertContact(Contact(Assets.images.avatar4.path, 'Eve'));

  // 插入消息数据
  await helper.insertMessage(MessageItem('Alice', 'Hello Bob!', '2023-10-01 10:00:00'));
  await helper.insertMessage(MessageItem('Bob', 'Hi Alice!', '2023-10-01 10:01:00'));
  await helper.insertMessage(MessageItem('Charlie', 'Good morning everyone!', '2023-10-01 10:02:00'));
  await helper.insertMessage(MessageItem('David', 'Hey Charlie!', '2023-10-01 10:03:00'));
  await helper.insertMessage(MessageItem('Eve', 'Hello David!', '2023-10-01 10:04:00'));

  print('Test data inserted successfully');
}