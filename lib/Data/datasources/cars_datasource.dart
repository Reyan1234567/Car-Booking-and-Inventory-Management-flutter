import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';

import '../models/CarModel.dart';

class CarsDataSource{
  final DioClient _dio;

  CarsDataSource(this._dio);

  Future<dynamic> getCars()async{
    try{
      final List<dynamic> response = await _dio.get("http://localhost:4000/cars");
      return response.map((car){CarModel.fromJson(car);}).toList();
    }
    on DioException catch(e){
      throw Exception(e.response?.data);
    }
    catch(e){
      print(e.toString());
      return e.toString();
    }
  }
}