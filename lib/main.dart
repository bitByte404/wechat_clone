import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/pages/page_first.dart';
import 'package:wechat_clone/ui/pages/page_home.dart';
import 'package:wechat_clone/ui/pages/page_launch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
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


