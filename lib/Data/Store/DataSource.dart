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

  static Future<void> setUserInfo(String username, String email, String phoneNumber, String lastName, String firstName, String role) async{
    final preferences=await SharedPreferences.getInstance();
    (){
      preferences.setString(_username, username);
      preferences.setString(_email, email);
      preferences.setString(_phoneNumber, phoneNumber);
      preferences.setString(_lastName, lastName);
      preferences.setString(_firstName, firstName);
      preferences.setString(_role, role);
    };
  }

  static Future<Map<String, String>> getUseruser() async{
    final preference=await SharedPreferences.getInstance();
    return {
      "username":preference.getString(_username).toString(),
      "email":preference.getString(_email).toString(),
      "phoneNumber":preference.getString(_phoneNumber).toString(),
      "lastName":preference.getString(_lastName).toString(),
      "firstName":preference.getString(_firstName).toString(),
      "role":preference.getString(_role).toString(),
    };
  }

}