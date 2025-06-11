import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';
import 'package:flutterpolo/Domain/usecases/SignupUsecase.dart';
import 'package:flutterpolo/Presentation/providers/signup/signup_state.dart';

import '../../../Data/models/signup_model.dart';

class SignupNotifier extends StateNotifier<SignupState>{
  final SignupUsecase signup;

  SignupNotifier(this.signup):super(SignupState());

  Future<void> Signup(SignupRequestModel signupRequest) async {
    try {
      // Clear any previous state
      state = SignupState(isLoading: true);
      
      // Make the signup request
      final response = await signup(body: signupRequest);
      
      // Update state with success
      state = SignupState(
        isLoading: false,
        signupResponse: response,
        error: null
      );
    } catch (e) {
      // Update state with error
      state = SignupState(
        isLoading: false,
        signupResponse: null,
        error: e.toString()
      );
    }
  }
}