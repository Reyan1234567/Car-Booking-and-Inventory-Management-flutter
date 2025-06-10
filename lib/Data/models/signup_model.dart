import '../../Domain/entities/Signup.dart';

class SignupResponseModel extends SignupResponse{
  SignupResponseModel(super.firstName, super.lastName, super.birthDate, super.email, super.phoneNumber, super.password, super.username, super.role, super.id, super.history);

  factory SignupResponseModel.fromJson(Map <String, dynamic> json){
    return SignupResponseModel(json['firstName'], json['lastName'], json['birthDate'], json['email'], json['phoneNumber'], json['password'], json['username'], json['role'], json['_id'], json['history']);
  }
}

class SignupRequestModel extends SignupRequest{
  SignupRequestModel(super.username, super.password, super.phoneNumber, super.email, super.birthDate, super.lastName, super.firstName);
  Map<String, dynamic> toJson(){
    return {
      "username":username,
      "password":password,
      "phoneNumber":phoneNumber,
      "email":email,
      "birthDate":birthDate,
      "lastName":lastName,
      "firstName":firstName,

    };
  }
}
