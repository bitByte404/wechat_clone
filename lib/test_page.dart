import 'package:flutter/material.dart';
import 'package:wechat_clone/ui/pages/page_first.dart';
import 'package:wechat_clone/ui/pages/page_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试界面',
      home: MyHomePage(),
    );
  }
}


