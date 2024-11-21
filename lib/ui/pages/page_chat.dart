import 'package:flutter/material.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/value/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.title, required this.avatarPath});

  final String title;
  final String avatarPath;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Column(
        children: [
          MessageBuble(otherAvatar: avatarPath,),
          MessageBuble(isSelf: false, otherAvatar: avatarPath,),
          MessageBuble(otherAvatar: avatarPath,),
          MessageBuble(isSelf: false, otherAvatar: avatarPath,),
          MessageBuble(otherAvatar: avatarPath,),
        ],
      ),
    );
  }
}

class MessageBuble extends StatelessWidget {
  const MessageBuble({super.key, this.isSelf = true, this.otherAvatar= 'assets/images/avatar2.jpg'});
  final bool isSelf;
  final String otherAvatar;

  @override
  Widget build(BuildContext context) {
    return !isSelf ? Container(
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                key: UniqueKey(),
                otherAvatar,
                height: 50,
              )),
          const SizedBox(
            width: 10,
          ),
         // CustomPaint(
         //   painter: TrianglePainter(Colors.white, cornerRadius:  3),
         // ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(3))
              // borderRadius: BorderRadius.only(topRight: Radius.circular(3), bottomRight: Radius.circular(3))
            ),
            padding: const EdgeInsets.all(13),
            // color: Colors.white,
            child: const Text('科目一过了', style: TextStyle(
              fontSize: 16
            ),),
          )
        ],
      ),
    ) : Container(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.selfBubleColor,
              borderRadius: BorderRadius.all(Radius.circular(3))
              // borderRadius: BorderRadius.only(topRight: Radius.circular(3), bottomRight: Radius.circular(3))
            ),
            padding: EdgeInsets.all(13),
            // color: Colors.white,
            child: const Text('科目一过了', style: TextStyle(
              fontSize: 16
            ),),
          ),
          const SizedBox(
            width: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                Assets.images.avatar.path,
                height: 50,
              )),
        ],
      ),
    );
  }
}
