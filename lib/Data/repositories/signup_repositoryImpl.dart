import 'package:flutterpolo/Domain/entities/Signup.dart';

import '../../Domain/repositories/SignRepository.dart';
import '../datasources/signup_datasource.dart';

class SignupRepositoryImpl implements SignupRepository{
  final SignupDatasource signnup;
  SignupRepositoryImpl(this.signnup);

  @override
  Future<SignupResponse> signup(SignupRequest signupRequest) async{
    try{
      return await signnup.signup(signupRequest);
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}