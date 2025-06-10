import 'package:shared_preferences/shared_preferences.dart';

class Store {
  const Store._();
  //named constructor, private indicated by "_", singleton

  static const String _tokenKey="Token";
  static const String _username="";
  static const String _email="";
  static const String _phoneNumber="";
  static const String _lastName="";
  static const String _firstName="";
  static const String _role="";
  static const String _accessToken="";
  static const String _refreshToken="";


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
    (){
      preferences.setString(_username, username);
      preferences.setString(_email, email);
      preferences.setString(_phoneNumber, phoneNumber);
      preferences.setString(_lastName, lastName);
      preferences.setString(_firstName, firstName);
      preferences.setString(_role, role);
      preferences.setString(_accessToken, accessToken);
      preferences.setString(_refreshToken, refreshToken);
    };
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
    return preference.getString(_username).toString();
  }

  static Future<String> getEmail() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_email).toString();
  }

  static Future<String> getPhone() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_phoneNumber).toString();
  }

  static Future<String> getLastname() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_lastName).toString();
  }

  static Future<String> getFirstname() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_firstName).toString();
  }

  static Future<String> getRole() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_role).toString();
  }

  static Future<String> getAccessToken() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_accessToken).toString();
  }

  static Future<String> getRefreshToken() async{
    final preference=await SharedPreferences.getInstance();
    return preference.getString(_refreshToken).toString();
  }

}