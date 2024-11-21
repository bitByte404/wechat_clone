import 'package:flutter/material.dart';
import 'package:wechat_clone/colors.dart';
import 'package:wechat_clone/mock/mock_data.dart';
import 'package:wechat_clone/sizes.dart';

class WechatPage extends StatelessWidget {
  const WechatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Center(
          child: Text(
            '微信',
            style: TextStyle(fontSize: AppSizes.appBarTextSize),
          ),
        ),
      ),
      body: ChatList(),
    );
  }
}

var lists = MockData.getChatItemDataEntities();

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          var itemData = lists[index];
          return ListTile(
            leading: Image.asset(itemData.avatarPath, height: AppSizes.chatItemAvatarSize,),
            title: Text(itemData.name),
            subtitle: Text(itemData.lastMessage),
            trailing: Text(itemData.timestamp),
          );
        });
  }
}


