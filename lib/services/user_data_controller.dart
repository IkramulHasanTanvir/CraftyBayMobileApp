import 'package:shared_preferences/shared_preferences.dart';

class UserDataController {
  final String tokenKey = 'token-key';

  static String? accessToken;

  Future<void> saveUserData(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(tokenKey, token);
    accessToken = token;
  }

  Future<String?> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return accessToken = preferences.getString(tokenKey);
  }

  Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(tokenKey);
    accessToken = null;
  }
}
