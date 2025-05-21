import 'package:flutterpolo/Domain/entities/login.dart';

abstract class LoginRequestRepository{
  Future<LoginResponse> login(LoginRequest loginRequest);
}