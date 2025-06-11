import '../../Domain/entities/User.dart';

class UserModel extends User{
  UserModel({required super.id, required super.username, required super.email, required super.phoneNumber, required super.firstName, required super.lastName, required super.role, super.profilePhoto, super.licensePhoto});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'],
      profilePhoto: json['profilePhoto'] ?? '',
      licensePhoto: json['licensePhoto'] ?? '',
    );
  }
} 