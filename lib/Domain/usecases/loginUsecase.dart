import 'package:flutterpolo/Domain/entities/login.dart';

import '../repositories/loginRequestRepository.dart';

class Login{
  final LoginRequestRepository repository;

  Login(this.repository);

  Future<LoginResponse> call(LoginRequest loginRequest)=>repository.login(loginRequest);

}