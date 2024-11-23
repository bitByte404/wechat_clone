class Contact {
  String avatar; // 联系人头像
  String name; // 联系人名

  Contact(this.avatar, this.name);

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'name': name,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      map['avatar'] as String,
      map['name'] as String,
    );
  }
}

class MessageItem {
  String from; // 发送人的名字
  String content; // 具体消息内容
  String time; // 发送时的时间戳

  MessageItem(this.from, this.content, this.time);

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'content': content,
      'time': time,
    };
  }

  factory MessageItem.fromMap(Map<String, dynamic> map) {
    return MessageItem(
      map['from'] as String,
      map['content'] as String,
      map['time'] as String,
    );
  }
}

class LastMessage {
  String name; // 联系人名
  String avatar; // 联系人头像
  String lastMessage; // 最后发送的一条消息

  LastMessage(this.avatar, this.lastMessage, this.name);

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'lastMessage': lastMessage,
      'name': name,
    };
  }

  factory LastMessage.fromMap(Map<String, dynamic> map) {
    return LastMessage(
      map['avatar'] as String,
      map['lastMessage'] as String,
      map['name'] as String
    );
  }
}
