import 'package:flutterpolo/Domain/entities/Signup.dart';
import '../../../Data/models/signup_model.dart';

abstract class SignupRepository {
  Future<SignupResponse> signup(SignupRequestModel signupRequest);
}