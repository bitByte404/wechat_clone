import 'package:flutter/material.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/value/colors.dart';
import 'package:wechat_clone/utls/utils_time.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      {super.key,
      this.userName = '阿伟',
      this.avaratPath = 'assets/images/avatar.jpg',
        this.time = '2023-10-10T10:00:00Z',
      // this.time = '2023-10-10T10:00:00Z',
      this.message = '嗯嗯嗯好的'});

  final String userName;
  final String avaratPath;
  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.chatListItemBackground,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          Assets.images.avatar.path,
                          height: 55,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 6, bottom: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          message,
                          style: const TextStyle(
                              color: AppColors.chatListItemMessageTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
          
                ],
              ),
              Text(TimeUtils.formatTimestamp(time), style: const TextStyle(fontSize: 13, color: AppColors.chatListItemMessageTextColor),),
            ],
          ),
        ],
      ),
    );
  }
}
