import 'package:wechat_clone/generated/json/base/json_field.dart';
import 'package:wechat_clone/generated/json/chat_item_data_entity.g.dart';
import 'dart:convert';
export 'package:wechat_clone/generated/json/chat_item_data_entity.g.dart';

@JsonSerializable()
class ChatItemDataEntity {
	late String avatarPath;
	late String name;
	late String lastMessage;
	late String timestamp;

	ChatItemDataEntity();

	factory ChatItemDataEntity.fromJson(Map<String, dynamic> json) => $ChatItemDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $ChatItemDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}