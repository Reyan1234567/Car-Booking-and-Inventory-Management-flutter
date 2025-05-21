import 'package:flutterpolo/Domain/entities/login.dart';

class LoginModel extends LoginRequest{
  LoginModel(String username, String password):super(username:username, password:password);
  Map<String, dynamic> toJson(){
    return{
      'username':username,
      'password':password
    };
  }
}