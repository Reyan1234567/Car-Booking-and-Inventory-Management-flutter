import '../../Data/models/CarModel.dart';

abstract class carRepository{
  Future<List<CarModel>> getCars();
}