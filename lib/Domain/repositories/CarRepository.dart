import '../../Data/models/CarModel.dart';

abstract class carRepository{
  Future<List<CarModel>> getCars();
  Future<void> deleteCar(String id);
  Future<CarModel> createCar(Map<String, dynamic> carData);
  Future<CarModel> editCar(String id, Map<String, dynamic> updates);
}