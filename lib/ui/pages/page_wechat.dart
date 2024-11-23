import 'package:flutter/material.dart';
import 'package:wechat_clone/db/database_helper.dart';
import 'package:wechat_clone/mock/mock_data.dart';
import 'package:wechat_clone/models/chat_item_data_entity.dart';
import 'package:wechat_clone/ui/pages/page_chat.dart';
import 'package:wechat_clone/utls/utils_time.dart';

import '../../value/colors.dart';
import '../../value/sizes.dart';
import '../custom_widget/custom_appbar.dart';

class WechatPage extends StatefulWidget {
  const WechatPage({super.key});

  @override
  State<WechatPage> createState() => _WechatPageState();
}

class _WechatPageState extends State<WechatPage> {
  List<ChatItemDataEntity> chatItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '微信',
      ),
      body: ChatList(chatItems: chatItems),
    );
  }

  Future<void> _fetchLastMessages() async {
    var helper = DatabaseHelper();
    var items = await helper.getLastMessages();
    setState(() {
      chatItems = items;
    });
  }

  @override
  void initState() {
    _fetchLastMessages();
  }
}

class ChatList extends StatefulWidget {
  ChatList({super.key, required this.chatItems});

  List<ChatItemDataEntity> chatItems;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.chatListItemBackground,
      child: ListView.separated(
        itemCount: widget.chatItems.length,
        itemBuilder: (context, index) {
          var itemData = widget.chatItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage(
                            title: itemData.name,
                            avatarPath: itemData.avatarPath,
                          )));
            },
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  itemData.avatarPath,
                  height: AppSizes.chatItemAvatarSize,
                ),
              ),
              title: Text(
                itemData.name,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                itemData.lastMessage,
                style: const TextStyle(fontSize: 13),
              ),
              trailing: Text(
                TimeUtils.formatTimestamp(itemData.timestamp),
                style: const TextStyle(
                    color: AppColors.chatListItemMessageTextColor),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 82),
            child: Divider(
              thickness: 1,
              color: Colors.grey[100],
            ),
          );
        },
      ),
    );
  }
}
