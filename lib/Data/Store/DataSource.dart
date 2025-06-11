import 'package:shared_preferences/shared_preferences.dart';

class Store {
  const Store._();
  //named constructor, private indicated by "_", singleton

  static const String _username="username_key";
  static const String _email="email_key";
  static const String _phoneNumber="phoneNumber_key";
  static const String _lastName="lastName_key";
  static const String _firstName="firstName_key";
  static const String _role="role_key";
  static const String _accessToken="accessToken_key";
  static const String _refreshToken="refreshToken_key";


  // static Future<void> setToken(String token)async{
  //   final preferences=await SharedPreferences.getInstance();
  //   await preferences.setString(_tokenKey, token);
  // }
  //
  // static Future<String?> getToken() async{
  //   final preferences=await SharedPreferences.getInstance();
  //   return preferences.getString(_tokenKey);
  // }

  static Future<void> clear() async{
    final preferences=await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<void> setUserInfo(String accessToken, String refreshToken, String username, String email, String phoneNumber, String lastName, String firstName, String role) async{
    final preferences=await SharedPreferences.getInstance();
    await preferences.setString(_username, username);
    await preferences.setString(_email, email);
    await preferences.setString(_phoneNumber, phoneNumber);
    await preferences.setString(_lastName, lastName);
    await preferences.setString(_firstName, firstName);
    await preferences.setString(_role, role);
    await preferences.setString(_accessToken, accessToken);
    await preferences.setString(_refreshToken, refreshToken);
  }
  static Future<void> setAccessToken(String accessToken) async{
    final preferences=await SharedPreferences.getInstance();
    preferences.setString(_accessToken, accessToken);
  }

  static Future<void> setRefreshToken(String refresh) async{
    final preferences=await SharedPreferences.getInstance();
    preferences.setString(_refreshToken, refresh);
  }

  static Future<String> getUsername() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_username) ?? "";
  }

  static Future<String> getEmail() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_email) ?? "";
  }

  static Future<String> getPhone() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_phoneNumber) ?? "";
  }

  static Future<String> getLastname() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_lastName) ?? "";
  }

  static Future<String> getFirstname() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_firstName) ?? "";
  }

  static Future<String> getRole() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_role) ?? "";
  }

  static Future<String> getAccessToken() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_accessToken) ?? "";
  }

  static Future<String> getRefreshToken() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_refreshToken) ?? "";
  }

}