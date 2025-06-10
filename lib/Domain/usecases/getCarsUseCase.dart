import 'package:flutterpolo/Domain/repositories/CarRepository.dart';

import '../../Data/models/CarModel.dart';

class getCars{
  final carRepository carRepo;

  getCars(this.carRepo);

  Future<List<CarModel>> call(){
    return carRepo.getCars();
  }
}

class CreateCar {
  final carRepository repo;
  CreateCar(this.repo);
  Future<CarModel> call(Map<String, dynamic> carData) => repo.createCar(carData);
}

class DeleteCar {
  final carRepository repo;
  DeleteCar(this.repo);
  Future<void> call(String id) => repo.deleteCar(id);
}

class EditCar {
  final carRepository repo;
  EditCar(this.repo);
  Future<CarModel> call(String id, Map<String, dynamic> updates) => repo.editCar(id, updates);
}