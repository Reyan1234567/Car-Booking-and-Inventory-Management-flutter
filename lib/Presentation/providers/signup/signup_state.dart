import 'package:flutterpolo/Domain/entities/Signup.dart';

class SignupState{
  final bool isLoading;
  final SignupResponse? signupResponse;
  final String? error;

  SignupState({this.isLoading=false, this.signupResponse, this.error});

  SignupState copyWith(
      {bool? isLoading, SignupResponse? signupResponse, String? error}){
    return SignupState(isLoading: isLoading??this.isLoading, signupResponse: signupResponse??this.signupResponse, error: error??this.error);
  }
}
