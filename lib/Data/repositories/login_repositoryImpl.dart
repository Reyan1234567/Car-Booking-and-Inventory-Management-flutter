import 'package:flutterpolo/Domain/entities/login.dart';

import '../../Domain/repositories/loginRequestRepository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRequestRepository{
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final loginR={
      'username':loginRequest.username,
      'password':loginRequest.password
    };
    try{
      final result= await loginDataSource.login(loginR);
      return result;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}