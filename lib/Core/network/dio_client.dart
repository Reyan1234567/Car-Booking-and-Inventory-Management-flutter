import 'package:dio/dio.dart';

class DioClient{
  final Dio dio;

  DioClient(this.dio);

  Future<List<dynamic>> get(String url)async{
    final response=await dio.get(url);
    return response.data;
  }

  Future <void> delete(String url)async{
    await dio.delete(url);
  }

  Future<dynamic> update(Map <String, dynamic> updates, String url)async{
   return await dio.patch(url, data: updates);
  }

  Future<Map<String, dynamic>> create(Map <String, dynamic> creates, String url)async {
    final response=await dio.post(url, data:creates);
    return response.data as Map<String, dynamic>;
  }
}