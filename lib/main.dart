import 'package:flutter/material.dart';
import 'package:wechat_clone/test_page.dart';
import 'package:wechat_clone/ui/pages/page_first.dart';
import 'package:wechat_clone/ui/pages/page_home.dart';
import 'package:wechat_clone/ui/pages/page_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      // home: MyHomePage(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/first': (context) => FirstPage(),
      },
    );
  }
}


