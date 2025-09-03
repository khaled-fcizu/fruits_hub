import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefranceSigleton {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool({required String key, required bool value}) {
    _instance.setBool(key, value);
  }

  static getBool({required String key}) {
    return _instance.getBool(key) ?? false;
  }
}
