import 'dart:convert';
import '../gen/assets.gen.dart';
import 'package:wechat_clone/models/chat_item_data_entity.dart';

class MockData {
  static List<Map<String, dynamic>> chatDatas = [
    {
      "avatarPath": Assets.images.avatar1.path,
      "name": "大橙子",
      "lastMessage": "等会吃什么",
      "timestamp": "2024-11-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar2.path,
      "name": "阿伟",
      "lastMessage": "嗯嗯嗯好的",
      "timestamp": "2024-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar3.path,
      "name": "陈老师",
      "lastMessage": "周末来我办公室一趟",
      "timestamp": "2024-09-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar4.path,
      "name": "鸽鸽",
      "lastMessage": "唱跳、rap、打篮球",
      "timestamp": "2023-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar5.path,
      "name": "中介",
      "lastMessage": "我在看看吧",
      "timestamp": "2023-10-10T10:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar6.path,
      "name": "小明",
      "lastMessage": "今天天气真好",
      "timestamp": "2023-10-10T11:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar1.path,
      "name": "小红",
      "lastMessage": "晚上一起吃饭吧",
      "timestamp": "2023-10-10T12:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar2.path,
      "name": "老王",
      "lastMessage": "项目进度怎么样了",
      "timestamp": "2023-10-10T13:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar3.path,
      "name": "小刚",
      "lastMessage": "明天见",
      "timestamp": "2023-10-10T14:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar4.path,
      "name": "小丽",
      "lastMessage": "周末去爬山吗",
      "timestamp": "2023-10-10T15:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar5.path,
      "name": "小强",
      "lastMessage": "最近怎么样",
      "timestamp": "2023-10-10T16:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar6.path,
      "name": "小华",
      "lastMessage": "有空一起打球",
      "timestamp": "2023-10-10T17:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar1.path,
      "name": "小芳",
      "lastMessage": "新项目启动了",
      "timestamp": "2023-10-10T18:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar2.path,
      "name": "小杰",
      "lastMessage": "最近工作挺忙的",
      "timestamp": "2023-10-10T19:00:00Z"
    },
    {
      "avatarPath": Assets.images.avatar3.path,
      "name": "小美",
      "lastMessage": "周末一起看电影",
      "timestamp": "2023-10-10T20:00:00Z"
    }
  ];

  static List<ChatItemDataEntity> getChatItemDataEntities() {
    return chatDatas.map((data) => ChatItemDataEntity.fromJson(data)).toList();
  }
}