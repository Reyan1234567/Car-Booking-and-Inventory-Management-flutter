import 'package:dio/dio.dart';

import '../../Data/Store/DataSource.dart';

class DioInterceptor extends Interceptor{
  late final Dio _dio;
  DioInterceptor(){
    _dio=Dio();
  }
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final token=await Store.getAccessToken();

    if(token!="" && token.isNotEmpty){
      options.headers['Authorization']='Bearer $token';
    }

    options.headers['Content-Type']='application/json';
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler)async{
    final response=err.response;
    final originalRequest=err.requestOptions;

    if(response?.statusCode==401){
      final refreshToken=await Store.getRefreshToken();
      if(refreshToken.toString()!=""){
        final refreshResponse= await _refresh(refreshToken);
         if(refreshResponse.refreshToken!="" && refreshResponse.accessToken!=""){
           await Store.setAccessToken(refreshResponse.accessToken);
           await Store.setRefreshToken(refreshResponse.refreshToken);
           originalRequest.headers["Authorization"]='Bearer ${refreshResponse.accessToken}';
           final retriedResponse=await _dio.fetch(originalRequest);
           return handler.resolve(retriedResponse);
         }
         else{
           await Store.clear();
           return handler.next(err);
         }
      }
      else{
        await Store.clear();
        return handler.next(err);
      }
    }
    else{
      return handler.next(err);
    }
  }

  Future<RefreshResult > _refresh(String refreshToken)async {
    try{
      final response = await _dio.post("/auth/refresh", data: {"refreshToken":refreshToken});
      return RefreshResult (response.data['accessToken'], response.data['refreshToken']);
    }
    catch(e){
      return RefreshResult ("", "");
    }
  }
}

class RefreshResult {
  final String accessToken;
  final String refreshToken;

  RefreshResult(this.accessToken, this.refreshToken);
}