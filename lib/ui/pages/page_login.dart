import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/custom_widget/custom_bottom.dart';
import 'package:wechat_clone/ui/pages/page_home.dart';
import 'package:wechat_clone/utls/utils_login.dart';
import 'package:wechat_clone/value/colors.dart';

import '../custom_widget/custom_textFiled.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController contryEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: const Icon(
                    Icons.close,
                    size: 35,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      // direction: Axis.vertical,
                      children: [
                        const Text(
                          '手机号登录',
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          label: '国家/地区',
                          hint: '中国大陆 (+86)',
                          controller: contryEditController,
                          keyboardType: TextInputType.number,
                        ),
                        CustomTextField(
                          label: '手机号',
                          hint: '请填写手机号',
                          controller: phoneEditController,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            '用微信号/QQ号/邮箱登录',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.alertTextLightBlue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 350,
                    ),
                    Column(
                      children: [
                        const Text(
                          '上述手机号仅用于登录验证',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.alertTextLightGrey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          lable: '同意并继续',
                          colorType: ButtonColorType.green,
                          onTap: () {
                            var phone = phoneEditController.text;
                            var contry = contryEditController.text;
                            if (phone.isNotEmpty && contry.isNotEmpty) {
                              LoginUtils().updateIsLogined(true);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '找回密码',
                              style: TextStyle(
                                  color: AppColors.alertTextLightBlue,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: AppColors.alertTextLightGrey,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              '更多选项',
                              style: TextStyle(
                                  color: AppColors.alertTextLightBlue,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
