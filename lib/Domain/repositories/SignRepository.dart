import 'package:flutterpolo/Domain/entities/Signup.dart';

abstract class SignupRepository{
  Future<SignupResponse> signup(SignupRequest signupRequest);
}