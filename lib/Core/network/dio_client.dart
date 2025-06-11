import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/Interceptor.dart';

class DioClient{
  late final Dio dio;

  DioClient(){
    dio=Dio();
    dio.interceptors.add(DioInterceptor());
  }

  Future<List<dynamic>> get(String url)async{
    final response=await dio.get(url);
    return response.data;
  }

  Future <void> delete(String url)async{
    await dio.delete(url);
  }

  Future<Map<String, dynamic>> update(Map <String, dynamic> updates, String url)async{
   final response = await dio.patch(url, data: updates);
   if (response.data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: "Empty response data for update operation.",
      );
    }
   return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> create(Map <String, dynamic> creates, String url)async {
    final response=await dio.post(url, data:creates);
    return response.data as Map<String, dynamic>;
  }
}