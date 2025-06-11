import 'package:dio/dio.dart';
import 'package:flutterpolo/Core/network/dio_client.dart';
import 'package:flutterpolo/Domain/entities/Car.dart';
import 'package:flutterpolo/Domain/usecases/getCarsUseCase.dart';

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

  Future<CarModel> createCar(CarCreateRequest carData) async {
    final response = await _dio.create({
      "name": carData.name,
      "make": carData.make,
      "price":carData.price,
      "model":carData.model,
      "year": carData.year,
      "transmissionType": carData.transmissionType,
      "fuelType": carData.fuelType,
      "passengerCapacity": carData.passengerCapacity,
      "luggageCapacity": carData.luggageCapacity,
      "dailyRate": carData.dailyRate,
      "plate": carData.plate,
    }, "http://localhost:4000/cars");
    return CarModel.fromJson(response['car']);
  }

  Future<CarModel> editCar(String id, CarUpdate updates) async {
    Map<String, dynamic> jsonMap={};
    if(updates.plate!=null){
      jsonMap['plate']=updates.plate;
    }
    if(updates.dailyRate!=null){
      jsonMap['dailyRate']=updates.dailyRate;
    }
    if(updates.luggageCapacity!=null){
      jsonMap['luggageCapacity']=updates.luggageCapacity;
    }
    if(updates.passengerCapacity!=null){
      jsonMap['passengerCapacity']=updates.passengerCapacity;
    }
    if(updates.fuelType!=null){
      jsonMap['fuelType']=updates.fuelType;
    }
    if(updates.transmissionType!=null){
      jsonMap['transmissionType']=updates.transmissionType;
    }
    if(updates.year!=null){
      jsonMap['year']=updates.year;
    }
    if(updates.model!=null){
      jsonMap['model']=updates.model;
    }
    if(updates.price!=null){
      jsonMap['price']=updates.price;
    }
    if(updates.make!=null){
      jsonMap['make']=updates.make;
    }
    if(updates.name!=null){
      jsonMap['name']=updates.name;
    }
    if(updates.image!=null){
      jsonMap['image']=updates.image;
    }
    final response = await _dio.update(jsonMap, "http://localhost:4000/cars/$id");
    return CarModel.fromJson(response);
  }
}