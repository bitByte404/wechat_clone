import 'dart:convert';
import '../gen/assets.gen.dart';
import 'package:wechat_clone/models/chat_item_data_entity.dart';

class MockData {
  static List<Map<String, dynamic>> chatDatas = [
    {
      "avatarPath": Assets.images.avatar1.path,
      "name": "大橙子",
      "lastMessage": "等会吃什么",
      "timestamp": "2023-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar2.path,
      "name": "阿伟",
      "lastMessage": "嗯嗯嗯好的",
      "timestamp": "2023-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar3.path,
      "name": "陈老师",
      "lastMessage": "周末来我办公室一趟",
      "timestamp": "2023-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar3.path,
      "name": "陈老师",
      "lastMessage": "周末来我办公室一趟",
      "timestamp": "2023-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar4.path,
      "name": "中介",
      "lastMessage": "我在看看吧",
      "timestamp": "2023-10-10T10:00:00Z"
    },
  ];

  static List<ChatItemDataEntity> getChatItemDataEntities() {
    return chatDatas.map((data) => ChatItemDataEntity.fromJson(data)).toList();
  }
}