import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';
import 'package:flutterpolo/Domain/usecases/SignupUsecase.dart';
import 'package:flutterpolo/Presentation/providers/signup/signup_state.dart';

class SignupNotifier extends StateNotifier<SignupState>{
  final SignupUsecase signup;

  SignupNotifier(this.signup):super(SignupState());

  Future<void> Signup(SignupRequest signupBody)async {
    try{
      state=state.copyWith(isLoading: true);
      final response=await signup(body:signupBody);
      state=state.copyWith(isLoading: false, signupResponse: response);
    }
    catch(e){
      state=state.copyWith(error:e.toString());
    }
  }

}