import 'package:riverpod/riverpod.dart';

import '../../../Domain/entities/login.dart';
import '../../../Domain/usecases/loginUsecase.dart';
import './login_state.dart';

class LoginNotifier extends StateNotifier<LoginState>{
    final Login login;

    LoginNotifier(this.login):super(LoginState());

    Future<void> loginn(LoginRequest loginRequest) async{
      try{
        state=state.copyWith(isLoading: true);
        await login(loginRequest);
        state=state.copyWith(isLoading: false);
      }
      catch(e){
        state=state.copyWith(error: e.toString());
      }
    }
}