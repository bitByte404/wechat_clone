import 'package:flutter/material.dart';
import 'package:wechat_clone/db/database_helper.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/models/models.dart';
import 'package:wechat_clone/value/colors.dart';
import 'package:wechat_clone/value/sizes.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title, required this.avatarPath});

  final String title;
  final String avatarPath;

  @override
  State<ChatPage> createState() => _ChatPageState();
}


class _ChatPageState extends State<ChatPage> {
  List<MessageItem> messages = [];

  @override
  void initState() {
    _fetchMessages(widget.title);
  }

  Future<void> _fetchMessages(String groupName) async {
    var helper = DatabaseHelper();
    var items = await helper.getMessagesByGroupName(groupName);
    setState(() {
      messages = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.hearing,
              size: AppSizes.iconSize - 6,
              color: AppColors.iconColor,
            )
          ],
        )),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 10, 4),
            child: Icon(
              Icons.more_horiz_rounded,
              size: AppSizes.iconSize + 5,
            ),
          )
        ],
        backgroundColor: AppColors.appBarColor,
      ),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            print('发信人：${messages[index].from}');
            return MessageBuble(
              content: messages[index].content,
              isSelf: messages[index].from == '阿伟',
              otherAvatar: widget.avatarPath,
            );
          }),
      bottomSheet: CustomBottomSheet(
        groupName: widget.title,
      ),
    );
  }
}

class MessageBuble extends StatelessWidget {
  const MessageBuble(
      {super.key,
      this.isSelf = true,
      this.otherAvatar = 'assets/images/avatar2.jpg',
      required this.content});

  final bool isSelf;
  final String otherAvatar;
  final String content;

  @override
  Widget build(BuildContext context) {
    return !isSelf
        ? Container(
            margin:
                const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Container(
                      // margin: EdgeInsets.only(right: 60),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3))
                          // borderRadius: BorderRadius.only(topRight: Radius.circular(3), bottomRight: Radius.circular(3))
                          ),
                      padding: const EdgeInsets.all(13),
                      // color: Colors.white,
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 16),
                        // textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.selfBubleColor,
                          borderRadius: BorderRadius.all(Radius.circular(3))
                          // borderRadius: BorderRadius.only(topRight: Radius.circular(3), bottomRight: Radius.circular(3))
                          ),
                      padding: EdgeInsets.all(13),
                      // color: Colors.white,
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 16),
                        // textAlign: TextAlign.right,
                      ),
                    ),
                  ),
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

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key, required this.groupName});

  final String groupName;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController controller = TextEditingController();
  bool hasText = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        hasText = controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // 阴影颜色
            spreadRadius: 2, // 阴影扩展半径
            blurRadius: 5, // 阴影模糊半径
            offset: const Offset(0, 3), // 阴影偏移量
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Assets.images.iconChatVoice.path,
            height: AppSizes.chatIconSize,
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              // color: Colors.white,
              child: TextField(
                cursorColor: AppColors.primaryColor,
                controller: controller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4, top: 4, bottom: 4),
            child: Icon(
              Icons.emoji_emotions_outlined,
              size: AppSizes.chatIconSize,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: !hasText
                ? const Icon(
                    Icons.add_circle_outline_rounded,
                    size: AppSizes.chatIconSize,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        DatabaseHelper().insertMessage(MessageItem(
                            '阿伟',
                            controller.text,
                            "${DateTime.now().millisecondsSinceEpoch}",
                            widget.groupName));
                        controller.clear();
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      height: 35,
                      width: 55,
                      child: const Center(
                          child: Text(
                        '发送',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
