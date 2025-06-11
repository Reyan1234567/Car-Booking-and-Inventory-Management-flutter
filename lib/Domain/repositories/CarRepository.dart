import 'package:flutterpolo/Domain/entities/Car.dart';

import '../../Data/models/CarModel.dart';

abstract class carRepository{
  Future<List<CarModel>> getCars();
  Future<void> deleteCar(String id);
  Future<CarModel> createCar(CarCreateRequest carData);
  Future<CarModel> editCar(String id, Map<String, dynamic> updates);
}