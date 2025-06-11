import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutterpolo/Data/models/signup_model.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';

class SignupDatasource{
  final DioClient dioClient;

  SignupDatasource(this.dioClient);

  @override
  Future<SignupResponseModel> signup(SignupRequestModel signupRequest) async {
    try {
      final signuprequest = {
        'firstname': signupRequest.firstName,
        'lastname': signupRequest.lastName,
        'birthDate': signupRequest.birthDate,
        'phoneNumber': signupRequest.phoneNumber,
        'email': signupRequest.email,
        'username': signupRequest.username,
        'password': signupRequest.password
      };

      final result = await dioClient.create(
        signuprequest, 
        "http://localhost:4000/auth/signup",
      );

      return SignupResponseModel.fromJson(result);
    } on DioException catch(e) {
      if (e.response?.statusCode == 400) {
        throw Exception(e.response?.data?.toString() ?? "Invalid input");
      } else if (e.response?.statusCode == 409) {
        throw Exception("Username or email already exists");
      } else {
        throw Exception("Network error occurred");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}