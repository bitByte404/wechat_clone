import 'package:flutter/material.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/ui/custom_widget/custom_appbar.dart';
import 'package:wechat_clone/value/colors.dart';

import '../custom_widget/list_contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: '通讯录'),
      body: ListView(
        children: [
          ContactList(
            items: [
              ContactItem('新的朋友', Assets.images.iconFindNewfriend.path),
              ContactItem('群聊', Assets.images.iconGroupchat.path),
              ContactItem('服务号', Assets.images.iconServiceAccount.path),
            ],
          ),
          ContactList(
            groupName: '我的企业及企业联系人',
            items: [
              ContactItem('企业微信联系人', Assets.images.iconContactEcontact.path),
              ContactItem('企业微信通知', Assets.images.iconAcountEnotification.path),
            ],
          ),
          ContactList(
            groupName: 'A',
            items: [
              ContactItem('阿伟', Assets.images.avatar.path),
            ],
          ),
          ContactList(
            groupName: 'C',
            items: [
              ContactItem('陈老师 ', Assets.images.avatar2.path),
            ],
          ),
          ContactList(
            groupName: 'D',
            items: [
              ContactItem('大橙子', Assets.images.avatar1.path),
            ],
          ),
ContactList(
            groupName: 'X',
            items: [
              ContactItem('小明', Assets.images.avatar3.path),
            ],
          ),
        ],
      ),
    );
  }
}


