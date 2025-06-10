import 'package:flutterpolo/Domain/repositories/CarRepository.dart';

import '../../Data/models/CarModel.dart';

class getCars{
  final carRepository carRepo;

  getCars(this.carRepo);

  Future<List<CarModel>> call(){
    return carRepo.getCars();
  }
}