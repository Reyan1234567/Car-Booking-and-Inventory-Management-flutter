import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutterpolo/Data/models/signup_model.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';

class SignupDatasource{
  final DioClient dioClient;

  SignupDatasource(this.dioClient);

  Future<SignupResponse> signup(SignupRequest signupRequest) async{
    try{
      final signuprequest={
        'firstname':signupRequest.firstName,
        'lastname':signupRequest.lastName,
        'birthDate':signupRequest.birthDate,
        'phoneNumber':signupRequest.phoneNumber,
        'email':signupRequest.email,
        'username':signupRequest.username,
        'password':signupRequest.password
      };
      final result=await dioClient.create(signuprequest, "http://localhost:4000/auth/signup");
      print("dataSource ${SignupResponseModel.fromJson(result).toString()}");
      return SignupResponseModel.fromJson(result);
    }
    on DioException catch(e){
      throw Exception(e.response!.data??"Some dio error");
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}