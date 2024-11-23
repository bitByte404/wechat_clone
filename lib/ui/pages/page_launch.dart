import 'package:flutter/material.dart';
import 'package:wechat_clone/gen/assets.gen.dart';
import 'package:wechat_clone/utls/utils_login.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        LoginUtils().checkIsLogined().then((isLogined) {
          if (isLogined) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else {
            Navigator.of(context).pushReplacementNamed('/first');
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          color: Colors.white,
            image: DecorationImage(
                image: AssetImage(Assets.images.background.path),
                fit: BoxFit.fitHeight),
          ),
        child: Center(
            child: Image.asset(
              fit: BoxFit.cover,
              Assets.images.iconApp.path,
              height: 250,
            ),
          ),
      ),
    );
  }
}
