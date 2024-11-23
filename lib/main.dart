import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/pages/page_first.dart';
import 'package:wechat_clone/ui/pages/page_home.dart';
import 'package:wechat_clone/ui/pages/page_launch.dart';
import 'package:wechat_clone/utls/utils_login.dart';

import 'mock/init_test_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int pageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    LoginUtils().checkHasInitDatas().then((isInited) {
      if (isInited != true) initDbDatas();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '微信',
      initialRoute: '/launch',
      routes: {
        '/home': (context) => MyHomePage(),
        '/first': (context) => const FirstPage(),
        '/launch': (context) => const LaunchPage()
      },
    );
  }
}
