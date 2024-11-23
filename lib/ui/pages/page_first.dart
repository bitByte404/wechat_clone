import 'package:flutter/material.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/ui/pages/page_login.dart';
import 'package:wechat_clone/ui/pages/page_register.dart';
import 'package:wechat_clone/value/colors.dart';

import '../custom_widget/custom_bottom.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.background.path),
                fit: BoxFit.fitHeight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    padding: const EdgeInsets.only(left: 30, bottom: 30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    },
                    lable: '登录',
                    colorType: ButtonColorType.green,
                  ),
                  CustomButton(
                    lable: '注册',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    padding: const EdgeInsets.only(right: 30, bottom: 30),
                    colorType: ButtonColorType.white,
                  )
                ],
              )
            ],
          )),
    );
  }
}
