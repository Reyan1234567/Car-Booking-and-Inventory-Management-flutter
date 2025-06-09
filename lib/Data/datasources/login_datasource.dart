import 'package:dio/dio.dart';
import 'package:flutterpolo/Domain/entities/login.dart';

import '../../Core/network/dio_client.dart';
import '../models/login_model.dart';

class LoginDataSource{
  final DioClient dioClient;

  LoginDataSource(this.dioClient);

  Future<dynamic> login(Map<String, dynamic> json ) async{
    try{
      final responseData = await dioClient.create(json, "http://localhost:4000/auth/signin");
      return (LoginResponseModel.fromJson(responseData));
    }
    on DioException catch(e) {
      throw Exception(e.response?.data??"Some network error");
    }
    catch(e){
      return e.toString();
    }
  }
}