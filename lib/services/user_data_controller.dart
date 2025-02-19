import 'package:shared_preferences/shared_preferences.dart';

class UserDataController {
  final String _tokenKey = 'token-key';
  String? _tokenData;

  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    _tokenData = token;
  }

  Future<void> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(_tokenKey);
  }

  Future<bool?> isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    if (token != null) {
      await getToken();
      return true;
    }
    return false;
  }

  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
