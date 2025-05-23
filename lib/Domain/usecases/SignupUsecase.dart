import 'package:flutterpolo/Domain/entities/Signup.dart';

import '../repositories/SignRepository.dart';

class SignupUsecase{
  final SignupRepository signupRepository;

  SignupUsecase(this.signupRepository);

  Future<SignupResponse> call({required SignupRequest body}){return signupRepository.signup(body);}
}