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
        state=state.copyWith(isLoading: true);
        final userInfo=await login(loginRequest);
        Store.setUserInfo(userInfo.accessToken, userInfo.refreshToken, userInfo.user.username, userInfo.user.email, userInfo.user.phoneNumber, userInfo.user.lastname, userInfo.user.firstname, userInfo.user.role);
        state=state.copyWith(isLoading: false, loginResponse:userInfo);

      }
      catch(e){
        state=state.copyWith(error: e.toString());
      }
    }
}