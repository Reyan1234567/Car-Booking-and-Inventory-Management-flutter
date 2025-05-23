import '../../Domain/entities/Signup.dart';

class SignupResponseModel extends SignupResponse{
  SignupResponseModel(super.firstName, super.lastName, super.birthDate, super.email, super.phoneNumber, super.password, super.username, super.role, super.id, super.history, super.licensePhotoId, super.profilePhotoId);

  factory SignupResponseModel.fromJson(Map <String, dynamic> json){
    return SignupResponseModel(json['firstName'], json['lastName'], json['birthDate'], json['email'], json['phoneNumber'], json['password'], json['username'], json['role'], json['id'], json['history'], json['licensePhotoId'], json['profilePhotoId']);
  }
}
