import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/custom_widget/custom_appbar.dart';
import 'package:wechat_clone/ui/custom_widget/list_find.dart';

import '../../gen/assets.gen.dart';
import '../../value/colors.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: '发现'),
      body: ListView(
        children: [
          FindList(
            items: [
              FindItem('朋友圈', Assets.images.iconFindPyq.path),
            ],
          ),
          FindList(
            items: [
              FindItem('扫一扫', Assets.images.iconFindSaoyisao.path),
              FindItem('搜一搜', Assets.images.iconFindSys.path),
              FindItem('看一看', Assets.images.iconFindKyk.path),
            ],
          ),
          FindList(
            items: [
              FindItem('游戏', Assets.images.iconFindGame.path),
            ],
          ),
          FindList(
            items: [
              FindItem('小程序', Assets.images.iconFindWeapp.path),
            ],
          ),
        ],
      ),
    );
  }
}
