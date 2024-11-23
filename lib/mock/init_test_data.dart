import 'package:wechat_clone/db/database_helper.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/models/models.dart';

void initDbDatas() async {
  var helper = DatabaseHelper();
  var db = await helper.database;

  // 插入联系人数据
  await helper.insertContact(Contact(Assets.images.avatar1.path, '大橙子'));
  await helper.insertContact(Contact(Assets.images.avatar2.path, '阿伟'));
  await helper.insertContact(Contact(Assets.images.avatar3.path, '陈老师'));
  await helper.insertContact(Contact(Assets.images.avatar4.path, '鸽鸽'));
  await helper.insertContact(Contact(Assets.images.avatar5.path, '中介'));
  await helper.insertContact(Contact(Assets.images.avatar6.path, '小明'));
  await helper.insertContact(Contact(Assets.images.avatar1.path, '小红'));
  await helper.insertContact(Contact(Assets.images.avatar2.path, '老王'));
  await helper.insertContact(Contact(Assets.images.avatar3.path, '小刚'));
  await helper.insertContact(Contact(Assets.images.avatar4.path, '小丽'));
  await helper.insertContact(Contact(Assets.images.avatar5.path, '小强'));
  await helper.insertContact(Contact(Assets.images.avatar6.path, '小华'));
  await helper.insertContact(Contact(Assets.images.avatar1.path, '小芳'));
  await helper.insertContact(Contact(Assets.images.avatar2.path, '小杰'));
  await helper.insertContact(Contact(Assets.images.avatar3.path, '小美'));

  // 插入消息数据
  List<MessageItem> messages = [
    // 与大橙子的聊天记录
  MessageItem('阿伟', '早上好，大橙子！昨晚睡得好吗？', '2024-11-10 09:50:00', '大橙子'),
  MessageItem('大橙子', '还行吧，就是有点冷。你呢？', '2024-11-10 09:52:00', '大橙子'),
  MessageItem('阿伟', '还不错，早上刚喝了杯热咖啡，暖和了些。', '2024-11-10 09:54:00', '大橙子'),
  MessageItem('大橙子', '哈哈，那我们等会去吃火锅，继续暖身？', '2024-11-10 09:56:00', '大橙子'),
  MessageItem('阿伟', '火锅！可以！这天气确实适合。', '2024-11-10 09:57:00', '大橙子'),
  MessageItem('大橙子', '行，那你负责找店，我负责吃！', '2024-11-10 09:58:00', '大橙子'),
  MessageItem('阿伟', '哈哈，那就这么愉快地决定了。', '2024-11-10 09:59:00', '大橙子'),
  MessageItem('大橙子', 'OK，中午见！', '2024-11-10 10:00:00', '大橙子'),
  MessageItem('阿伟', '中午见，不见不散！', '2024-11-10 10:01:00', '大橙子'),

  // 与陈老师的聊天记录
  MessageItem('阿伟', '陈老师，早上好！昨天发给您的文档看了吗？', '2024-09-10 08:30:00', '陈老师'),
  MessageItem('陈老师', '早上好，看了，整理得不错！不过有几点小建议。', '2024-09-10 08:32:00', '陈老师'),
  MessageItem('阿伟', '好的，您说，我马上调整。', '2024-09-10 08:33:00', '陈老师'),
  MessageItem('陈老师', '我们中午开个小会，我详细讲讲吧。', '2024-09-10 08:35:00', '陈老师'),
  MessageItem('阿伟', '好的，那我顺便准备点相关资料。', '2024-09-10 08:36:00', '陈老师'),
  MessageItem('陈老师', '嗯，效率很高，赞一个！', '2024-09-10 08:37:00', '陈老师'),
  MessageItem('阿伟', '哈哈，谢谢老师夸奖！那中午见。', '2024-09-10 08:38:00', '陈老师'),
  MessageItem('陈老师', '中午见，别忘了带午饭。', '2024-09-10 08:39:00', '陈老师'),

  // 与鸽鸽的聊天记录
  MessageItem('阿伟', '鸽鸽！最近怎么样？还忙着练“唱跳rap篮球”吗？', '2023-10-10 19:00:00', '鸽鸽'),
  MessageItem('鸽鸽', '哈哈哈，当然！不过最近多加了“煲汤”，要不要来尝尝？', '2023-10-10 19:01:00', '鸽鸽'),
  MessageItem('阿伟', '这么多才多艺？那必须来支持下！', '2023-10-10 19:02:00', '鸽鸽'),
  MessageItem('鸽鸽', '那你带饮料，我准备汤！', '2023-10-10 19:03:00', '鸽鸽'),
  MessageItem('阿伟', '没问题，等我采购。', '2023-10-10 19:04:00', '鸽鸽'),
  MessageItem('鸽鸽', 'OK，期待期待~', '2023-10-10 19:05:00', '鸽鸽'),
  MessageItem('阿伟', '不见不散！', '2023-10-10 19:06:00', '鸽鸽'),

  // 与中介的聊天记录
  MessageItem('阿伟', '嗨，中介哥！最近有什么新盘推荐？', '2023-10-10 10:00:00', '中介'),
  MessageItem('中介', '有一个不错的小区，适合你看重交通和绿化的人。', '2023-10-10 10:02:00', '中介'),
  MessageItem('阿伟', '听起来不错，啥时候方便带我去看看？', '2023-10-10 10:04:00', '中介'),
  MessageItem('中介', '明天上午怎么样？', '2023-10-10 10:05:00', '中介'),
  MessageItem('阿伟', '行，那明天见！', '2023-10-10 10:06:00', '中介'),
  MessageItem('中介', '明天见，到时记得提前联系我。', '2023-10-10 10:07:00', '中介'),

    // 与小明的聊天记录
MessageItem('阿伟', '嗨，小明！最近怎么样？', '2023-10-10 11:00:00', '小明'),
MessageItem('小明', '还不错，你呢？', '2023-10-10 11:01:00', '小明'),
MessageItem('阿伟', '我也挺好的，今天天气真不错。', '2023-10-10 11:02:00', '小明'),
MessageItem('小明', '是啊，真适合出去走走。', '2023-10-10 11:03:00', '小明'),
MessageItem('阿伟', '那要不要下午一起出去？', '2023-10-10 11:04:00', '小明'),
MessageItem('小明', '可以啊，正好活动活动。', '2023-10-10 11:05:00', '小明'),
MessageItem('阿伟', '好，那就这么定了。', '2023-10-10 11:06:00', '小明'),
MessageItem('小明', '嗯，下午见！', '2023-10-10 11:07:00', '小明'),

// 与小红的聊天记录
MessageItem('阿伟', '小红，晚上有空吗？', '2023-10-10 12:00:00', '小红'),
MessageItem('小红', '有呀，什么事？', '2023-10-10 12:01:00', '小红'),
MessageItem('阿伟', '一起吃个饭吧，我请客。', '2023-10-10 12:02:00', '小红'),
MessageItem('小红', '好啊，那去哪吃呢？', '2023-10-10 12:03:00', '小红'),
MessageItem('阿伟', '你来决定吧，我随意。', '2023-10-10 12:04:00', '小红'),
MessageItem('小红', '那就吃火锅吧，最近特想吃辣。', '2023-10-10 12:05:00', '小红'),
MessageItem('阿伟', '好主意，晚上见！', '2023-10-10 12:06:00', '小红'),
MessageItem('小红', '嗯嗯，晚上见！', '2023-10-10 12:07:00', '小红'),

// 与老王的聊天记录
MessageItem('阿伟', '老王，最近项目怎么样了？', '2023-10-10 13:00:00', '老王'),
MessageItem('老王', '按计划进行，进展还算顺利。', '2023-10-10 13:01:00', '老王'),
MessageItem('阿伟', '需要我这边帮点忙吗？', '2023-10-10 13:02:00', '老王'),
MessageItem('老王', '暂时不用，谢谢啊。', '2023-10-10 13:03:00', '老王'),
MessageItem('阿伟', '没事，随时找我就行。', '2023-10-10 13:04:00', '老王'),
MessageItem('老王', '行，那我先忙了，有需要联系你。', '2023-10-10 13:05:00', '老王'),

// 与小丽的聊天记录
MessageItem('阿伟', '小丽，这周末有什么安排吗？', '2023-10-10 15:00:00', '小丽'),
MessageItem('小丽', '暂时没有特别的，你有啥计划？', '2023-10-10 15:01:00', '小丽'),
MessageItem('阿伟', '打算去爬山，要不要一起？', '2023-10-10 15:02:00', '小丽'),
MessageItem('小丽', '好啊，最近工作挺忙的，正好放松一下。', '2023-10-10 15:03:00', '小丽'),
MessageItem('阿伟', '那就这么定了，周末见！', '2023-10-10 15:04:00', '小丽'),
MessageItem('小丽', '好的，周末见！', '2023-10-10 15:05:00', '小丽'),

// 与小强的聊天记录
MessageItem('阿伟', '小强，最近怎么样啊？', '2023-10-10 16:00:00', '小强'),
MessageItem('小强', '还可以，你呢？', '2023-10-10 16:01:00', '小强'),
MessageItem('阿伟', '也挺好的，有空一起打球吗？', '2023-10-10 16:02:00', '小强'),
MessageItem('小强', '可以啊，啥时候？', '2023-10-10 16:03:00', '小强'),
MessageItem('阿伟', '就周末吧，下午时间怎么样？', '2023-10-10 16:04:00', '小强'),
MessageItem('小强', '行，就这么定了。', '2023-10-10 16:05:00', '小强'),
MessageItem('阿伟', '好的，到时候见！', '2023-10-10 16:06:00', '小强'),


    // 与小杰的聊天记录
    MessageItem('阿伟', '你好，小杰！', '2023-10-10 19:00:00', '小杰'),
    MessageItem('小杰', '你好，阿伟！', '2023-10-10 19:01:00', '小杰'),
    MessageItem('阿伟', '最近工作挺忙的。', '2023-10-10 19:02:00', '小杰'),
    MessageItem('小杰', '是啊，项目很多。', '2023-10-10 19:03:00', '小杰'),
    MessageItem('阿伟', '注意休息。', '2023-10-10 19:04:00', '小杰'),
    MessageItem('小杰', '谢谢关心。', '2023-10-10 19:05:00', '小杰'),
    MessageItem('阿伟', '有时间一起吃饭吧。', '2023-10-10 19:06:00', '小杰'),
    MessageItem('小杰', '好啊。', '2023-10-10 19:07:00', '小杰'),
    MessageItem('阿伟', '那就这么定了。', '2023-10-10 19:08:00', '小杰'),
    MessageItem('小杰', '好的。', '2023-10-10 19:09:00', '小杰'),

    // 与小美的聊天记录
    MessageItem('阿伟', '你好，小美！', '2023-10-10 20:00:00', '小美'),
    MessageItem('小美', '你好，阿伟！', '2023-10-10 20:01:00', '小美'),
    MessageItem('阿伟', '周末一起看电影。', '2023-10-10 20:02:00', '小美'),
    MessageItem('小美', '好啊，去哪看？', '2023-10-10 20:03:00', '小美'),
    MessageItem('阿伟', '你决定吧。', '2023-10-10 20:04:00', '小美'),
    MessageItem('小美', '那就去市中心的影院吧。', '2023-10-10 20:05:00', '小美'),
    MessageItem('阿伟', '好主意！', '2023-10-10 20:06:00', '小美'),
    MessageItem('小美', '那我们周末见。', '2023-10-10 20:07:00', '小美'),
    MessageItem('阿伟', '好的，周末见。', '2023-10-10 20:08:00', '小美'),
    MessageItem('小美', '再见。', '2023-10-10 20:09:00', '小美'),
  ];

  for (var message in messages) {
    await helper.insertMessage(message);
  }

  print('Test data inserted successfully');
}