import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/custom_widget/custom_bottom.dart';
import 'package:wechat_clone/value/colors.dart';

import '../custom_widget/custom_textFiled.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 35,
                  )),
            ),
            const Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        '使用本机手机号码注册',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '+86 172****9323',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 450,
                  ),
                  Column(
                    children: [
                      CustomButton(
                        lable: '确定',
                        width: 180,
                        colorType: ButtonColorType.green,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        lable: '用其他手机号',
                        width: 180,
                        colorType: ButtonColorType.grey,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
