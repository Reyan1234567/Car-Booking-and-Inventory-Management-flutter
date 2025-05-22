import 'package:flutterpolo/Domain/entities/login.dart';

class LoginModel extends LoginRequest{
  LoginModel(super.username, super.password);
  Map<String, dynamic> toJson(){
    return{
      'username':username,
      'password':password
    };
  }
}

class LoginResponseModel extends LoginResponse{
  LoginResponseModel(super.accessToken, super.refreshToken, super.user);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(json['accessToken'], json['refreshToken'], UserModel.fromJson(json['user']));
  }
}

class UserModel extends User{
  UserModel(super.id, super.username, super.email, super.phoneNumber, super.profilePhoto, super.licensePhoto, super.lastname, super.firstname, super.role);

  factory UserModel.fromJson(Map<String, dynamic>json){
    return UserModel(json['id'],json ['username'], json['email'], json['phoneNumber'], json['profilePhoto'], json['licensePhoto'], json['lastname'], json['firstname'], json['role']);
  }
}