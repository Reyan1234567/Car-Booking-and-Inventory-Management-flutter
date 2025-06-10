import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';

import '../models/CarModel.dart';

class CarsDataSource{
  final DioClient _dio;

  CarsDataSource(this._dio);

  Future<List<CarModel>> getCars() async{
    try{
      print("In getCars");
      final List<dynamic> response = await _dio.get("http://localhost:4000/cars");
      print(response);
      return response.map((car) => CarModel.fromJson(car)).toList();
    }
    on DioException catch(e){
      throw Exception(e.response?.data);
    }
    catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> deleteCar(String id) async {
    await _dio.delete("http://localhost:4000/car/$id");
  }

  Future<CarModel> createCar(Map<String, dynamic> carData) async {
    final response = await _dio.create(carData, "http://localhost:4000/cars");
    return CarModel.fromJson(response['car']);
  }

  Future<CarModel> editCar(String id, Map<String, dynamic> updates) async {
    final response = await _dio.update(updates, "http://localhost:4000/car/$id");
    return CarModel.fromJson(response);
  }
}