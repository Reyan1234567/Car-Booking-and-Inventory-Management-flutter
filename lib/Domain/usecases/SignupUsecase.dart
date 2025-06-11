import 'package:flutterpolo/Domain/entities/Signup.dart';
import '../repositories/SignRepository.dart';
import '../../../Data/models/signup_model.dart';

class SignupUsecase {
  final SignupRepository signupRepository;

  SignupUsecase(this.signupRepository);

  Future<SignupResponse> call({required SignupRequestModel body}) {
    return signupRepository.signup(body);
  }
}