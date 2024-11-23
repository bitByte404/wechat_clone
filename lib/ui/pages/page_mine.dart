import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/custom_widget/list_find.dart';

import '../../gen/assets.gen.dart';
import '../../value/colors.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          const MessageCard(
            userName: '阿伟',
            userAccount: 'wuliner',
          ),
          FindList(
            items: [
              FindItem('服务', Assets.images.iconMinePay.path),
            ],
          ),
          FindList(
            items: [
              FindItem('收藏', Assets.images.iconMineCollect.path),
              FindItem('表情', Assets.images.iconMineEmoji.path),
            ],
          ),
          FindList(
            items: [
              FindItem('设置', Assets.images.iconMineSetting.path),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key, required this.userName, required this.userAccount});

  final String userName;
  final String userAccount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 30, left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        Assets.images.avatar.path,
                        width: 60,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        '微信号：${userAccount}',
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.chatListItemMessageTextColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 2, left: 2, bottom: 2, right: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    semanticLabel: '状态',
                                    color: AppColors.iconColor,
                                  ),
                                  Text(
                                    '状态',
                                    style:
                                        TextStyle(color: AppColors.iconColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.refresh_sharp,
                              color: AppColors.iconColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.images.iconMineQrcode.path,
                      width: 30,
                      color: AppColors.iconColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      Assets.images.iconArrow.path,
                      width: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
