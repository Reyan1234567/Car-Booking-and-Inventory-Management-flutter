import 'package:flutterpolo/Domain/entities/login.dart';

class LoginState{
  final bool isLoading;
  final LoginResponse? loginResponse;
  final String? error;

  LoginState({ this.isLoading=false, this.loginResponse, this.error});

  LoginState copyWith({bool? isLoading, LoginResponse? loginResponse, String? error}){
    return LoginState(isLoading:isLoading??this.isLoading, loginResponse:loginResponse??this.loginResponse, error:error);
  }
}