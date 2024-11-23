import 'package:shared_preferences/shared_preferences.dart';

class LoginUtils {
  LoginUtils._internal();
  final String _spkey = 'isLogined';

  static final LoginUtils _instance = LoginUtils._internal();

  factory LoginUtils() {
    return _instance;
  }

  Future<bool> checkIsLogined() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_spkey) ?? false;
  }

  updateIsLogined(bool isLogined) async {
    final prefs = await  SharedPreferences.getInstance();
    prefs.setBool(_spkey, isLogined);
  }
}