import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';

class UserDataSource{
  final  DioClient dioClient;

  UserDataSource(this.dioClient);

  Future<dynamic> getUsers() async {
    try{
      final responseData=dioClient.get("http://localhost:4000/users");
      return "";
    }
    on DioException catch(e){
      throw Exception(e.response?.data.toString()??"Some network error happened");
    }
    catch(e){
      return e.toString();
    }
  }
}