import 'package:flutter/material.dart';
import 'package:wechat_clone/mock/init_test_data.dart';
import 'package:wechat_clone/ui/pages/page_first.dart';
import 'package:wechat_clone/ui/pages/page_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initDbDatas();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试界面',
      home: MyHomePage(),
    );
  }
}


