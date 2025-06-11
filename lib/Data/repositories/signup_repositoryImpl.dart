import 'package:flutterpolo/Domain/entities/Signup.dart';
import '../../Domain/repositories/SignRepository.dart';
import '../datasources/signup_datasource.dart';
import '../models/signup_model.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDatasource signnup;
  SignupRepositoryImpl(this.signnup);

  @override
  Future<SignupResponse> signup(SignupRequestModel signupRequest) async {
    try {
      return await signnup.signup(signupRequest);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}