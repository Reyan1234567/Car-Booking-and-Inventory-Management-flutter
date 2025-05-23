import 'package:shared_preferences/shared_preferences.dart';

class Store {
  const Store._();
  //named constructor, private indicated by "_", singleton

  static const String _tokenKey="Token";

  static Future<void> setToken(String token)async{
    final preferences=await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async{
    final preferences=await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }

  static Future<void> clear() async{
    final preferences=await SharedPreferences.getInstance();
    await preferences.clear();
  }
}