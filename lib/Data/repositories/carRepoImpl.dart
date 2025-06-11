import 'package:flutterpolo/Data/models/CarModel.dart';
import 'package:flutterpolo/Domain/entities/Car.dart';
import 'package:flutterpolo/Domain/repositories/CarRepository.dart';

import '../datasources/cars_datasource.dart';

class carRepoImpl extends carRepository{
  final CarsDataSource carsDataS;

  carRepoImpl(this.carsDataS);

  @override
  Future<List<CarModel>> getCars() async {
    try{
      final response= await carsDataS.getCars();
      print("In repoImpl $response");
      return response;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteCar(String id) async {
    await carsDataS.deleteCar(id);
  }

  @override
  Future<CarModel> createCar(CarCreateRequest carData) async {
    return await carsDataS.createCar(carData);
  }

  @override
  Future<CarModel> editCar(String id, CarUpdate updates) async {
    return await carsDataS.editCar(id, updates);
  }
}