import 'package:wechat_clone/generated/json/base/json_convert_content.dart';
import 'package:wechat_clone/models/chat_item_data_entity.dart';

ChatItemDataEntity $ChatItemDataEntityFromJson(Map<String, dynamic> json) {
  final ChatItemDataEntity chatItemDataEntity = ChatItemDataEntity();
  final String? avatarPath = jsonConvert.convert<String>(json['avatarPath']);
  if (avatarPath != null) {
    chatItemDataEntity.avatarPath = avatarPath;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    chatItemDataEntity.name = name;
  }
  final String? lastMessage = jsonConvert.convert<String>(json['lastMessage']);
  if (lastMessage != null) {
    chatItemDataEntity.lastMessage = lastMessage;
  }
  final String? timestamp = jsonConvert.convert<String>(json['timestamp']);
  if (timestamp != null) {
    chatItemDataEntity.timestamp = timestamp;
  }
  return chatItemDataEntity;
}

Map<String, dynamic> $ChatItemDataEntityToJson(ChatItemDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['avatarPath'] = entity.avatarPath;
  data['name'] = entity.name;
  data['lastMessage'] = entity.lastMessage;
  data['timestamp'] = entity.timestamp;
  return data;
}

extension ChatItemDataEntityExtension on ChatItemDataEntity {
  ChatItemDataEntity copyWith({
    String? avatarPath,
    String? name,
    String? lastMessage,
    String? timestamp,
  }) {
    return ChatItemDataEntity()
      ..avatarPath = avatarPath ?? this.avatarPath
      ..name = name ?? this.name
      ..lastMessage = lastMessage ?? this.lastMessage
      ..timestamp = timestamp ?? this.timestamp;
  }
}