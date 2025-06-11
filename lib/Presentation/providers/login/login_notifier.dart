import 'package:riverpod/riverpod.dart';

import '../../../Data/Store/DataSource.dart';
import '../../../Domain/entities/login.dart';
import '../../../Domain/usecases/loginUsecase.dart';
import './login_state.dart';

class LoginNotifier extends StateNotifier<LoginState>{
  final Login login;

  LoginNotifier(this.login):super(LoginState());

  Future<void> loginn(LoginRequest loginRequest) async{
    try{
      // Clear any previous state
      state = LoginState(isLoading: true);
      
      // Make the login request
      final userInfo = await login(loginRequest);
      
      // Store user info
      await Store.setUserInfo(
        userInfo.accessToken, 
        userInfo.refreshToken, 
        userInfo.user.username, 
        userInfo.user.email, 
        userInfo.user.phoneNumber, 
        userInfo.user.lastName, 
        userInfo.user.firstName, 
        userInfo.user.role
      );
      
      // Update state with new response
      state = LoginState(
        isLoading: false,
        loginResponse: userInfo,
        error: null
      );
    }
    catch(e){
      state = LoginState(
        isLoading: false,
        error: e.toString(),
        loginResponse: null
      );
    }
  }
}