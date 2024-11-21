import 'package:flutter/material.dart';
import 'package:wechat_clone/mock/mock_data.dart';
import 'package:wechat_clone/ui/pages/page_chat.dart';
import 'package:wechat_clone/utls/utils_time.dart';

import '../../value/colors.dart';
import '../../value/sizes.dart';
import '../custom_widget/custom_appbar.dart';

class WechatPage extends StatelessWidget {
  const WechatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: '微信',),
      body: ChatList(),
    );
  }
}



var lists = MockData.getChatItemDataEntities();

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.chatListItemBackground,
      child: ListView.separated(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          var itemData = lists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage(title: itemData.name, avatarPath: itemData.avatarPath,) ));
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
