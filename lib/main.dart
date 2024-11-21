import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat_clone/ui/pages/page_contact.dart';
import 'package:wechat_clone/ui/pages/page_find.dart';
import 'package:wechat_clone/ui/pages/page_mine.dart';
import 'package:wechat_clone/value/colors.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/ui/pages/page_wechat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int pageIndex = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      home: MyHomePage(),
    );
  }
}

var pageList = [
  const WechatPage(),
  const ContactPage(),
  const FindPage(),
  const MinePage(),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  int _selectedIndex = 3;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double size = 25;
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.appBarColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pageList[widget._selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory
          ),
          child: BottomNavigationBar(
            elevation: 5,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.bottomNavigationBarColor,
            showUnselectedLabels: true,
              selectedItemColor: AppColors.primaryColor,
              currentIndex: widget._selectedIndex,
              unselectedItemColor: AppColors.unSelectedTextColor,
              onTap: (index) {
              setState(() {
                widget._selectedIndex = index;
              });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.images.tabbarMainframe3x.path,
                      height: size,
                    ),
                    activeIcon: Image.asset(
                      Assets.images.tabbarMainframeHL3x.path,
                      height: size,
                    ),
                    label: '微信'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.images.tabbarContacts3x.path,
                      height: size,
                    ),
                    activeIcon: Image.asset(
                      Assets.images.tabbarContactsHL3x.path,
                      height: size,
                    ),
                    label: '联系人'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.images.tabbarDiscover3x.path,
                      height: size,
                    ),
                    activeIcon: Image.asset(
                      Assets.images.tabbarDiscoverHL3x.path,
                      height: size,
                    ),
                    label: '发现'),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.images.tabbarMe3x.path,
                      height: size,
                    ),
                    activeIcon: Image.asset(
                      Assets.images.tabbarMeHL3x.path,
                      height: size,
                    ),
                    label: '我'),
              ]),
        ),
      ),
    );
  }
}
